
*-------------------------------------------------------------------------------
* Load data and produce income ranks from income in dollars
*-------------------------------------------------------------------------------

cap cd "C:\Users\frank\OneDrive\1. Freshman\ECON50\EmpProj1Part2"

* Prepare a log file
cap log close
log using "DagostinoLogEmpPart2.log", replace

* Change Stata working directory
* Use drop down menu: file, change working directly

* Load in cleaned atlas data 
use atlas, clear

list kfr_pooled_pooled_p25 if state == 34 & county == 029  & tract == 722002

* Determine mean for different parameters for each tract

* Toms River
sum kfr_pooled_pooled_p25 if state == 34 & county == 029  & tract == 722002
* Lakewood
sum kfr_pooled_pooled_p25 if state == 34 & county == 029  & tract == 715700
* Manchester
sum kfr_pooled_pooled_p25 if state == 34 & county == 029  & tract == 720205

* Toms River
sum popdensity2010 if state == 34 & county == 029  & tract == 722002
* Lakewood
sum popdensity2010 if state == 34 & county == 029  & tract == 715700
* Manchester
sum popdensity2010 if state == 34 & county == 029  & tract == 720205

* Toms River
sum frac_coll_plus2010 if state == 34 & county == 029  & tract == 722002
* Lakewood
sum frac_coll_plus2010 if state == 34 & county == 029  & tract == 715700
* Manchester
sum frac_coll_plus2010 if state == 34 & county == 029  & tract == 720205

* Toms River
sum poor_share2010 if state == 34 & county == 029  & tract == 722002
* Lakewood
sum poor_share2010 if state == 34 & county == 029  & tract == 715700
* Manchester
sum poor_share2010 if state == 34 & county == 029  & tract == 720205

* tract: 715700 = Lakewood
* tract: 720205 = Manchester
* tract: 722002 = Toms River

* Determine covariates

gen countyPooled = kfr_pooled_pooled_p25 if state == 34 & county == 029

gen countyBlack = kfr_black_pooled_p25 if state == 34 & county == 029
gen countyWhite = kfr_white_pooled_p25 if state == 34 & county == 029
gen countyHisp = kfr_hisp_pooled_p25 if state == 34 & county == 029


*Install Michael Droste's software
net install corrplot, from(https://raw.githubusercontent.com/mdroste/stata-corrplot/master/) replace force

* Create corr plots for each racial group

corrplot countyPooled popdensity2000 popdensity2010 poor_share2010 poor_share2000 poor_share1990 gsmn_math_g3_2013 mail_return_rate2010 ln_wage_growth_hs_grad mean_commutetime2000 frac_coll_plus2010 frac_coll_plus2000 foreign_share2010 singleparent_share2010 singleparent_share2000 singleparent_share1990

corrplot countyBlack popdensity2000 popdensity2010 poor_share2010 poor_share2000 poor_share1990 gsmn_math_g3_2013 mail_return_rate2010 ln_wage_growth_hs_grad mean_commutetime2000 frac_coll_plus2010 frac_coll_plus2000 foreign_share2010 singleparent_share2010 singleparent_share2000 singleparent_share1990

corrplot countyWhite popdensity2000 popdensity2010 poor_share2010 poor_share2000 poor_share1990 gsmn_math_g3_2013 mail_return_rate2010 ln_wage_growth_hs_grad mean_commutetime2000 frac_coll_plus2010 frac_coll_plus2000 foreign_share2010 singleparent_share2010 singleparent_share2000 

corrplot countyHisp popdensity2000 popdensity2010 poor_share2010 poor_share2000 poor_share1990 gsmn_math_g3_2013 mail_return_rate2010 ln_wage_growth_hs_grad mean_commutetime2000 frac_coll_plus2010 frac_coll_plus2000 foreign_share2010 singleparent_share2010 singleparent_share2000 singleparent_share1990