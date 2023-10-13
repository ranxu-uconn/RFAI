**********code to reproduce results
use "census tract level.dta"
****Food activity patterns
reg log_meddist rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 LILATracts_halfAnd10 Urban log_percap_visit2 log_popdensity
reg log_meddist rpl_theme1 rpl_theme2 d_white d_hispanic d_black rpl_theme4 LILATracts_halfAnd10 Urban log_percap_visit2 log_popdensity
qreg med_dist rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 LILATracts_halfAnd10 Urban log_percap_visit2 log_popdensity
qreg med_dist rpl_theme1 rpl_theme2 d_white d_hispanic d_black rpl_theme4 LILATracts_halfAnd10 Urban log_percap_visit2 log_popdensity

****factors predicting mRFEI and RFAI
reg hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 LILATracts_halfAnd10 Urban log_percap_visit2 log_popdensity
reg hei3 rpl_theme1 rpl_theme2 d_white d_hispanic d_black rpl_theme4 LILATracts_halfAnd10 Urban log_percap_visit2 log_popdensity
reg mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 LILATracts_halfAnd10 Urban log_percap_visit2 log_popdensity
reg mrfei rpl_theme1 rpl_theme2 d_white d_hispanic d_black rpl_theme4 LILATracts_halfAnd10 Urban log_percap_visit2 log_popdensity

****Associations with cardiometabolic disease prevalence
reg bphigh_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg bphigh_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg bphigh_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg chd_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg chd_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg chd_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg diabetes_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg diabetes_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg diabetes_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg obesity_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg obesity_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg obesity_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore
reg highchol_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore 
reg highchol_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore 
reg highchol_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore 

**by race and ethnicity
gen race=1 if d_white==1
replace race=2 if d_black==1
replace race=3 if d_hispanic==1
replace race=4 if d_white==0& d_hispanic==0& d_black==0

reg bphigh_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==1
reg bphigh_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==2
reg bphigh_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==3
reg bphigh_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==4
reg bphigh_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==1
reg bphigh_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==2
reg bphigh_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==3
reg bphigh_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==4

reg chd_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==1
reg chd_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==2
reg chd_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==3
reg chd_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==4
reg chd_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==1
reg chd_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==2
reg chd_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==3
reg chd_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==4


reg diabetes_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==1
reg diabetes_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==2
reg diabetes_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==3
reg diabetes_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==4
reg diabetes_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==1
reg diabetes_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==2
reg diabetes_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==3
reg diabetes_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==4

reg obesity_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==1
reg obesity_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==2
reg obesity_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==3
reg obesity_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==4
reg obesity_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==1
reg obesity_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==2
reg obesity_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==3
reg obesity_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==4

reg highchol_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==1
reg highchol_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==2
reg highchol_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==3
reg highchol_crudeprev mrfei rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==4
reg highchol_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==1
reg highchol_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban  lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==2
reg highchol_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==3
reg highchol_crudeprev hei3 rpl_theme1 rpl_theme2  rpl_theme4 Urban lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percap_visit log_totalstore if race==4



**county level analysis
use "county level.dta"
spset countyfips 
spset, modify coord( intptlat intptlong )
spset, modify coordsys(latlong, miles)
spmatrix create idistance Idist

spregress obesity_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress highchol_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress bphigh_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress chd_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress diabetes_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
regress obesity_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store
regress highchol_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store
regress bphigh_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store
regress chd_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store
regress diabetes_crudeprev hei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store

spregress obesity_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress highchol_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress bphigh_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress chd_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress diabetes_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
reg obesity_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store 
reg highchol_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store 
reg bphigh_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store 
reg chd_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store 
reg diabetes_crudeprev mrfei rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store 

spregress obesity_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress highchol_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress bphigh_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress chd_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
spregress diabetes_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store , gs2sls  errorlag(Idist) force
reg obesity_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store 
reg highchol_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store 
reg bphigh_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store 
reg chd_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store 
reg diabetes_crudeprev sg_mrfei3 rpl_theme1 rpl_theme2 rpl_theme3 rpl_theme4 Urban minorpct lowincpct lesshspct under5pct over64pct femalepct mediahhincome log_percapvisit log_store 

