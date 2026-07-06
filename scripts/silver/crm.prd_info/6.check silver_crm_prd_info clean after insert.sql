
--check for nulls or duplicates in primary key
select prd_id, count(*)
from silver.crm_prd_info
group by prd_id
having count(*)>1 or prd_id is null

--checck for unwanted spaces
select prd_nm from
silver.crm_prd_info
where prd_nm !=TRIM(prd_nm)

--check nulls or negative no.
select prd_cost
from silver.crm_prd_info
where prd_cost<0 or prd_cost is null


--data standardization & consistency
select distinct prd_line
from silver.crm_prd_info

--check for invalid date orders
select * from silver.crm_prd_info
where prd_end_dt<prd_start_dt

select * from silver.crm_prd_info
