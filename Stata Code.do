clear all
log close _all
log using "ECO 475 Research Paper.log", replace text
cd "C:\Users\takaha62\Downloads"

use ECO475_UpdatedResearchData.dta
gen labourforce_st = labourforce/10000

xtset country year
reg gdp_pcp unemp_rate lifeexpct labourforce_st compulsory_years internetusers_per100 yr2001 yr2002 yr2003 yr2004 yr2005 yr2006 yr2007 yr2008 yr2009 yr2010 yr2011 yr2012 yr2013 yr2014 yr2015, rob
reg D.(gdp_pcp unemp_rate lifeexpct labourforce_st compulsory_years internetusers_per100), rob
xtreg gdp_pcp unemp_rate lifeexpct labourforce_st compulsory_years internetusers_per100 yr2001 yr2002 yr2003 yr2004 yr2005 yr2006 yr2007 yr2008 yr2009 yr2010 yr2011 yr2012 yr2013 yr2014 yr2015, cluster(country) fe
xtreg gdp_pcp unemp_rate lifeexpct labourforce_st compulsory_years internetusers_per100 yr2001 yr2002 yr2003 yr2004 yr2005 yr2006 yr2007 yr2008 yr2009 yr2010 yr2011 yr2012 yr2013 yr2014 yr2015, cluster(country) re

qui xtreg gdp_pcp unemp_rate lifeexpct labourforce_st compulsory_years internetusers_per100 yr2001 yr2002 yr2003 yr2004 yr2005 yr2006 yr2007 yr2008 yr2009 yr2010 yr2011 yr2012 yr2013 yr2014 yr2015, fe
estimates store b_fe
qui xtreg gdp_pcp unemp_rate lifeexpct labourforce_st compulsory_years internetusers_per100 yr2001 yr2002 yr2003 yr2004 yr2005 yr2006 yr2007 yr2008 yr2009 yr2010 yr2011 yr2012 yr2013 yr2014 yr2015, re
estimates store b_re
hausman b_fe b_re

