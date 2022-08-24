USE zillow;

SELECT DISTINCT * FROM properties_2017
    LEFT JOIN propertylandusetype USING (propertylandusetypeid)
    LEFT JOIN predictions_2017 USING (parcelid)
    LEFT JOIN airconditioningtype USING (airconditioningtypeid)
    LEFT JOIN architecturalstyletype USING (architecturalstyletypeid)
    LEFT JOIN buildingclasstype USING (buildingclasstypeid)
    LEFT JOIN heatingorsystemtype USING (heatingorsystemtypeid)
    LEFT JOIN storytype USING (storytypeid)
    LEFT JOIN typeconstructiontype USING (typeconstructiontypeid)
    LEFT JOIN unique_properties USING (parcelid)
    WHERE propertylandusedesc = 'Condominium' OR 'Single Family Residential' OR 'Townhouse' OR 'Cluster Home' OR 'Bungalow'
    OR 'Patio Home' AND longitude  IS NOT NULL AND latitude IS NOT NULL
    AND transactiondate BETWEEN '2017-01-01' AND '2017-12-31';
    
SELECT DISTINCT *,
				pred17.logerror,
				pred17.transactiondate,
				acd.airconditioningdesc,
				asd.architecturalstyledesc,
				bcd.buildingclassdesc,
				hsd.heatingorsystemdesc,
				sd.storydesc,
				tcd.typeconstructiondesc
                FROM properties_2017 AS p17
                LEFT JOIN predictions_2017 AS pred17 USING (parcelid)
                LEFT JOIN propertylandusetype AS plut USING (propertylandusetypeid)
                LEFT JOIN airconditioningtype AS acd USING (airconditioningtypeid)
                LEFT JOIN architecturalstyletype AS asd USING (architecturalstyletypeid)
                LEFT JOIN buildingclasstype AS bcd USING (buildingclasstypeid)
                LEFT JOIN heatingorsystemtype AS hsd USING (heatingorsystemtypeid)
                LEFT JOIN storytype AS sd USING (storytypeid)
                LEFT JOIN typeconstructiontype AS tcd USING (typeconstructiontypeid)
                WHERE plut.propertylandusedesc = 'Condominium' OR 'Single Family Residential'
				OR 'Townhouse' OR 'Cluster Home' OR 'Bungalow' OR 'Patio Home'
                AND longitude IS NOT NULL
                AND latitude IS NOT NULL;

SELECT * FROM predictions_2017;
SELECT COUNT(logerror) FROM predictions_2017;
  