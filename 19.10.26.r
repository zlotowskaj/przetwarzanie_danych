#Zaladowanie paczki
library("tidyverse")

#pierwszy wektor, 5 liczb
gdansk <- c(977, 2, 1, 2009, 2023)
# sprawdzanie struktury
str(gdansk)

is.numeric(gdansk)
is.character(gdansk)
#z przypisaniem
median(gdansk)
mediana <- median(gdansk)
mediana
#puste wartosci
marchewka <- c(6, 60, 666, 6.6, 7L, NA)
median(marchewka)
median(marchewka, na.rn=TRUE)
median(x=marchewka, na.rm = TRUE)
#pomijanie wartosci NA
na.omit(marchewka)

#wczytywanie danych csv
#z internetu
dane_finansowe <- readr::read_csv("https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2025-financial-year-provisional/Download-data/annual-enterprise-survey-2025-financial-year-provisional-size-bands.csv")
#dane z dysku
dane_z_dysku_1 <- readr::read_csv("business-employment-data-june-2026-quarter-csv/machine-readable-business-employment-data-june-2026-quarter .csv")

#indeksowanie wartosci
#czwarta pozycja w wektorze
gdansk[4]
#nadpisywanie wartosci
gdansk[4] <- c(2028)
gdansk[4] <- c(2009)
gdansk[5] <- c(2027)

#zdefiniowanie wektoru 1,2,3
wybory <- c(1,2,3)
gdansk[wybory]

#indeksowanie ramki
# z ramki dane finansowe - wybrac kolumne nr 2 i wiersz nr 4
dane_finansowe[4,2]
dane_finansowe[,c(2,3)]

#z ramki dane finansowe wybrac kolumny odpowiadajace wektorowi wybor i pierwsze dwa wiersze
dane_finansowe[c(1,2),wybory]
#jedna specyficzna kolumna
dane_finansowe$year
