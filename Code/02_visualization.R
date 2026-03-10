#R code for visualizing satellite data

#pacchetti usati nel codice
library(terra) #package for using spatial data
library(imageRy) #package devoted satellite images
install.packages("viridis") #per daltonici
library(viridis)
install.packages("ggplot2")
library(ggplot2)
install.packages("patchwork)
library(patchwork)

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

#MULTIFRAME - lezione 10 marzo
# 1. par(mfrow=c(1,2))
# 2. im.multiframe(1,2)
# 3. stack
# 4. ggplot patchwork
#1
par(mfrow=c(1,2)) #1 riga e 2 colonne
plot(b2, col=inferno(100))
plot(b2, col=cl)
#2
im.multiframe(1,2)
plot(b2, col=inferno(100))
plot(b2, col=cl)
##### lezione del 5 marzo
# bands
b3 = im.import("sentinel.dolomites.b3.tif")
b4 = im.import("sentinel.dolomites.b4.tif")
b8 = im.import("sentinel.dolomites.b8.tif")
par(mfrow=c(1,4))
plot(b2)
plot(b3)
plot(b4)
plot(b8)
im.multiframe(1,4)
plot(b2)
plot(b3)
plot(b4)
plot(b8)
# Exercise: plot the bands using im.multiframe() one on top of the other
im.multiframe(4,1)
plot(b2)
plot(b3)
plot(b4)
plot(b8)
im.multiframe(2,2)
plot(b2)
plot(b3)
plot(b4)
plot(b8)
cl = colorRampPalette(c("black", "light grey"))(100)
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)
sent = c(b2, b3, b4, b8)
plot(sent, col=cl)
names(sent) = c("b2-blue", "b3-green", "b4-red", "b8-NIR")
sent
plot(sent, col=cl)
plot(sent)
names(sent) = c("b2blue", "b3green", "b4red", "b8NIR")
dev.off()
plot(sent$b8NIR)
plot(sent[[4]])
# importing several bands altogether
sentdol = im.import("sentinel.dolomites")
# How to import severla sets altogether
pairs(sentdol)]
plot(sentdol[[4]])
plot(sentdol[[4]], col=inferno(100)) 
# viridis
plot(sentdol, col=viridis(100))
plot(sentdol, col=mako(100))
plot(sentdol, col=magma(100))
#### ....

# 4
# GGPLOT2 - install.packages("ggplot2")
library(ggplot2)
b2 <- im.import("sentinel.dolomites.b2.tif") #banda 2 =blu
b3 <- im.import("sentinel.dolomites.b3.tif") #verde
b4 <- im.import("sentinel.dolomites.b4.tif") #rosso
b8 <- im.import("sentinel.dolomites.b8.tif") #infrarosso
im.ggplot(b8)
#install.packages("patchwork)
library(patchwork)
p1<- im.ggplot(b8)
p2<- im.ggplot(b4)
p1 + p2    #mi visualizza due grafici in un unica finestra

#RGB plotting: schema red green blue
sentinel <- c(b2,b3,b4,b8)
  #1: b2 - filtro blue
  #2: b3 - filtro green
  #3: b4 - filtro red
  #4: b8 - filtro infrarosso
#tre filtri e quattro bande
 im.plotRGB(sentinel, r=3, g=2, b=1) #natural colors --> ottengo i colori naturali
#la biomassa vegetale viene studiata con l'infrarosso - riflettanza di una pianta sana è verde; la lunghezza d'onda del blu e del rosso vengono assorbite per la fotosintesi. 
#NIR on red --> uso la banda infrarosso sulla componente red
 im.plotRGB(sentinel, r=4, g=3, b=2) #false colors
#creo il multiframe
  im.multiframe(1,2) # una riga, due colonne
# oppure
  plot(sentinel[[4]])
#NIR on green --> uso l'infrarosso nella componente green (g=4)
 im.plotRGB(sentinel, r=3, g=4, b=2)
#NIR on blu --> uso l'infrarosso nella componente bli (b=4) --> utile per evidenziare il suolo nudo
 im.plotRGB(sentinel, r=3, g=2, b=4)

#Plot the four manners of RGB in a single multiframe
im.multiframe(2,2)
 im.plotRGB(sentinel, r=3, g=2, b=1) 
 im.plotRGB(sentinel, r=4, g=3, b=2) 
 im.plotRGB(sentinel, r=3, g=4, b=2) 
 im.plotRGB(sentinel, r=3, g=2, b=4) 
#
pairs(sentinel) 
#simplifying the function --> posso non scrivere le lettere
 im.plotRGB(sentinel, 3, 2, 4) 
#plotRGB()
plotRGB(sentinel, 3, 2, 4, stretch="hist") #il parametro stretch=hist aumenta il contrasto dei valori medi
plotRGB(sentinel, 3, 2, 4, stretch="lin") #il parametro stretch=lin aumenta il range







