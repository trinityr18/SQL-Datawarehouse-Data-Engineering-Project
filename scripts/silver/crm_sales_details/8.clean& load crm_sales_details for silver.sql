Insert into silver.crm_sales_details(
sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price
)


SELECT [sls_ord_num],[sls_prd_key],[sls_cust_id],
      CASE WHEN sls_order_dt=0 or len(sls_order_dt)!=8 then NULL
      ELSE CAST(CAST(sls_order_dt as varchar) as date)
      end as [sls_order_dt],
      
      CASE WHEN sls_ship_dt=0 or len(sls_ship_dt)!=8 then NULL
        ELSE CAST(CAST(sls_ship_dt as varchar) as date)
        end as [sls_ship_dt],
      
       CASE WHEN sls_due_dt=0 or len(sls_due_dt)!=8 then NULL
       ELSE CAST(CAST(sls_due_dt as varchar) as date)
       end as [sls_due_dt],    
      
        case when sls_sales is null or sls_sales<=0 or sls_sales!=abs(sls_quantity)*sls_price
	    then sls_quantity*abs(sls_price)
	    else sls_sales
        end sls_sales,

        [sls_quantity],

       case when sls_price is null or sls_price<=0
       then sls_sales/nullif(sls_quantity,0)
       else sls_price
       end sls_price
  
  FROM [DataWarehouse].[bronze].[crm_sales_details]
