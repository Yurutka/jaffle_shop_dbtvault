select customer_pk,first_name,last_name,email,effective_from
, coalesce(nullif(Lead(effective_from) OVER (PARTITION BY customer_pk ORDER BY customer_pk,effective_from),effective_from),'9999-12-31 00:00:00') as effective_to
from dbt.sat_customer_details
order by customer_pk,effective_from