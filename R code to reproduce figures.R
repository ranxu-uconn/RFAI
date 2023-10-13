library(ggplot2)
library(maps)
library(usmap)

library(tidycensus)
library(tidyverse)
library(sf)
library(tigris)
library(readxl)
library(grid)
library(gridExtra)

##coefficient plot
##figure 3
coef0<-read_excel("coef.xlsx",sheet=6)

ggplot(coef0, aes(Index, estimate,colour=Race)) + 
  geom_hline(yintercept=0, lty=2, lwd=1, colour="black") +
  geom_errorbar(alpha = 0.5,aes(ymin=ll, ymax=ul, colour=Race), 
                lwd=1, width=0.2) +
  geom_point(alpha = 0.5,size=3, aes(colour=Race)) +
  coord_flip() +
  labs(x="",y="Estimated Differences with Other Census Tracts") +
  theme_classic()+theme(axis.text=element_text(size=12),axis.title=element_text(size=14),legend.title = element_text(size=14), 
                        legend.text = element_text(size=12))


coef<-read_excel("coef.xlsx",sheet=1)

ggplot(coef[coef$graph=="unadj",], aes(outcome, estimate,colour=Index)) + 
  geom_hline(yintercept=0, lty=2, lwd=1, colour="black") +
  geom_errorbar(alpha = 0.5,aes(ymin=ll, ymax=ul, colour=Index), 
                lwd=1, width=0.3) +
  geom_point(alpha = 0.5,size=3, aes(colour=Index)) +
  coord_flip() +
  labs(x="",y="Unadjusted regression coefficient") +
  theme_classic()+theme(axis.text=element_text(size=12),axis.title=element_text(size=14),legend.title = element_text(size=14), 
                        legend.text = element_text(size=12))

ggplot(coef[coef$graph=="adj",], aes(outcome, estimate,colour=Index)) + 
  geom_hline(yintercept=0, lty=2, lwd=1, colour="black") +
  geom_errorbar(alpha = 0.5,aes(ymin=ll, ymax=ul, colour=Index), 
                lwd=1, width=0.3) +
  geom_point(alpha = 0.5,size=3, aes(colour=Index)) +
  coord_flip() +
  labs(x="",y="Adjusted regression coefficient") +
  theme_classic()+theme(axis.text=element_text(size=12),axis.title=element_text(size=14),legend.title = element_text(size=14), 
                        legend.text = element_text(size=12))

##figure S5
coef2<-read_excel("coef.xlsx",sheet=2)
ggplot(coef2, aes(outcome, estimate,colour=Index)) + 
  geom_hline(yintercept=0, lty=2, lwd=1, colour="black") +
  geom_errorbar(alpha = 0.5,aes(ymin=ll, ymax=ul, colour=Index), 
                lwd=1, width=0.3) +
  geom_point(alpha = 0.5,size=3, aes(colour=Index)) +
  coord_flip() +
  labs(x="",y="Adjusted regression coefficient") +
  theme_classic()+theme(axis.text=element_text(size=12),axis.title=element_text(size=14),legend.title = element_text(size=14), 
                        legend.text = element_text(size=12))
##figure S6
coef3<-read_excel("coef.xlsx",sheet=3)
ggplot(coef3[coef3$graph=="linear",], aes(outcome, estimate,colour=Index)) + 
  geom_hline(yintercept=0, lty=2, lwd=1, colour="black") +
  geom_errorbar(alpha = 0.5,aes(ymin=ll, ymax=ul, colour=Index), 
                lwd=1, width=0.3) +
  geom_point(alpha = 0.5,size=3, aes(colour=Index)) +
  coord_flip() +
  labs(x="",y="Adjusted regression coefficient from county-level analysis") +
  theme_classic()+theme(axis.text=element_text(size=12),axis.title=element_text(size=14),legend.title = element_text(size=14), 
                        legend.text = element_text(size=12))
