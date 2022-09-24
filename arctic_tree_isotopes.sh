#!/bin/bash

# bash script for correlating with 20CRv3c data
# download rhum.2m., air.2m., prate., prmsl., snowc. of the 20CRv3 ensemble mean
# change folder structure according to where the 20CR and the PCA data is

cd /Volumes/SPARK/olga_tree_isotopes/ # change folder here

cdo -L -b 32 selyear,1901/2000 air.2m.mon.mean.nc air.2m.mon.mean_19012000.nc

cdo -L -b 32 selyear,1901/2000 rhum.2m.mon.mean.nc rhum.2m.mon.mean_19012000.nc

cdo -L -b 32 selyear,1901/2000 prmsl.mon.mean.nc prmsl.mon.mean_19012000.nc

cdo -L -b 32 selyear,1901/2000 prate.mon.mean.nc prate.mon.mean_19012000.nc

cdo -L -b 32 selyear,1901/2000 snowc.mon.mean.nc snowc.mon.mean_19012000.nc

cdo -L -b 32 sub -yearmean -selmon,1,2 air.2m.mon.mean_19012000.nc -timmean -selmon,1,2 air.2m.mon.mean_19012000.nc air.2m.mon.mean_19012000_anoms_JF.nc 
cdo -L -b 32 sub -yearmean -selmon,4,5 air.2m.mon.mean_19012000.nc -timmean -selmon,1,2 air.2m.mon.mean_19012000.nc air.2m.mon.mean_19012000_anoms_AM.nc 
cdo -L -b 32 sub -yearmean -selmon,6,7 air.2m.mon.mean_19012000.nc -timmean -selmon,1,2 air.2m.mon.mean_19012000.nc air.2m.mon.mean_19012000_anoms_JJ.nc 
cdo -L -b 32 sub -yearmean -selmon,9,10 air.2m.mon.mean_19012000.nc -timmean -selmon,1,2 air.2m.mon.mean_19012000.nc air.2m.mon.mean_19012000_anoms_SO.nc 

cdo -L -b 32 sub -yearmean -selmon,1,2 prate.mon.mean_19012000.nc -timmean -selmon,1,2 prate.mon.mean_19012000.nc prate.mon.mean_19012000_anoms_JF.nc 
cdo -L -b 32 sub -yearmean -selmon,4,5 prate.mon.mean_19012000.nc -timmean -selmon,1,2 prate.mon.mean_19012000.nc prate.mon.mean_19012000_anoms_AM.nc 
cdo -L -b 32 sub -yearmean -selmon,6,7 prate.mon.mean_19012000.nc -timmean -selmon,1,2 prate.mon.mean_19012000.nc prate.mon.mean_19012000_anoms_JJ.nc 
cdo -L -b 32 sub -yearmean -selmon,9,10 prate.mon.mean_19012000.nc -timmean -selmon,1,2 prate.mon.mean_19012000.nc prate.mon.mean_19012000_anoms_SO.nc 

cdo -L -b 32 sub -yearmean -selmon,1,2 prmsl.mon.mean_19012000.nc -timmean -selmon,1,2 prmsl.mon.mean_19012000.nc prmsl.mon.mean_19012000_anoms_JF.nc 
cdo -L -b 32 sub -yearmean -selmon,4,5 prmsl.mon.mean_19012000.nc -timmean -selmon,1,2 prmsl.mon.mean_19012000.nc prmsl.mon.mean_19012000_anoms_AM.nc 
cdo -L -b 32 sub -yearmean -selmon,6,7 prmsl.mon.mean_19012000.nc -timmean -selmon,1,2 prmsl.mon.mean_19012000.nc prmsl.mon.mean_19012000_anoms_JJ.nc 
cdo -L -b 32 sub -yearmean -selmon,9,10 prmsl.mon.mean_19012000.nc -timmean -selmon,1,2 prmsl.mon.mean_19012000.nc prmsl.mon.mean_19012000_anoms_SO.nc 

cdo -L -b 32 sub -yearmean -selmon,1,2 snowc.mon.mean_19012000.nc -timmean -selmon,1,2 snowc.mon.mean_19012000.nc snowc.mon.mean_19012000_anoms_JF.nc 
cdo -L -b 32 sub -yearmean -selmon,4,5 snowc.mon.mean_19012000.nc -timmean -selmon,1,2 snowc.mon.mean_19012000.nc snowc.mon.mean_19012000_anoms_AM.nc 

