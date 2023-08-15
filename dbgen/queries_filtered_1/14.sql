-- $ID$
-- TPC-H/TPC-R Promotion Effect Query (Q14)
-- Functional Query Definition
-- Approved February 1998
:x
:o


select
	100.00 * sum(case
		when p_type like 'PROMO%'
			then l_extendedprice * (1 - l_discount)
		else 0
	end) / sum(l_extendedprice * (1 - l_discount)) as promo_revenue
from
	lineitem,
	part
where
	l_partkey < 100 and
	l_partkey = p_partkey
	and l_shipdate >= cast(':1' as datetime)
	and l_shipdate < dateadd(mm, 1, cast(':1' as datetime));
