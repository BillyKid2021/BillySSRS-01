create proc [SalesByCountry] @country varchar(50)
as
SELECT dim_customer.name, dim_customer.city, dim_customer.country, dim_product.name AS Expr1, dim_product.description, dim_date.date, fact_product_sales.sales_value, fact_product_sales.margin
FROM   dim_customer INNER JOIN
fact_product_sales ON dim_customer.customer_key = fact_product_sales.customer_key INNER JOIN
dim_product ON fact_product_sales.product_key = dim_product.product_key INNER JOIN
dim_date ON fact_product_sales.sales_date_key = dim_date.date_key
where dim_customer.country like @country or @country is null