#!/bin/sh

DataID=July2_Data #store here the NRQCDglobalfitObjects containing data and model prediction
ModelID=July2_Model #store here the ModelIngredients.root file
JobID=July2_Sample #store here the output TTree of the likelihood sampling

run_ConvertDataInput=0
run_ConvertModelInput=0
run_CombineDataModel=0
run_SamplePPD=1

##################################
########## SETTINGS ##############
##################################

### ConvertDataInput

### ConvertModelInput

### CombineDataModel

### SamplePPD
nSample=10000
nBurnIn=2000

##################################
########## SELECTION #############
##################################
# To be added in SamplePPD and the plotting

pTMin=0
pTMax=100
rapMin=-10
rapMax=10
useSstatesOnly=false
usePstatesOnly=false
useCharmoniumOnly=false
useBottomoniumOnly=false
useOnlyState=999 #switch off by setting it to an int > N_STATES

##################################
############# CODE ###############
##################################

touch src/*
make

if [ ${run_ConvertDataInput} -eq 1 ]
then
./ConvertDataInput ${DataID}=DataID
fi
if [ ${run_ConvertModelInput} -eq 1 ]
then
./ConvertModelInput ${ModelID}=ModelID
fi
if [ ${run_CombineDataModel} -eq 1 ]
then
./CombineDataModel ${ModelID}=ModelID ${DataID}=DataID
fi
if [ ${run_SamplePPD} -eq 1 ]
then
./SamplePPD ${JobID}=JobID ${DataID}=DataID ${pTMin}pTMin ${pTMax}pTMax ${rapMin}rapMin ${rapMax}rapMax ${useOnlyState}useOnlyState useSstatesOnly=${useSstatesOnly} usePstatesOnly=${usePstatesOnly} useCharmoniumOnly=${useCharmoniumOnly} useBottomoniumOnly=${useBottomoniumOnly}
fi
