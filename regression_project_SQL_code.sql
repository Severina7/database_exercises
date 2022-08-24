USE zillow;
SELECT * FROM properties_2017 LIMIT 100;
DESCRIBE properties_2017;
SELECT count(*) AS Numberofcolumns FROM properties_2017.columns
WHERE table_name = Numberofcolumns;
SELECT * FROM propertylandusetype;
SELECT * FROM properties_2017 WHERE propertylandusetypeid = '261' LIMIT 100;
DESCRIBE predictions_2017;
SELECT * FROM predictions_2017 WHERE transactiondate = '2017-9-%';
SELECT * FROM properties_2017 LIMIT 100;
SELECT 
                       bedroomcnt,
                       bathroomcnt,
                       calculatedfinishedsquarefeet,
                       taxvaluedollarcnt,
                       yearbuilt,
                       taxamount,
                       fips,
                       propertylandusetypeid,
                       transactiondate
                FROM properties_2017
                JOIN propertylandusetype USING(propertylandusetypeid)
                JOIN predictions_2017 USING(parcelid)
                WHERE propertylandusetypeid = '261';
                