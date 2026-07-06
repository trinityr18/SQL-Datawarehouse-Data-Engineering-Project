insert into silver.crm_cust_info(
    cst_id,             
    cst_key  ,          
    cst_firstname  ,    
    cst_lastname  ,    
    cst_marital_status ,
    cst_gndr    ,       
    cst_create_date    
   
    )
select 
cst_id,             
    cst_key,            
    trim(cst_firstname),      
    trim(cst_lastname),
      case when upper(trim(cst_marital_status))='S' THEN 'Single'
        when upper(trim(cst_marital_status))='M' then 'Married'
        else 'n/a'
    end cst_marital_status ,    
    case when upper(trim(cst_gndr))='F' THEN 'Female'
        when upper(trim(cst_gndr))='M' then 'Male'
        else 'n/a'
    end  cst_gndr,
    cst_create_date   
    
from(
select * ,
ROW_NUMBER() over(partition by cst_id order by cst_create_date desc) as flag_last
from [bronze].[crm_cust_info] where cst_id is not null)t
where flag_last=1;


