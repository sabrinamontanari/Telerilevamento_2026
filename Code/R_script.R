# primo script di R

#arrays o vettori
delfini <- c(10, 8, 3, 1, 0) #campionamento di delfini
inquinanti <- c(3, 10, 20, 50, 100)
plot(inquinanti, delfini, col="blue", pch=19, cex=2, Xlab="pollution", ylab="numero di delfini")

#installare pacchetti
#CRAN --> pacchetto Terra [vedi](https://cran.r-project.org/web/packages/terra/index.html)
install.packages("terra")
library(terra)
#GITHUB --> posso installare pacchetti anche da github ma prima devo installare un altro pacchetto (devtools o remotes)
install.packages("devtools")
library(devtools)
install_github("ducciorocchini/imageRy") #pacchetto ImageRy 

