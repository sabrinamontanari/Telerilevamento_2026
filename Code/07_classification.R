# Code for classifying data

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

# set wd per immagine scaricata sul computer ******
setwd("~/Desktop")
getwd()

im.list()
#importo immagine presa dalla lista: solar orbiter-satellite che ottiene dati sul sole
sun <-im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

#classifico con la funzione im.classify
sunc <- im.classify(sun, num_clusters=3)    # uso 3 cluster/classi o colori  # di default risulta seed=NULL
#in R la funzione seed=un numero a caso, per decidere da punto decidere i colori
sunc <- im.classify(sun, num_clusters=3, seed=19)

# import Grand Canyon data
can <- im.import("dolansprings_oli_2013088_canyon_lrg.jpg")
# classify grand canyon data
cancc <- im.classify(can, num_clusters=4, seed=19)   
#per vedere numero di pixel dell'immagine uso ncell(can) # maggiore è il numero di pixel più è lento

******
# classifying image from internet
#list.files()
importo immagine scaricata
imm <- rast("filippine.jpg")
imm <- flip(imm)
plot(imm)
# classify data
immc <- im.classify(imm, num_clusters=2)

# classificazione Mato Grosso 
im.list()
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg") 
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")   

im.multiframe(2,1)
plot(m1992)
plot(m2006)

# classification
#1992
m1992c <- im.classify(m1992, num_clusters=2, seed=19)
m1992   #vedo: valore min 1 e max 2 --> li rinomino
# Assign labels 
levels(m1992c) <- data.frame(
  value = c(1, 2),
  label = c("forest", "human")
)
#2006
m2006c <- im.classify(m2006, num_clusters=2, seed=19)
# Assign labels 
levels(m2006c) <- data.frame(
  value = c(1, 2),
  label = c("forest", "human")
)

#percentages
freq1992 <- freq(m1992c)  #frequenza
freq1992 #mostra "count"
perc1992 <- freq1992$count *100 / ncell(m1992c)

freq2006 <- freq(m2006c)  #frequenza
perc2006 <- freq2006$count *100 / ncell(m2006c)

# creo una tabella
tabout <- data.frame(
  class=c("forest", "human")
  perc1992= c(83,17)    #valori risultati da perc1992 e perc 2006
  perc2006= c(45,55)
)

### CREO GRAFICO CON GGPLOT2
#inserisco i pacchetti library(ggplot2) e library(patchwork)
#ggplot(dato di entrata, estetica ovverso definizione della x e y) --> aes = aestetics
#sulla x metto la classe della mia tabella (forest o human), sulla y metto la percentuale (perc1992 e perc2006), colore= colora in modo diverso le due classi
#devo specificare a ggplot che tipo di grafico fare (aggiungo un "+" e )

# 1992
ggplot(tabout, eas(x=class, y=perc1992, color=class)) +      #structure
    geom_bar(stat="identity", fill="white") +        #grafico a barre; nelle parentesi inserisco (la statistica usata, colore interno delle barre)
    ylim(c(0,100))              #NB: le y hanno scala diversa quindi la sistemo

# 2006
ggplot(tabout, eas(x=class, y=perc2006, color=class)) +
    geom_bar(stat="identity", fill="white") +
    ylim(c(0,100))

### USO PATCHWORK - associo il grafico ad un oggetto
p1 <- ggplot(tabout, eas(x=class, y=perc1992, color=class)) + 
    geom_bar(stat="identity", fill="white") + 
    ylim(c(0,100)) +
    theme(legend.position="none")      #per evitare ripetizioni tolgo la legenda ad uno dei due grafici

p2 <- ggplot(tabout, eas(x=class, y=perc2006, color=class)) +
    geom_bar(stat="identity", fill="white") +
    ylim(c(0,100)) +
    theme(legend.position="none")
  # theme_minimal() --> sfongo bianco
  # theme_dark() --> sfondo nero

p1 + p2       # li visualizzo insieme




























