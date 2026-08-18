# INCENDIO DI ALTO RENO TERME (BO)
### esame di Telerilevamento geo-ecologico in R - 2026
#### Sabrina Montanari
# 1. Introduzione
L'incendio boschivo di Alto Reno Terme è divampato la sera di Pasqua, il 5 aprile 2026, colpendo duramente la località di Biagioni, nella zona di Granaglione, al confine tra le province di Bologna e Pistoia. Il rogo ha interessato complessivamente 70 ettari dell'Appennino tosco-emiliano.

I danni al patrimonio naturalistico sono stati rilevanti, interessando boschi cedui e vegetazione montana, senza fortunatamente colpire centri abitati. Il rogo ha provocato un forte impatto ecologico sull'ecosistema. La distruzione del manto vegetale in queste aree, infatti, espone il terreno a un forte rischio di erosione del suolo e a potenziali fenomeni di dissesto idrogeologico in caso di piogge intense.

L'evento ha avuto inoltre un forte impatto sulla fauna selvtica in quanto è avvenutto in una stagione cruciale per la fauna appenninica, coincidente con i periodi di nidificazione dell'avifauna e il risveglio letargico di molte specie.
Inoltre, il fumo denso e la rapidità del fronte di fuoco hanno causato la perdita di microfauna, insetti impollinatori e piccoli roditori. Gli esemplari più grandi (caprioli, cinghiali, lupi) hanno subito lo spostamento forzato dal loro habitat naturale.

In questo progetto analizziamo l'impatto dell'incendio sulla vegetazione nell'area dell'Appennino tosco-emiliano, attraverso immagini satellitari Sentinel-2 in due momenti temporali:
- Pre-incendio: Marzo 2026 (situazione della vegetazione prima dell'inizio della stagione dei roghi)
- Post-incendio: Aprile 2026 (valutazione del danno subito subito dopo lo spegnimento ufficiale)
<p align="center">
<img width="30%" alt="incendioBO" src="https://github.com/user-attachments/assets/74e98bb7-a760-4ce8-baec-09a144c7f67d" />
</p>
#
Vengono calcolati i seguenti indici vegetazionali:
NDVI (Normalized Difference Vegetation Index) – salute della vegetazione
DVI (Difference Vegetation Index) – quantità assoluta di vegetazione
NBR (Normalized Burn Ratio) – aree bruciate
##
Area di studio
<p align="center">
<img width="50%" alt="area di studio" src="<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/f9847adb-cdef-4659-bee0-9206bdc8a92f" />
</p>
# 2. Obiettivo
Quantificare l'impatto dell'incendio sulla vegetazione subito l'evento.
# 3. Metodologia
Le immagini satellitari sono state scaricate da [**Google Earth Engine**](https://earthengine.google.com/), utilizzando il codice Java script fornito durante il corso e in seguito modificato per ottenere l'area e le date di interesse.
## Installazione dei pacchetti
Una volta impostata la working directory, sono stati installati i pacchetti in R necessari alle analisi:
'''r
setwd("C:\\Teleril_GEE_exports")
getwd()
list.files()
library(terra) # Per lavorare con raster e immagini satellitari
library()
ecc.
'''
