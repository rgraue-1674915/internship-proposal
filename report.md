---
title: "Mock Report"
author: "Ryan Graue"
date: "2/7/2020"
output: html_document
---



## Mock Financial Report

### Starting Data
<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> item_id </th>
   <th style="text-align:left;"> cust_id </th>
   <th style="text-align:left;"> sale_type </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> EB83450225 </td>
   <td style="text-align:left;"> C97262751 </td>
   <td style="text-align:left;"> cash </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EB83450226 </td>
   <td style="text-align:left;"> C97262752 </td>
   <td style="text-align:left;"> visa </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EB83450227 </td>
   <td style="text-align:left;"> C97262753 </td>
   <td style="text-align:left;"> visa </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EB83450228 </td>
   <td style="text-align:left;"> C97262755 </td>
   <td style="text-align:left;"> mastercard </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EB83450227 </td>
   <td style="text-align:left;"> C97262751 </td>
   <td style="text-align:left;"> visa </td>
  </tr>
</tbody>
</table>

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> cust_id </th>
   <th style="text-align:left;"> name </th>
   <th style="text-align:right;"> phone </th>
   <th style="text-align:left;"> address </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> C97262751 </td>
   <td style="text-align:left;"> Ryan Graue4259854941 </td>
   <td style="text-align:right;"> 4259844941 </td>
   <td style="text-align:left;"> 5004 17th ave NE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> C97262752 </td>
   <td style="text-align:left;"> Frank </td>
   <td style="text-align:right;"> 2061234567 </td>
   <td style="text-align:left;"> 1234 N 56st </td>
  </tr>
  <tr>
   <td style="text-align:left;"> C97262753 </td>
   <td style="text-align:left;"> Paul </td>
   <td style="text-align:right;"> 1234567890 </td>
   <td style="text-align:left;"> 3500 stone way N </td>
  </tr>
  <tr>
   <td style="text-align:left;"> C97262755 </td>
   <td style="text-align:left;"> Pete </td>
   <td style="text-align:right;"> 4250001679 </td>
   <td style="text-align:left;"> 45 deerborn ln </td>
  </tr>
</tbody>
</table>

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> item_id </th>
   <th style="text-align:left;"> name </th>
   <th style="text-align:right;"> price </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> EB83450225 </td>
   <td style="text-align:left;"> marker griffon </td>
   <td style="text-align:right;"> 249.99 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EB83450226 </td>
   <td style="text-align:left;"> evo t-shirt </td>
   <td style="text-align:right;"> 19.99 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EB83450227 </td>
   <td style="text-align:left;"> socks </td>
   <td style="text-align:right;"> 12.99 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> EB83450228 </td>
   <td style="text-align:left;"> hydroflask 25oz </td>
   <td style="text-align:right;"> 34.99 </td>
  </tr>
</tbody>
</table>

The data started out in three seperate data tables hosted by mongoDB. It was then brought into R using the mongoLite package, and turned into r dataframes, to begin the data analysis. Bare in mind that this is completely made up data. Meeaning that it in real world applications there would be tens of thousands of onjects with many more fields, allowing for much more complex analysis and solutions.

## Analysis

For this example we can look at very basic analysis for this infomration on sales. Such as the total number of sales, being 5. With 4 customers contributing a total of $330.95.

We can then dive deeper into the data. For example a table bar chart of number of sales per item.




