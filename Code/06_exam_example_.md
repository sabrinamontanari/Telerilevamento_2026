#Questo sarà il titolo del progetto d'esame
l'area di studio ... ecc.ecc.ecc.ecc.ecc.ecc.ecc.ecc.ecc.ecc.ecc.ecc.ecc.

ho scelto la mauritania perchè...
trascino immagine

##pacchetti utilizzati
per questo esame ho usato questi pacchetti:
ecc.

#backtick alt+96 -> ` per il codice
```r
library(terra) #pacchetto per...
library(imageRy) #per multiframe e altro
```

#importazione dati
i dati sono stato scaricati da [Earth Observatory](https://earthobservatory.nasa.gov/)

il codice utilizzato è il seguente; prima di tutto selezionamo la working directory:
```r
setwd("/Desktop/")
#c://labla/lblabknlnln
getwd()
list.files()
```
per importare i dati è stata utilizzata la funzione `rast()` del pacchetto `terra`:
```r
richat <- rast("richatstructure_oli_20260306.jpg") #immagine scaricata
richat <- flip(richat)
plot(richat)
```
    trascino l'immagine figura.png nel markdown 

## Analisi esplorativa
prima di tutto ..plottaggio singole bande
```r
png("bande.png)
im.multiframe(2,1)
plot(richat[[1]])
plot(richat[[2]])
dev.off()
```
    trascino immagine bande.png

siccome sono pigro ho usato un ciclo for:
```r
par()
ecc.
```