cdo -L -b 32 sub -yearmean -selmon,1,2 rhum.2m.mon.mean_19012000.nc -timmean -selmon,1,2 rhum.2m.mon.mean_19012000.nc rhum.2m.mon.mean_19012000_anoms_JF.nc 
cdo -L -b 32 sub -yearmean -selmon,4,5 rhum.2m.mon.mean_19012000.nc -timmean -selmon,1,2 rhum.2m.mon.mean_19012000.nc rhum.2m.mon.mean_19012000_anoms_AM.nc 
cdo -L -b 32 sub -yearmean -selmon,6,7 rhum.2m.mon.mean_19012000.nc -timmean -selmon,1,2 rhum.2m.mon.mean_19012000.nc rhum.2m.mon.mean_19012000_anoms_JJ.nc 
cdo -L -b 32 sub -yearmean -selmon,9,10 rhum.2m.mon.mean_19012000.nc -timmean -selmon,1,2 rhum.2m.mon.mean_19012000.nc rhum.2m.mon.mean_19012000_anoms_SO.nc 




cdo -f nc input,r1x1 pc1_o18_olga.nc < pc1_o18_olga.txt
cdo -r -chname,var1,o18 -settaxis,1901-07-01,00:00:00,1year pc1_o18_olga.nc pc1_o18_olga_time.nc
cdo detrend pc1_o18_olga_time.nc pc1_o18_olga_time_detrend.nc

cdo -f nc input,r1x1 pc2_o18_olga.nc < pc2_o18_olga.txt
cdo -r -chname,var1,o18 -settaxis,1901-07-01,00:00:00,1year pc2_o18_olga.nc pc2_o18_olga_time.nc
cdo detrend pc2_o18_olga_time.nc pc2_o18_olga_time_detrend.nc



cdo enlarge,prmsl.mon.mean_JF_19012000_anoms.nc pc1_o18_olga_time_detrend.nc pc1_o18_olga_time_detrend_enlarge.nc

cdo enlarge,prmsl.mon.mean_JF_19012000_anoms.nc pc2_o18_olga_time_detrend.nc pc2_o18_olga_time_detrend_enlarge.nc


#cdo enlarge,PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc1_o18_olga_time_detrend.nc pc1_o18_olga_time_detrend_enlarge2.nc

#cdo enlarge,PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc2_o18_olga_time_detrend.nc pc2_o18_olga_time_detrend_enlarge2.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_JF_19012000_anoms.nc -sellonlatbox,-180,180,-60,90  pc1_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc1_o18.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_JF_19012000_anoms.nc -sellonlatbox,-180,180,-60,90  pc2_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc2_o18.nc


cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_JJ_19012000_anoms.nc -sellonlatbox,-180,180,-60,90  pc1_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc1_o18.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_JJ_19012000_anoms.nc -sellonlatbox,-180,180,-60,90  pc2_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc2_o18.nc


cdo timcor -selyear,1920/1940 prmsl.mon.mean_JF_19012000_anoms.nc -selyear,1920/1940  pc1_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc1_o18_ew.nc

cdo timcor -selyear,1920/1940 prmsl.mon.mean_JF_19012000_anoms.nc -selyear,1920/1940  pc2_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc2_o18_ew.nc


cdo timcor -selyear,1920/1940 prmsl.mon.mean_JJ_19012000_anoms.nc -selyear,1920/1940  pc1_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc1_o18_ew.nc

cdo timcor -selyear,1920/1940 prmsl.mon.mean_JJ_19012000_anoms.nc -selyear,1920/1940  pc2_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc2_o18_ew.nc



cdo timcor prate.mon.mean_JJ_19012000_anoms.nc pc1_o18_olga_time_detrend_enlarge.nc prate.mon.mean_JJ_19012000_anoms_corpc1_o18.nc

cdo timcor prate.mon.mean_JJ_19012000_anoms.nc pc2_o18_olga_time_detrend_enlarge.nc prate.mon.mean_JJ_19012000_anoms_corpc2_o18.nc



