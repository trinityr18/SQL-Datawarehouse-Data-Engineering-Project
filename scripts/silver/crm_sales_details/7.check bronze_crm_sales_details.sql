--checck for unwanted spaces
select * from [bronze].[crm_sales_details] where sls_ord_num !=TRIM(sls_ord_num)

-- Data integrity of sls_prd_key,cust_id
select * from [bronze].[crm_sales_details] where sls_prd_key not in (select prd_key from [silver].[crm_prd_info])
select * from [bronze].[crm_sales_details] where sls_cust_id not in (select prd_key from [silver].[crm_prd_info])

--date columns
select sls_order_dt from [bronze].[crm_sales_details] 
where sls_order_dt<=0 
or len(sls_order_dt)!=8 
or sls_order_dt>20500101
or sls_order_dt<19000101

--check for invalid date columns
select * from [bronze].[crm_sales_details]
where sls_order_dt>sls_ship_dt or sls_order_dt>sls_due_dt

--check data consistency between sales=qty*price. value must not be null,0 or negative
select * from [bronze].[crm_sales_details]
where sls_sales != sls_quantity * sls_price
or sls_sales is null or sls_quantity is null or sls_price is null
or sls_sales<=0 or sls_quantity <=0 or sls_price <=0
order by sls_sales,sls_quantity,sls_price


select * from [bronze].[crm_sales_details]
