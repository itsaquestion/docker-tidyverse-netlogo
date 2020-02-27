# docker-tidyverse-netlogo

1. imtass/tidyverse-oracle-jdk8:3.6.3
2. RNetLogo
3. netlogo 6.0.4

# test script

```R
library(RNetLogo)
nl.path = "/opt/NetLogo 6.0.4/app/"

nlheadless1 <- "nlheadless1"
NLStart(nl.path, gui=F, nl.jarname = "netlogo-6.0.4.jar",nl.obj=nlheadless1)

model.path <- "/models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path,model.path,sep=""), nl.obj=nlheadless1)
NLCommand("setup", nl.obj=nlheadless1)
burned1 <- NLDoReport(20, "go", c("ticks","burned-trees"),
                      as.data.frame=TRUE,df.col.names=c("tick","burned"),
                      nl.obj=nlheadless1)
print(burned1)

NLQuit(nlheadless1)

```