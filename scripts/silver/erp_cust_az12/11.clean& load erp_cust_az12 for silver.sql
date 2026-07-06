Insert into [silver].[erp_cust_az12](
	cid,
    bdate,
    gen        

)
select 
case when cid like 'NAS%' THEN SUBSTRING(cid,4,len(cid))
	ELSE cid
	END cid,

	CASE WHEN bdate>GETDATE() then NULL
	else bdate
	end bdate,

	case when upper(trim(gen)) in ('F','Female') then 'Female'
		when upper(trim(gen)) in ('M','Male') then 'Male'
		else 'n/a'
	end gen

from [bronze].[erp_cust_az12]

