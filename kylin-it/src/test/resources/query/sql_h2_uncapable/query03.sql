select "TEST_KYLIN_FACT"."CAL_DT" as "CAL_DT"
from "DEFAULT"."TEST_KYLIN_FACT" "TEST_KYLIN_FACT"
where ("TEST_KYLIN_FACT"."CAL_DT" ) >= DATE'2013-01-07' + interval '3' day
group by "TEST_KYLIN_FACT"."CAL_DT" order by "TEST_KYLIN_FACT"."CAL_DT";{"scanRowCount":0,"scanBytes":0,"scanFiles":0,"cuboidId":262144}