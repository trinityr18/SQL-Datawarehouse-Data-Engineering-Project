--check for nulls or duplicates in primary key
select cst_id, count(*)
from bronze.crm_cust_info
group by cst_id
having count(*)>1 or cst_id is null

--checck for unwanted spaces
select cst_firstname from
bronze.crm_cust_info
where cst_firstname !=TRIM(cst_firstname)

--data standardization & consistency
select distinct cst_gndr
from bronze.crm_cust_info

select * from bronze.crm_cust_info

select * from bronze.crm_cust_info
