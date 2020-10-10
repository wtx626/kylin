--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

SELECT (CASE WHEN ("TEST_KYLIN_FACT"."LSTG_FORMAT_NAME" IN ('Auction', 'FP-GTC')) THEN 'Auction' ELSE "TEST_KYLIN_FACT"."LSTG_FORMAT_NAME" END) AS "LSTG_FORMAT_NAME__group_",
  SUM("TEST_KYLIN_FACT"."PRICE") AS "sum_PRICE_ok"
FROM "TEST_KYLIN_FACT" "TEST_KYLIN_FACT"
GROUP BY (CASE WHEN ("TEST_KYLIN_FACT"."LSTG_FORMAT_NAME" IN ('Auction', 'FP-GTC')) THEN 'Auction' ELSE "TEST_KYLIN_FACT"."LSTG_FORMAT_NAME" END)
LIMIT 4;{"scanRowCount":0,"scanBytes":0,"scanFiles":0,"cuboidId":14336}