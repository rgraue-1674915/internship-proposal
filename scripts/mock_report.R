library(mongolite)
library(dplyr)
library(plotly)

connected <- !as.logical(system(paste("ping","google.com")))

# retrieves data from mongdb database if connected
if (connected) {
  sale <- mongo(collection = "sale", url = "mongodb+srv://rgraue:LoopDLoop@geoffcluster-3sd9t.azure.mongodb.net/report")
  custy <- mongo(collection = "custy", url = "mongodb+srv://rgraue:LoopDLoop@geoffcluster-3sd9t.azure.mongodb.net/report")
  item <- mongo(collection = "item", url = "mongodb+srv://rgraue:LoopDLoop@geoffcluster-3sd9t.azure.mongodb.net/report")
  
  # organizes mongodb enviroments into r dataframes
  sale_data <- sale$find()
  custy_data <- custy$find()
  item_data <- item$find()
}else{ # Retrieves local csv files if no inernet connection
  sale_data <- read.csv("../files/sales_data.csv", stringsAsFactors = F)
  custy_data <- read.csv("../files/customer_data.csv", stringsAsFactors = F)
  item_data <- read.csv("../files/items_data.csv", stringsAsFactors = F)
}

# finds appropriate items across dataframes
matcher <- function() {
  result <- c()
  for (i in sale_data$item_id) {
    result <- c(result, item_data["price"][which(i == item_data$item_id),])
  }
  return(result)
}

# returns a table of the price of all items and their sales
total_sales_per_item <- sale_data %>%
  group_by(item_id) %>%
  summarise(total = n()) %>%
  mutate("prices" = item_data["price"][which(sale_data$item_id == item_data$item_id),]) %>%
  mutate("total price" = total * prices)

# total sales of each item
total_sales <- total_sales_per_item %>%
  summarise(sum(total_sales_per_item$`total price`)) %>%
  pull()

# total sales per customer
total_sale_per_custy <- sale_data %>%
  mutate("price" = matcher()) %>%
  group_by(cust_id) %>%
  summarise(sum(price))

# number sales per item
n_sale_per_item <- sale_data %>%
  group_by(item_id) %>%
  summarise("total" = n())
  
# returns simple bar chart of sales per item
item_sale_visual <- plot_ly(
  data = total_sales_per_item,
  x = ~item_id,
  y = ~total,
  type = "bar",
  marker = list(color = 'rgb(0,132,0)',
                line = list(color = 'rgb(8,48,107)',
                            width = 1.5))
) %>%
  layout(
    title = "Number of sales per Item",
    xaxis = list(title = "Item EB code"),
    yaxis = list(title = "NUmber of items sold")
  )