cdo timcor air.2m.mon.mean_JJ_19012000_anoms.nc pc1_o18_olga_time_detrend_enlarge.nc air.2m.mon.mean_JJ_19012000_anoms_corpc1_o18.nc

cdo timcor air.2m.mon.mean_JJ_19012000_anoms.nc pc2_o18_olga_time_detrend_enlarge.nc air.2m.mon.mean_JJ_19012000_anoms_corpc2_o18.nc



#cdo timcor PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc1_o18_olga_time_detrend_enlarge2.nc PaleoSST_19012000_mergensmean_MAM_remap_anoms_corpc1_o18.nc

#cdo timcor PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc2_o18_olga_time_detrend_enlarge2.nc PaleoSST_19012000_mergensmean_MAM_remap_anoms_corpc2_o18.nc



cdo -f nc input,r1x1 pc1_c13_olga.nc < pc1_c13_olga.txt
cdo -r -chname,var1,c13 -settaxis,1901-07-01,00:00:00,1year pc1_c13_olga.nc pc1_c13_olga_time.nc
cdo detrend pc1_c13_olga_time.nc pc1_c13_olga_time_detrend.nc

cdo -f nc input,r1x1 pc2_c13_olga.nc < pc2_c13_olga.txt
cdo -r -chname,var1,c13 -settaxis,1901-07-01,00:00:00,1year pc2_c13_olga.nc pc2_c13_olga_time.nc
cdo detrend pc2_c13_olga_time.nc pc2_c13_olga_time_detrend.nc



cdo enlarge,prmsl.mon.mean_JF_19012000_anoms.nc pc1_c13_olga_time_detrend.nc pc1_c13_olga_time_detrend_enlarge.nc

cdo enlarge,prmsl.mon.mean_JF_19012000_anoms.nc pc2_c13_olga_time_detrend.nc pc2_c13_olga_time_detrend_enlarge.nc


#cdo enlarge,PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc1_c13_olga_time_detrend.nc pc1_c13_olga_time_detrend_enlarge2.nc

#cdo enlarge,PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc2_c13_olga_time_detrend.nc pc2_c13_olga_time_detrend_enlarge2.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_JF_19012000_anoms.nc -sellonlatbox,-180,180,-60,90  pc1_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc1_c13.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_JF_19012000_anoms.nc -sellonlatbox,-180,180,-60,90  pc2_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc2_c13.nc


cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_JJ_19012000_anoms.nc -sellonlatbox,-180,180,-60,90  pc1_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc1_c13.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_JJ_19012000_anoms.nc -sellonlatbox,-180,180,-60,90  pc2_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc2_c13.nc




cdo timcor -selyear,1920/1940 prmsl.mon.mean_JF_19012000_anoms.nc -selyear,1920/1940  pc1_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc1_c13_ew.nc

cdo timcor -selyear,1920/1940 prmsl.mon.mean_JF_19012000_anoms.nc -selyear,1920/1940  pc2_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc2_c13_ew.nc


cdo timcor -selyear,1920/1940 prmsl.mon.mean_JJ_19012000_anoms.nc -selyear,1920/1940  pc1_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc1_c13_ew.nc

cdo timcor -selyear,1920/1940 prmsl.mon.mean_JJ_19012000_anoms.nc -selyear,1920/1940  pc2_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc2_c13_ew.nc



cdo timcor prate.mon.mean_JJ_19012000_anoms.nc pc1_c13_olga_time_detrend_enlarge.nc prate.mon.mean_JJ_19012000_anoms_corpc1_c13.nc

cdo timcor prate.mon.mean_JJ_19012000_anoms.nc pc2_c13_olga_time_detrend_enlarge.nc prate.mon.mean_JJ_19012000_anoms_corpc2_c13.nc



cdo timcor air.2m.mon.mean_JJ_19012000_anoms.nc pc1_c13_olga_time_detrend_enlarge.nc air.2m.mon.mean_JJ_19012000_anoms_corpc1_c13.nc

cdo timcor air.2m.mon.mean_JJ_19012000_anoms.nc pc2_c13_olga_time_detrend_enlarge.nc air.2m.mon.mean_JJ_19012000_anoms_corpc2_c13.nc



