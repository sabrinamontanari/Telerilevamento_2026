# INCENDIO SUL MONTE MORRONE - Parco Nazionale della Majella (Abruzzo)
### Esame di Telerilevamento Geo-Ecologico in R - 2026
#### Sabrina Montanari
# 1. Introduzione
L'incendio boschivo divampato nell'estate 2017, tra fine agosto e inizio settembre, ha colpito il **Monte Morrone**, situato all'interno del **Parco Nazionale della Majella** in Abruzzo. L'evento ha distrutto oltre 2.000 ettari di copertura forestale, danneggiando gravemente popolamenti di pino nero e faggete di elevato valore ecologico. 

 > Monte Morrone
<p align="center">
 <img src="img/montemorrone.jpg" width="700">
</p>

In questo progetto analizziamo l'impatto dell'incendio sulla vegetazione nell'area dell'Appennino centrale, attraverso immagini satellitari **Sentinel-2** in due momenti temporali:
- Pre-incendio: 1° Luglio 2017 – 15 Agosto 2017 (condizione della vegetazione precedente all'incendio)
- Post-incendio: 15 Settembre 2017 – 15 Ottobre 2017 (situazione subito dopo l'estinzione del rogo)

> Area di studio (Parco della Maiella)
<p align="center">
 <img src="img/areastudio.png" width="700">
</p>

# 2. Obiettivo
Analizzare e quantificare le variazioni spettrali indotte dall'incendio del Monte Morrone sulla copertura vegetale, confrontando le acquisizioni satellitari Sentinel-2 prima e dopo l'evento.
* **Stima della severità ($dNDVI$):** Calcolare la differenza multitemporale $dNDVI = NDVI_{pre} - NDVI_{post}$ per mappare con precisione il perimetro del bruciato e classificare i livelli di danno subiti dall'ecosistema forestale.

## Sono stati calcolati i seguenti indici vegetazionali:
- NDVI (Normalized Difference Vegetation Index) – salute della vegetazione
- DVI (Difference Vegetation Index) – quantità assoluta di vegetazione
- NBR (Normalized Burn Ratio) – aree bruciate

# 3. Metodologia
Le immagini satellitari sono state scaricate da [**Google Earth Engine**](https://earthengine.google.com/), utilizzando il codice Java script fornito durante il corso e in seguito modificato per ottenere l'area e le date di interesse.
### Installazione dei pacchetti
Una volta impostata la working directory, sono stati installati i pacchetti in R necessari alle analisi:
```r
setwd("C:\\Teleril_GEE_exports")
getwd()
list.files()
# Pacchetti
library(terra) # Per lavorare con raster e immagini satellitari
library(imageRy)
library(viridis)
library()
```
### Importazione delle immagini
Per importare i dati è stata utilizzata la funzione `rast()` del pacchetto `terra` e le immagini sono state rinominate:
```r
pre <- rast("sentinel2_median_2026_pre.tif")
plot(pre)
```
> Immagine prima dell'incendio nelle 4 bande (B2, B3, B4, B8)
<p align="center">
 <img src="img/PRE.png" width="400">
</p>

```r
post <- rast("sentinel2_median_2026_post.tif")
plot(post)
```
> Immagine dopo dell'incendio nelle 4 bande (B2, B3, B4, B8)
<p align="center">
 <img src="img/POST.png" width="400">
</p>

### Visualizzo le immagini in RGB (colori reali)
Per farlo utilizzo la funzione `im.plotRGB()` del pacchetto `imageRy`
```r
im.multiframe(1,2) # visualizza due grafici sulla stessa riga
im.plotRGB(pre, r=3, g=2, b=1, title="pre-indendio")
im.plotRGB(post, r=3, g=2, b=1, title="post-indendio")
dev.off() # chiude il pannello di visualizzazione dell'immagine
```
<p align="center">
 <img src="img/RGB.png" width="400">
</p>

### Visualizzazione e confronto delle singole bande spettrali (B2, B3, B4, B8) 
utilizzo il pacchetto `viridis` e la scala di colori `magma` per analizzare le variazioni di riflettanza pre e post-incendio.
```r
png("Bande.png", width = 2200, height = 1200, res = 220) # salvare il file direttamente su disco impostandone risoluzione e dimensioni
im.multiframe(2, 4)
par(mar = c(2.5, 2.5, 2, 0.5)) # riduce i margini esterni attorno a ciascun grafico

# PRE-INCENDIO
plot(pre[[1]], col = magma(100), main = "Pre - Blue (B2)", cex.main = 0.8) 
plot(pre[[2]], col = magma(100), main = "Pre - Green (B3)", cex.main = 0.8)
plot(pre[[3]], col = magma(100), main = "Pre - Red (B4)", cex.main = 0.8)
plot(pre[[4]], col = magma(100), main = "Pre - NIR (B8)", cex.main = 0.8)

# POST-INCENDIO
plot(post[[1]], col = magma(100), main = "Post - Blue (B2)", cex.main = 0.8)
plot(post[[2]], col = magma(100), main = "Post - Green (B3)", cex.main = 0.8)
plot(post[[3]], col = magma(100), main = "Post - Red (B4)", cex.main = 0.8)
plot(post[[4]], col = magma(100), main = "Post - NIR (B8)", cex.main = 0.8)
dev.off()
```
<p align="center">
 <img src="img/Bande.png" width="900">
</p>
