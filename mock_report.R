library(mongolite)
library(dplyr)
library(plotly)

# retrieves data from mongdb database
sale <- mongo(collection = "sale", url = "mongodb+srv://rgraue:LoopDLoop@geoffcluster-3sd9t.azure.mongodb.net/report")
custy <- mongo(collection = "custy", url = "mongodb+srv://rgraue:LoopDLoop@geoffcluster-3sd9t.azure.mongodb.net/report")
item <- mongo(collection = "item", url = "mongodb+srv://rgraue:LoopDLoop@geoffcluster-3sd9t.azure.mongodb.net/report")

# organizes mongodb enviroments into r dataframes
sale_data <- sale$find()
custy_data <- custy$find()
item_data <- item$find()

total_sales_per_item <- sale_data %>%
  group_by(item_id) %>%
  summarise(total = n()) %>%
  mutate("prices" = item_data["price"][which(sale_data$item_id == item_data$item_id),]) %>%
  mutate("total price" = total * prices)

total_sales <- total_sales_per_item %>%
  summarise(sum(total_sales_per_item$`total price`)) %>%
  pull()

total_sale_per_custy <- sale_data %>%
  mutate("price" = matcher()) %>%
  group_by(cust_id) %>%
  summarise(sum(price))

n_sale_per_item <- sale_data %>%
  group_by(item_id) %>%
  summarise("total" = n())
  


sale_visual <- plot_dly(
  data = sale,
  x = ~             
                       )


matcher <- function() {
  result <- c()
  for (i in sale_data$item_id) {
    result <- c(result, item_data["price"][which(i == item_data$item_id),])
  }
  return(result)
  
}