## figure S7
ggplot(coef3[coef3$graph=="spatial error",], aes(outcome, estimate,colour=Index)) + 
  geom_hline(yintercept=0, lty=2, lwd=1, colour="black") +
  geom_errorbar(alpha = 0.5,aes(ymin=ll, ymax=ul, colour=Index), 
                lwd=1, width=0.3) +
  geom_point(alpha = 0.5,size=3, aes(colour=Index)) +
  coord_flip() +
  labs(x="",y="Adjusted regression coefficient from county-level spatial error model") +
  theme_classic()+theme(axis.text=element_text(size=12),axis.title=element_text(size=14),legend.title = element_text(size=14), 
                        legend.text = element_text(size=12))
## figure 4
coef4<-read_excel("coef.xlsx",sheet=4)
p1<-ggplot(coef4[coef4$graph=="unadj",], aes(outcome, estimate,colour=Index)) + 
  geom_hline(yintercept=0, lty=2, lwd=1, colour="black") +
  geom_errorbar(alpha = 0.5,aes(ymin=ll, ymax=ul, colour=Index), 
                lwd=1, width=0.3) +
  geom_point(alpha = 0.5,size=3, aes(colour=Index)) +
  coord_flip() +
  labs(x="",y="Unadjusted Effect") +
  theme_classic()+theme(axis.text=element_text(size=12),axis.title=element_text(size=14),legend.title = element_text(size=14), 
                        legend.text = element_text(size=12))

p2<-ggplot(coef4[coef4$graph=="adj",], aes(outcome, estimate,colour=Index)) + 
  geom_hline(yintercept=0, lty=2, lwd=1, colour="black") +
  geom_errorbar(alpha = 0.5,aes(ymin=ll, ymax=ul, colour=Index), 
                lwd=1, width=0.3) +
  geom_point(alpha = 0.5,size=3, aes(colour=Index)) +
  coord_flip() +
  labs(x="",y="Adjusted Effect") +
  theme_classic()+theme(axis.text=element_text(size=12),axis.title=element_text(size=14),legend.title = element_text(size=14), 
                        legend.text = element_text(size=12))

myplot1 <- arrangeGrob(p1, top = textGrob("a", x = unit(0, "npc")
                                               , y   = unit(1, "npc"), just=c("left","top"),
                                               gp=gpar(col="black", fontsize=18, fontfamily="Times Roman")))
myplot2 <- arrangeGrob(p2, top = textGrob("b", x = unit(0, "npc")
                                               , y  = unit(1, "npc"), just=c("left","top"),
                                               gp=gpar(col="black", fontsize=18, fontfamily="Times Roman")))

grid.arrange(myplot1,myplot2, ncol=1)


##figure S9
coef5<-read_excel("coef.xlsx",sheet=5)
ggplot(coef5, aes(outcome, estimate,colour=Race,shape=Index)) + 
  geom_hline(yintercept=0, lty=2, lwd=1, colour="black") +
  geom_errorbar(position = position_dodge(width = 0.5),alpha = 0.5,aes(ymin=ll, ymax=ul, colour=Race), 
                lwd=1, width=0.3) +
  geom_point(position = position_dodge(width = 0.5),alpha = 0.5,size=3, aes(colour=Race,shape=Index)) +
  coord_flip() +
  labs(x="",y="Adjusted regression coefficient") +
  theme_classic()+theme(axis.text=element_text(size=12),axis.title=element_text(size=14),legend.title = element_text(size=14), 
                        legend.text = element_text(size=12))

###figure S2
data<-read_excel("coef.xlsx",sheet=7)
p3<-ggplot(data, aes(x=mrfei))+geom_histogram(color="black",fill="#F8766D",alpha=0.5)+theme_classic()+xlab("mRFEI")+xlim(0, 100)
p4<-ggplot(data, aes(x=hei3))+geom_histogram(color="black",fill="#00BFC4",alpha=0.5)+theme_classic()+xlab("RFAI")+xlim(0, 100)

myplot3 <- arrangeGrob(p3, top = textGrob("a", x = unit(0, "npc")
                                          , y   = unit(1, "npc"), just=c("left","top"),
                                          gp=gpar(col="black", fontsize=18, fontfamily="Times Roman")))
myplot4 <- arrangeGrob(p4, top = textGrob("b", x = unit(0, "npc")
                                          , y  = unit(1, "npc"), just=c("left","top"),
                                          gp=gpar(col="black", fontsize=18, fontfamily="Times Roman")))

grid.arrange(myplot3,myplot4, ncol=1)