#cdo timcor PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc1_c13_olga_time_detrend_enlarge2.nc PaleoSST_19012000_mergensmean_MAM_remap_anoms_corpc1_c13.nc

#cdo timcor PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc2_c13_olga_time_detrend_enlarge2.nc PaleoSST_19012000_mergensmean_MAM_remap_anoms_corpc2_c13.nc



cdo -f nc input,r1x1 pc1_d2h_olga.nc < pc1_d2h_olga.txt
cdo -r -chname,var1,d2h -settaxis,1901-07-01,00:00:00,1year pc1_d2h_olga.nc pc1_d2h_olga_time.nc
cdo detrend pc1_d2h_olga_time.nc pc1_d2h_olga_time_detrend.nc

cdo -f nc input,r1x1 pc2_d2h_olga.nc < pc2_d2h_olga.txt
cdo -r -chname,var1,d2h -settaxis,1901-07-01,00:00:00,1year pc2_d2h_olga.nc pc2_d2h_olga_time.nc
cdo detrend pc2_d2h_olga_time.nc pc2_d2h_olga_time_detrend.nc



cdo enlarge,prmsl.mon.mean_JF_19012000_anoms.nc pc1_d2h_olga_time_detrend.nc pc1_d2h_olga_time_detrend_enlarge.nc

cdo enlarge,prmsl.mon.mean_JF_19012000_anoms.nc pc2_d2h_olga_time_detrend.nc pc2_d2h_olga_time_detrend_enlarge.nc


#cdo enlarge,PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc1_d2h_olga_time_detrend.nc pc1_d2h_olga_time_detrend_enlarge2.nc

#cdo enlarge,PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc2_d2h_olga_time_detrend.nc pc2_d2h_olga_time_detrend_enlarge2.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JJ.nc  -sellonlatbox,-180,180,-60,90  pc1_d2h_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc1_d2h.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JJ.nc  -sellonlatbox,-180,180,-60,90  pc2_d2h_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc2_d2h.nc




cdo timcor prate.mon.mean_19012000_anoms_JJ.nc  pc1_d2h_olga_time_detrend_enlarge.nc prate.mon.mean_JJ_19012000_anoms_corpc1_d2h.nc

cdo timcor prate.mon.mean_19012000_anoms_JJ.nc  pc2_d2h_olga_time_detrend_enlarge.nc prate.mon.mean_JJ_19012000_anoms_corpc2_d2h.nc



cdo timcor air.2m.mon.mean_19012000_anoms_JJ.nc  pc1_d2h_olga_time_detrend_enlarge.nc air.2m.mon.mean_JJ_19012000_anoms_corpc1_d2h.nc

cdo timcor air.2m.mon.mean_19012000_anoms_JJ.nc   pc2_d2h_olga_time_detrend_enlarge.nc air.2m.mon.mean_JJ_19012000_anoms_corpc2_d2h.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_JJ.nc  pc1_d2h_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JJ_19012000_anoms_corpc1_d2h.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_JJ.nc  pc2_d2h_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JJ_19012000_anoms_corpc2_d2h.nc



#cdo timcor PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc1_d2h_olga_time_detrend_enlarge2.nc PaleoSST_19012000_mergensmean_MAM_remap_anoms_corpc1_d2h.nc

#cdo timcor PaleoSST_19012000_mergensmean_MAM_remap_anoms.nc pc2_d2h_olga_time_detrend_enlarge2.nc PaleoSST_19012000_mergensmean_MAM_remap_anoms_corpc2_d2h.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_AM.nc  -sellonlatbox,-180,180,-60,90  pc1_d2h_olga_time_detrend_enlarge.nc prmsl.mon.mean_AM_19012000_anoms_corpc1_d2h.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_AM.nc  -sellonlatbox,-180,180,-60,90  pc2_d2h_olga_time_detrend_enlarge.nc prmsl.mon.mean_AM_19012000_anoms_corpc2_d2h.nc




cdo timcor prate.mon.mean_19012000_anoms_AM.nc  pc1_d2h_olga_time_detrend_enlarge.nc prate.mon.mean_AM_19012000_anoms_corpc1_d2h.nc

