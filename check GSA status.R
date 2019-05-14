library(reshape2)
library(dplyr)
library(tidyr)
library(readxl)

setwd("G:/My Drive/Data Science/Mridul/R work")
a <- read_excel("Example2.xlsx")
h <- as.data.frame(read.csv("Loc_Chr105.csv"))
a <- as.data.frame(read_excel("CNV list.xlsx"))
#View(a)
#h <- as.data.frame(read_excel("GSA2.xlsx"))
b <- as.data.frame(read_excel("GSA.v2.xlsx"))
View(b)
f <- as.data.frame(read.csv("annotationsV2.csv"))
View(f)
h <- read_csv("report v3.0.csv")

melt(a)
c <- unite(a,
           col = "MapInfo",
           Chromosome, Location,
           sep = "-")
melt(b)
d <- unite(b,
           col = "MapInfo",
           Chr, Coordinate,
           sep = "-")

#k <- c[is.element(h$SNPs,b$Name),]
#View(k)
f <-  c[is.element(c$MapInfo,b$MapInfo),]
write.csv(f, file = "Panel present4.csv")

e <- c[!c$MapInfo%in%b$MapInfo,]
write.csv(e, file = "Panel absent4.csv")

