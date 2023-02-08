**Replication File for "Explaining the Severity of Civil Wars"
Bethany Lacina
Journal of Conflict Resolution
2006**

clear
set more off

**Change the directory in the following line to refer to where you have 
stored the replication data for this paper**

cd "C:\My Computer\Desktop"
use Lacina_JCR_2006_postedJan07.dta

**Generate Figure 1**

hist battledeadbest, frequency bin(200)

**Generate Table 1**

****Statistics for wars before and after the Cold War**

summarize battledeadbest if cw==1, detail
summarize rate if cw==1, detail
summarize dper100k if cw==1, detail
summarize pop if cw==1, detail
summarize battledeadbest if cw==0, detail
summarize rate if cw==0, detail
summarize dper100k if cw==0, detail
summarize pop if cw==0, detail

*****By conflict type**

summarize battledeadbest if secession==0, detail
summarize rate if secession==0, detail
summarize dper100k if secession==0, detail
summarize pop if secession==0, detail

summarize battledeadbest if secession==1, detail
summarize rate if secession==1, detail
summarize dper100k if secession==1, detail
summarize pop if secession==1, detail

**By region**

summarize battledeadbest if region==1, detail
summarize battledeadbest if region==2, detail
summarize battledeadbest if region==3, detail
summarize battledeadbest if region==4, detail
summarize battledeadbest if region==5, detail
summarize battledeadbest if region==6, detail

summarize rate if region==1, detail
summarize rate if region==2, detail
summarize rate if region==3, detail
summarize rate if region==4, detail
summarize rate if region==5, detail
summarize rate if region==6, detail

summarize dper100k if region==1, detail
summarize dper100k if region==2, detail
summarize dper100k if region==3, detail
summarize dper100k if region==4, detail
summarize dper100k if region==5, detail
summarize dper100k if region==6, detail

summarize pop if region==1, detail
summarize pop if region==2, detail
summarize pop if region==3, detail
summarize pop if region==4, detail
summarize pop if region==5, detail
summarize pop if region==6, detail

**Generate Table 2**

regress lnbdb lnduration lnpop lnmilqual lngdp cw lnmountain democ ethnicpolar relpolar
 
regress lnbdb lnduration cw democ ethnicpolar

**Note 12: Checks with low and high estimates**

regress lnbdl lnduration lnpop lnmilqual lngdp cw lnmountain democ ethnicpolar relpolar

regress lnbdh lnduration lnpop lnmilqual lngdp cw lnmountain democ ethnicpolar relpolar

**Note 15: Intervention and Cold War cross tab

tabulate intervention cw

**Note 18: Checks with ethnic and religious fractionalization

regress lnbdb lnduration lnpop lnmilqual lngdp cw lnmountain democ ethfrac relfrac

regress lnbdb lnduration lnpop lnmilqual lngdp cw lnmountain democ ethfrac relfrac

**Note 19: relationship between deaths per year and conflict duration

regress rate duration

regress lnrate lnduration

**Note 20: F-test for importance of GDP and military strength

regress lnbdb lnduration lnmilqual lngdp cw democ ethnicpolar

test lnmilqual lngdp

**Note 21: Checks with gdp and military quality squared

regress lnbdb lnduration lnpop lnmilqual milq2 lngdp cw lnmountain democ ethnicpolar relpolar

regress lnbdb lnduration lnpop lnmilqual lngdp gdpsq cw lnmountain democ ethnicpolar relpolar

**Note 22: exclusion of ethnically homogenous outliers

regress lnbdb lnduration lnpop lnmilqual lngdp cw lnmountain democ ethnicpolar relpolar if (ID~=1960 & ID~=1030 & ID~=2031)

regress lnbdb lnduration cw democ ethnicpolar if (ID~=1960 & ID~=1030 & ID~=2031)