cdo timcor prate.mon.mean_19012000_anoms_AM.nc  pc2_d2h_olga_time_detrend_enlarge.nc prate.mon.mean_AM_19012000_anoms_corpc2_d2h.nc



cdo timcor air.2m.mon.mean_19012000_anoms_AM.nc  pc1_d2h_olga_time_detrend_enlarge.nc air.2m.mon.mean_AM_19012000_anoms_corpc1_d2h.nc

cdo timcor air.2m.mon.mean_19012000_anoms_AM.nc   pc2_d2h_olga_time_detrend_enlarge.nc air.2m.mon.mean_AM_19012000_anoms_corpc2_d2h.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_AM.nc  pc1_d2h_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_AM_19012000_anoms_corpc1_d2h.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_AM.nc  pc2_d2h_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_AM_19012000_anoms_corpc2_d2h.nc



cdo timcor snowc.mon.mean_19012000_anoms_AM.nc  pc1_d2h_olga_time_detrend_enlarge.nc snowc.mon.mean_AM_19012000_anoms_corpc1_d2h.nc

cdo timcor snowc.mon.mean_19012000_anoms_AM.nc  pc2_d2h_olga_time_detrend_enlarge.nc snowc.mon.mean_AM_19012000_anoms_corpc2_d2h.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JF.nc  -sellonlatbox,-180,180,-60,90  pc1_d2h_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc1_d2h.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JF.nc  -sellonlatbox,-180,180,-60,90  pc2_d2h_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc2_d2h.nc




cdo timcor prate.mon.mean_19012000_anoms_JF.nc  pc1_d2h_olga_time_detrend_enlarge.nc prate.mon.mean_JF_19012000_anoms_corpc1_d2h.nc

cdo timcor prate.mon.mean_19012000_anoms_JF.nc  pc2_d2h_olga_time_detrend_enlarge.nc prate.mon.mean_JF_19012000_anoms_corpc2_d2h.nc



cdo timcor air.2m.mon.mean_19012000_anoms_JF.nc  pc1_d2h_olga_time_detrend_enlarge.nc air.2m.mon.mean_JF_19012000_anoms_corpc1_d2h.nc

cdo timcor air.2m.mon.mean_19012000_anoms_JF.nc   pc2_d2h_olga_time_detrend_enlarge.nc air.2m.mon.mean_JF_19012000_anoms_corpc2_d2h.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_JF.nc  pc1_d2h_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JF_19012000_anoms_corpc1_d2h.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_JF.nc  pc2_d2h_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JF_19012000_anoms_corpc2_d2h.nc



cdo timcor snowc.mon.mean_19012000_anoms_JF.nc  pc1_d2h_olga_time_detrend_enlarge.nc snowc.mon.mean_JF_19012000_anoms_corpc1_d2h.nc

cdo timcor snowc.mon.mean_19012000_anoms_JF.nc  pc2_d2h_olga_time_detrend_enlarge.nc snowc.mon.mean_JF_19012000_anoms_corpc2_d2h.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_SO.nc  -sellonlatbox,-180,180,-60,90  pc1_d2h_olga_time_detrend_enlarge.nc prmsl.mon.mean_SO_19012000_anoms_corpc1_d2h.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_SO.nc  -sellonlatbox,-180,180,-60,90  pc2_d2h_olga_time_detrend_enlarge.nc prmsl.mon.mean_SO_19012000_anoms_corpc2_d2h.nc




cdo timcor prate.mon.mean_19012000_anoms_SO.nc  pc1_d2h_olga_time_detrend_enlarge.nc prate.mon.mean_SO_19012000_anoms_corpc1_d2h.nc

cdo timcor prate.mon.mean_19012000_anoms_SO.nc  pc2_d2h_olga_time_detrend_enlarge.nc prate.mon.mean_SO_19012000_anoms_corpc2_d2h.nc



cdo timcor air.2m.mon.mean_19012000_anoms_SO.nc  pc1_d2h_olga_time_detrend_enlarge.nc air.2m.mon.mean_SO_19012000_anoms_corpc1_d2h.nc

