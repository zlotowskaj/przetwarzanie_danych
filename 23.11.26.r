#Ładowanie paczek
library(tidyverse)

#Ładowanie danych

pingu <- penguins

# ZMIANA NAZW KOLUMN I POCHODNE : dpylr::(rename)
#Składnia funkcji rename i mutate: rename(dane, NOWA = STARA)

#zmiana nazwy kolumny species na gatunek (na chwile)
dplyr::rename(pingu, gatunek = species)

#zmiana nazwy kolumny species na gatunek (na zawsze)
pingu <- dplyr::rename(pingu, gatunek = species)

#zmiana dwóch nazwy kolumn, wyspa oraz dlugosc_dzioba
pingu <- dplyr::rename(pingu, wyspa = island, dlugosc_dzioba=bill_len)

#zmiana nazwy w peinguins, island zamien na species (wyjdzie błąd)
penguins <- dplyr::rename(penguins, species = island)

#WYKORZYSTANIE WEKTORA Z NAZWAMI (data dictionary) - definiowanie nazw
#Wektor stringów bez nazw
nazwy <- c("kot","fotel")

#wektor (stringów) nazwany 
nowe_nazwy <- c(plec = "sex", rok = "year",waga = "weight")

#all_of - wszystkie wartosci musza istniec (błąd, bo weight nie istnieje)
dplyr::rename(penguins, dplyr::all_of(nowe_nazwy))

#any_of - tylko wybrane wartosci 
dplyr::rename(penguins, dplyr::any_of(nowe_nazwy))

#ZMIANA ZA POMOCĄ FUKNCJI :  dplyr::rename_with()
#zmiana wszystkich nazw w pingu na pisanie wielką literą
pingu <- dplyr::rename_with(pingu,\(x) toupper(x))

#zmiana GATUNEK, WYSPA i DŁUGOSC_DZIOBA na mała
pingu <- dplyr::rename_with(pingu,\(x) tolower(x), c(GATUNEK, WYSPA, DLUGOSC_DZIOBA))

#zmiana wszystkich kolumn numerycznych na pisane mała literą
#moja wersja
pingu <- dplyr::rename_with(pingu,\(x) tolower(x), c(when(pingu, is.numeric)))
#wersja maurycego
pingu <- dplyr::rename_with(pingu,\(x) toupper(x),dplyr::where(\(y) is.numeric((y))))

#Zamiana wszystkich nazw kolumn na pisanie małą literą 
pingu <- dplyr::rename_with(pingu, \(x) tolower(x), dplyr::everything())


#SKLEJANIE TEKSTU <- funkcja paste i paste0
jeden <- "jeden"
dwa <- "dwa"
paste(jeden,dwa)
paste(jeden, dwa, sep = " ")
paste0(jeden, dwa)

#paste pracuje z dowolnym separatorem tekstu, domyslnie spacja
#paste0 wykorzystuje pusty separator


kasztan <- c("budyn", "wiewior", "drzewko")
#do każdego wyrazy w kasztanie dodaj slowo mniam 
mniam <- "mniam"
paste(kasztan, mniam)
paste(kasztan, "mniam")

#dopisz jednostke pomiaru "_mm" do kolumn z pomiarami dlugosci i glebokosci - kolumny zakonczone na len i dep
pingu <- dplyr::rename_with(pingu, \(x) paste0(x, "_mm"), dplyr::ends_with(c("_len","_dep")))

#zamien w nazwach wszystkie podkreslenia "_" na kropkę "."
#stringr - paczka do pracy z tekstem tidverse
#stringr::str_replace(obiekt, "dopasowanie", "zmiana")
dplyr::rename_with(penguins,\(x) stringr::str_replace(x, "_", "."))

#ZMIANA KOLEJNOSCI KOLUMN W RAMCE DANYCH <- dplyr::relocate()
#.before = przenies przed
#.after = przenies za

#Zmień pozycje dlugosc_dzioba - przenies przed wyspa 
dplyr::relocate(pingu, dlugosc_dzioba,.before = wyspa)

#zmien pozycje wszystkich kolumn zawierajacych "e" tak aby byly po kolumnie gatunek
dplyr::relocate(pingu, contains("e"),.after = gatunek)
