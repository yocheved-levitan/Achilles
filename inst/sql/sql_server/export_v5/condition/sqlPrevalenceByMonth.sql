  select c1.concept_id as concept_id,  
    c1.concept_name as concept_name,
  	num.stratum_2 as x_calendar_month,   -- calendar year, note, there could be blanks
  	round(1000*(1.0*num.count_value/denom.count_value),5) as y_prevalence_1000pp  --prevalence, per 1000 persons
  from 
  	(select * from ACHILLES_results where analysis_id = 402) num
  	inner join
  	(select * from ACHILLES_results where analysis_id = 117) denom
  	on num.stratum_2 = denom.stratum_1  --calendar year
  	inner join
  	@cdm_database_schema.concept c1
  	on CAST(num.stratum_1 AS INT) = c1.concept_id
ORDER BY CAST(num.stratum_2 as INT)