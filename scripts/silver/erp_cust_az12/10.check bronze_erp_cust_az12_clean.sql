
-- check foreign key 
select * from [bronze].[erp_cust_az12] where cid like'%AW00011000%'



--identify out of range dates
select distinct bdate
from [bronze].[erp_cust_az12]
where bdate<'1924-01-01' or bdate>GETDATE()

--data standardization & consistency
select distinct gen 
from [bronze].[erp_cust_az12]

