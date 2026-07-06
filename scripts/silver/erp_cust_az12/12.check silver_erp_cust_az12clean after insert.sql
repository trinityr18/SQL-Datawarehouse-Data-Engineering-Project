-- check foreign key 
select * from [silver].[erp_cust_az12] where cid like'%AW00011000%'

--identify out of range dates
select distinct bdate
from [silver].[erp_cust_az12]
where bdate<'1924-01-01' or bdate>GETDATE()

--data standardization & consistency
select distinct gen 
from [silver].[erp_cust_az12]

select * from [silver].[erp_cust_az12]
