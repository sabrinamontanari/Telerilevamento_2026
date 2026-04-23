#CREARE UN CODICE QR
# installare da CRAN:
install.packages("qrcode")

library(qrcode)
 
url <- "https://github.com/sabrinamontanari"
qr <- qr_code(url)

#PER SALVARLO COME IMMAGINE
png("github_profile_qr.png", width = 1000, height = 1000)
plot(qr)
dev.off()
