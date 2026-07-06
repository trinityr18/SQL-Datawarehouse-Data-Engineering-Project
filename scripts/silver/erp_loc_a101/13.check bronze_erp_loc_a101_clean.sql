select * from [bronze].[erp_loc_a101]

--check foreign key
select cst_key from [silver].[crm_cust_info]

--data standardization & consistency
select distinct cntry
from [bronze].[erp_loc_a101]
order by cntry
