--check for nulls or duplicates in primary key
select cst_id, count(*)
from silver.crm_cust_info
group by cst_id
having count(*)>1 or cst_id is null

--checck for unwanted spaces
select cst_firstname from
silver.crm_cust_info
where cst_firstname !=TRIM(cst_firstname)

--data standardization & consistency
select distinct cst_gndr
from silver.crm_cust_info
