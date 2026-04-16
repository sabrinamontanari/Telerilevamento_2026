library(terra)
setwd("/Desktop/")
#c://labla/lblabknlnln
getwd()

list.files()

richat <- rast("richatstructure_oli_20260306.jpg") #immagine scaricata
richat <- flip(richat)

png ("figura.png") 
plot(richat)
dev.off()

png("bande.png)
im.multiframe(2,1)
plot(richat[[1]])
plot(richat[[2]])
dev.off()