cdo timcor air.2m.mon.mean_19012000_anoms_SO.nc   pc2_d2h_olga_time_detrend_enlarge.nc air.2m.mon.mean_SO_19012000_anoms_corpc2_d2h.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_SO.nc  pc1_d2h_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_SO_19012000_anoms_corpc1_d2h.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_SO.nc  pc2_d2h_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_SO_19012000_anoms_corpc2_d2h.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_SO.nc  -sellonlatbox,-180,180,-60,90  pc1_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_SO_19012000_anoms_corpc1_c13.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_SO.nc  -sellonlatbox,-180,180,-60,90  pc2_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_SO_19012000_anoms_corpc2_c13.nc




cdo timcor prate.mon.mean_19012000_anoms_SO.nc  pc1_c13_olga_time_detrend_enlarge.nc prate.mon.mean_SO_19012000_anoms_corpc1_c13.nc

cdo timcor prate.mon.mean_19012000_anoms_SO.nc  pc2_c13_olga_time_detrend_enlarge.nc prate.mon.mean_SO_19012000_anoms_corpc2_c13.nc



cdo timcor air.2m.mon.mean_19012000_anoms_SO.nc  pc1_c13_olga_time_detrend_enlarge.nc air.2m.mon.mean_SO_19012000_anoms_corpc1_c13.nc

cdo timcor air.2m.mon.mean_19012000_anoms_SO.nc   pc2_c13_olga_time_detrend_enlarge.nc air.2m.mon.mean_SO_19012000_anoms_corpc2_c13.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_SO.nc  pc1_c13_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_SO_19012000_anoms_corpc1_c13.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_SO.nc  pc2_c13_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_SO_19012000_anoms_corpc2_c13.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JJ.nc  -sellonlatbox,-180,180,-60,90  pc1_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc1_c13.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JJ.nc  -sellonlatbox,-180,180,-60,90  pc2_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc2_c13.nc




cdo timcor prate.mon.mean_19012000_anoms_JJ.nc  pc1_c13_olga_time_detrend_enlarge.nc prate.mon.mean_JJ_19012000_anoms_corpc1_c13.nc

cdo timcor prate.mon.mean_19012000_anoms_JJ.nc  pc2_c13_olga_time_detrend_enlarge.nc prate.mon.mean_JJ_19012000_anoms_corpc2_c13.nc



cdo timcor air.2m.mon.mean_19012000_anoms_JJ.nc  pc1_c13_olga_time_detrend_enlarge.nc air.2m.mon.mean_JJ_19012000_anoms_corpc1_c13.nc

cdo timcor air.2m.mon.mean_19012000_anoms_JJ.nc   pc2_c13_olga_time_detrend_enlarge.nc air.2m.mon.mean_JJ_19012000_anoms_corpc2_c13.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_JJ.nc  pc1_c13_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JJ_19012000_anoms_corpc1_c13.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_JJ.nc  pc2_c13_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JJ_19012000_anoms_corpc2_c13.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_AM.nc  -sellonlatbox,-180,180,-60,90  pc1_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_AM_19012000_anoms_corpc1_c13.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_AM.nc  -sellonlatbox,-180,180,-60,90  pc2_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_AM_19012000_anoms_corpc2_c13.nc




cdo timcor prate.mon.mean_19012000_anoms_AM.nc  pc1_c13_olga_time_detrend_enlarge.nc prate.mon.mean_AM_19012000_anoms_corpc1_c13.nc

cdo timcor prate.mon.mean_19012000_anoms_AM.nc  pc2_c13_olga_time_detrend_enlarge.nc prate.mon.mean_AM_19012000_anoms_corpc2_c13.nc



cdo timcor air.2m.mon.mean_19012000_anoms_AM.nc  pc1_c13_olga_time_detrend_enlarge.nc air.2m.mon.mean_AM_19012000_anoms_corpc1_c13.nc

cdo timcor air.2m.mon.mean_19012000_anoms_AM.nc   pc2_c13_olga_time_detrend_enlarge.nc air.2m.mon.mean_AM_19012000_anoms_corpc2_c13.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_AM.nc  pc1_c13_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_AM_19012000_anoms_corpc1_c13.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_AM.nc  pc2_c13_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_AM_19012000_anoms_corpc2_c13.nc



