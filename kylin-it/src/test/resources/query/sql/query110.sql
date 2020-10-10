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
SELECT  TEST_KYLIN_FACT.CAL_DT as TEST_KYLIN_FACT_CAL_DT,
        TEST_KYLIN_FACT.ORDER_ID as TEST_KYLIN_FACT_ORDER_ID,
        TEST_ORDER.TEST_DATE_ENC as TEST_ORDER_TEST_DATE_ENC,
        TEST_ORDER.TEST_TIME_ENC as TEST_ORDER_TEST_TIME_ENC,
        TEST_KYLIN_FACT.LEAF_CATEG_ID as TEST_KYLIN_FACT_LEAF_CATEG_ID,
        TEST_KYLIN_FACT.LSTG_SITE_ID as TEST_KYLIN_FACT_LSTG_SITE_ID,
        TEST_CATEGORY_GROUPINGS.META_CATEG_NAME as TEST_CATEGORY_GROUPINGS_META_CATEG_NAME,
        TEST_CATEGORY_GROUPINGS.CATEG_LVL2_NAME as TEST_CATEGORY_GROUPINGS_CATEG_LVL2_NAME,
        TEST_CATEGORY_GROUPINGS.CATEG_LVL3_NAME as TEST_CATEGORY_GROUPINGS_CATEG_LVL3_NAME,
        TEST_KYLIN_FACT.LSTG_FORMAT_NAME as TEST_KYLIN_FACT_LSTG_FORMAT_NAME,
        TEST_KYLIN_FACT.SLR_SEGMENT_CD as TEST_KYLIN_FACT_SLR_SEGMENT_CD,
        TEST_KYLIN_FACT.SELLER_ID as TEST_KYLIN_FACT_SELLER_ID,
        SELLER_ACCOUNT.ACCOUNT_BUYER_LEVEL as SELLER_ACCOUNT_ACCOUNT_BUYER_LEVEL,
        SELLER_ACCOUNT.ACCOUNT_SELLER_LEVEL as SELLER_ACCOUNT_ACCOUNT_SELLER_LEVEL,
        SELLER_ACCOUNT.ACCOUNT_COUNTRY as SELLER_ACCOUNT_ACCOUNT_COUNTRY,
        SELLER_COUNTRY.NAME as SELLER_COUNTRY_NAME,
        TEST_ORDER.BUYER_ID as TEST_ORDER_BUYER_ID,
        BUYER_ACCOUNT.ACCOUNT_BUYER_LEVEL as BUYER_ACCOUNT_ACCOUNT_BUYER_LEVEL,
        BUYER_ACCOUNT.ACCOUNT_SELLER_LEVEL as BUYER_ACCOUNT_ACCOUNT_SELLER_LEVEL,
        BUYER_ACCOUNT.ACCOUNT_COUNTRY as BUYER_ACCOUNT_ACCOUNT_COUNTRY,
        year(TEST_KYLIN_FACT.CAL_DT) as TEST_KYLIN_FACT_DEAL_YEAR
        FROM "DEFAULT".TEST_KYLIN_FACT as TEST_KYLIN_FACT
        LEFT JOIN "DEFAULT".TEST_ORDER as TEST_ORDER
        ON TEST_KYLIN_FACT.ORDER_ID = TEST_ORDER.ORDER_ID
        LEFT JOIN EDW.TEST_CAL_DT as TEST_CAL_DT
        ON TEST_KYLIN_FACT.CAL_DT = TEST_CAL_DT.CAL_DT
        LEFT JOIN "DEFAULT".TEST_CATEGORY_GROUPINGS as TEST_CATEGORY_GROUPINGS
        ON TEST_KYLIN_FACT.LEAF_CATEG_ID = TEST_CATEGORY_GROUPINGS.LEAF_CATEG_ID AND TEST_KYLIN_FACT.LSTG_SITE_ID = TEST_CATEGORY_GROUPINGS.SITE_ID
        LEFT JOIN EDW.TEST_SITES as TEST_SITES
        ON TEST_KYLIN_FACT.LSTG_SITE_ID = TEST_SITES.SITE_ID
        LEFT JOIN EDW.TEST_SELLER_TYPE_DIM as TEST_SELLER_TYPE_DIM
        ON TEST_KYLIN_FACT.SLR_SEGMENT_CD = TEST_SELLER_TYPE_DIM.SELLER_TYPE_CD
        LEFT JOIN "DEFAULT".TEST_ACCOUNT as SELLER_ACCOUNT
        ON TEST_KYLIN_FACT.SELLER_ID = SELLER_ACCOUNT.ACCOUNT_ID
        LEFT JOIN "DEFAULT".TEST_ACCOUNT as BUYER_ACCOUNT
        ON TEST_ORDER.BUYER_ID = BUYER_ACCOUNT.ACCOUNT_ID
        LEFT JOIN "DEFAULT".TEST_COUNTRY as SELLER_COUNTRY
        ON SELLER_ACCOUNT.ACCOUNT_COUNTRY = SELLER_COUNTRY.COUNTRY
        LEFT JOIN "DEFAULT".TEST_COUNTRY as BUYER_COUNTRY
        ON BUYER_ACCOUNT.ACCOUNT_COUNTRY = BUYER_COUNTRY.COUNTRY
        WHERE 1=1;{"scanRowCount":0,"scanBytes":0,"scanFiles":0,"cuboidId":2097151}