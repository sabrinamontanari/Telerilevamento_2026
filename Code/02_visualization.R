#R code for visualizing satellite data

#pacchetti usati nel codice
library(terra) #package for using spatial data
library(imageRy) #package devoted satellite images
install.packages("viridis") #per daltonici
library(viridis)

im.list() #funzione per 
?im.list
#catena dolomitica: le Tofane
#sentinel-2 bands
# https://gisgeography.com/sentinel-2-bands-combinations/
?im.import
b2 <- im.import("sentinel.dolomites.b2.tif")

#legenda di colori
cl <- colorRampPalette(c("deepskyblue2","darkseagreen3","darkorange1"))(100) #100 sono le sfumature di colori totale
plot(b2, col=cl)

#using viridis to change colors
# https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
plot(b2, col=inferno(100))
 #sfumature di grigio
cl<- colorRampPalette(c("darkgray","gray","lightgray"))(100)
plot(b2, col=cl)

#Vedere più immagini
par(mfrow=c(1,2)) #1 riga e 2 colonne
plot(b2, col=inferno(100))
plot(b2, col=cl)
#oppure
im.multiframe(1,2)
plot(b2, col=inferno(100))
plot(b2, col=cl)