cdo timcor snowc.mon.mean_19012000_anoms_AM.nc  pc1_c13_olga_time_detrend_enlarge.nc snowc.mon.mean_AM_19012000_anoms_corpc1_c13.nc

cdo timcor snowc.mon.mean_19012000_anoms_AM.nc  pc2_c13_olga_time_detrend_enlarge.nc snowc.mon.mean_AM_19012000_anoms_corpc2_c13.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JF.nc  -sellonlatbox,-180,180,-60,90  pc1_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc1_c13.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JF.nc  -sellonlatbox,-180,180,-60,90  pc2_c13_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc2_c13.nc




cdo timcor prate.mon.mean_19012000_anoms_JF.nc  pc1_c13_olga_time_detrend_enlarge.nc prate.mon.mean_JF_19012000_anoms_corpc1_c13.nc

cdo timcor prate.mon.mean_19012000_anoms_JF.nc  pc2_c13_olga_time_detrend_enlarge.nc prate.mon.mean_JF_19012000_anoms_corpc2_c13.nc



cdo timcor air.2m.mon.mean_19012000_anoms_JF.nc  pc1_c13_olga_time_detrend_enlarge.nc air.2m.mon.mean_JF_19012000_anoms_corpc1_c13.nc

cdo timcor air.2m.mon.mean_19012000_anoms_JF.nc   pc2_c13_olga_time_detrend_enlarge.nc air.2m.mon.mean_JF_19012000_anoms_corpc2_c13.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_JF.nc  pc1_c13_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JF_19012000_anoms_corpc1_c13.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_JF.nc  pc2_c13_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JF_19012000_anoms_corpc2_c13.nc



cdo timcor snowc.mon.mean_19012000_anoms_JF.nc  pc1_c13_olga_time_detrend_enlarge.nc snowc.mon.mean_JF_19012000_anoms_corpc1_c13.nc

cdo timcor snowc.mon.mean_19012000_anoms_JF.nc  pc2_c13_olga_time_detrend_enlarge.nc snowc.mon.mean_JF_19012000_anoms_corpc2_c13.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JF.nc  -sellonlatbox,-180,180,-60,90  pc1_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc1_o18.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JF.nc  -sellonlatbox,-180,180,-60,90  pc2_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JF_19012000_anoms_corpc2_o18.nc




cdo timcor prate.mon.mean_19012000_anoms_JF.nc  pc1_o18_olga_time_detrend_enlarge.nc prate.mon.mean_JF_19012000_anoms_corpc1_o18.nc

cdo timcor prate.mon.mean_19012000_anoms_JF.nc  pc2_o18_olga_time_detrend_enlarge.nc prate.mon.mean_JF_19012000_anoms_corpc2_o18.nc



cdo timcor air.2m.mon.mean_19012000_anoms_JF.nc  pc1_o18_olga_time_detrend_enlarge.nc air.2m.mon.mean_JF_19012000_anoms_corpc1_o18.nc

cdo timcor air.2m.mon.mean_19012000_anoms_JF.nc   pc2_o18_olga_time_detrend_enlarge.nc air.2m.mon.mean_JF_19012000_anoms_corpc2_o18.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_JF.nc  pc1_o18_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JF_19012000_anoms_corpc1_o18.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_JF.nc  pc2_o18_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JF_19012000_anoms_corpc2_o18.nc



cdo timcor snowc.mon.mean_19012000_anoms_JF.nc  pc1_o18_olga_time_detrend_enlarge.nc snowc.mon.mean_JF_19012000_anoms_corpc1_o18.nc

cdo timcor snowc.mon.mean_19012000_anoms_JF.nc  pc2_o18_olga_time_detrend_enlarge.nc snowc.mon.mean_JF_19012000_anoms_corpc2_o18.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_AM.nc  -sellonlatbox,-180,180,-60,90  pc1_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_AM_19012000_anoms_corpc1_o18.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_AM.nc  -sellonlatbox,-180,180,-60,90  pc2_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_AM_19012000_anoms_corpc2_o18.nc




cdo timcor prate.mon.mean_19012000_anoms_AM.nc  pc1_o18_olga_time_detrend_enlarge.nc prate.mon.mean_AM_19012000_anoms_corpc1_o18.nc

cdo timcor prate.mon.mean_19012000_anoms_AM.nc  pc2_o18_olga_time_detrend_enlarge.nc prate.mon.mean_AM_19012000_anoms_corpc2_o18.nc



cdo timcor air.2m.mon.mean_19012000_anoms_AM.nc  pc1_o18_olga_time_detrend_enlarge.nc air.2m.mon.mean_AM_19012000_anoms_corpc1_o18.nc

cdo timcor air.2m.mon.mean_19012000_anoms_AM.nc   pc2_o18_olga_time_detrend_enlarge.nc air.2m.mon.mean_AM_19012000_anoms_corpc2_o18.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_AM.nc  pc1_o18_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_AM_19012000_anoms_corpc1_o18.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_AM.nc  pc2_o18_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_AM_19012000_anoms_corpc2_o18.nc



cdo timcor snowc.mon.mean_19012000_anoms_AM.nc  pc1_o18_olga_time_detrend_enlarge.nc snowc.mon.mean_AM_19012000_anoms_corpc1_o18.nc

cdo timcor snowc.mon.mean_19012000_anoms_AM.nc  pc2_o18_olga_time_detrend_enlarge.nc snowc.mon.mean_AM_19012000_anoms_corpc2_o18.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JJ.nc  -sellonlatbox,-180,180,-60,90  pc1_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc1_o18.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_JJ.nc  -sellonlatbox,-180,180,-60,90  pc2_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_JJ_19012000_anoms_corpc2_o18.nc




cdo timcor prate.mon.mean_19012000_anoms_JJ.nc  pc1_o18_olga_time_detrend_enlarge.nc prate.mon.mean_JJ_19012000_anoms_corpc1_o18.nc

cdo timcor prate.mon.mean_19012000_anoms_JJ.nc  pc2_o18_olga_time_detrend_enlarge.nc prate.mon.mean_JJ_19012000_anoms_corpc2_o18.nc



cdo timcor air.2m.mon.mean_19012000_anoms_JJ.nc  pc1_o18_olga_time_detrend_enlarge.nc air.2m.mon.mean_JJ_19012000_anoms_corpc1_o18.nc

cdo timcor air.2m.mon.mean_19012000_anoms_JJ.nc   pc2_o18_olga_time_detrend_enlarge.nc air.2m.mon.mean_JJ_19012000_anoms_corpc2_o18.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_JJ.nc  pc1_o18_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JJ_19012000_anoms_corpc1_o18.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_JJ.nc  pc2_o18_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_JJ_19012000_anoms_corpc2_o18.nc




cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_SO.nc  -sellonlatbox,-180,180,-60,90  pc1_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_SO_19012000_anoms_corpc1_o18.nc

cdo timcor -sellonlatbox,-180,180,-60,90 prmsl.mon.mean_19012000_anoms_SO.nc  -sellonlatbox,-180,180,-60,90  pc2_o18_olga_time_detrend_enlarge.nc prmsl.mon.mean_SO_19012000_anoms_corpc2_o18.nc




cdo timcor prate.mon.mean_19012000_anoms_SO.nc  pc1_o18_olga_time_detrend_enlarge.nc prate.mon.mean_SO_19012000_anoms_corpc1_o18.nc

cdo timcor prate.mon.mean_19012000_anoms_SO.nc  pc2_o18_olga_time_detrend_enlarge.nc prate.mon.mean_SO_19012000_anoms_corpc2_o18.nc



cdo timcor air.2m.mon.mean_19012000_anoms_SO.nc  pc1_o18_olga_time_detrend_enlarge.nc air.2m.mon.mean_SO_19012000_anoms_corpc1_o18.nc

cdo timcor air.2m.mon.mean_19012000_anoms_SO.nc   pc2_o18_olga_time_detrend_enlarge.nc air.2m.mon.mean_SO_19012000_anoms_corpc2_o18.nc



cdo timcor rhum.2m.mon.mean_19012000_anoms_SO.nc  pc1_o18_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_SO_19012000_anoms_corpc1_o18.nc

cdo timcor rhum.2m.mon.mean_19012000_anoms_SO.nc  pc2_o18_olga_time_detrend_enlarge.nc rhum.2m.mon.mean_SO_19012000_anoms_corpc2_o18.nc
