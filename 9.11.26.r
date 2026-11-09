#przywołanie paczek
library(tidyverse)

#wczytanie danych iris
iris <- iris

#wybor kolumn, ktore zaczynaja sie na Petal i zawierają "dth"
dplyr::select(iris,dplyr::starts_with("petal")&dplyr::contains("dth"))
#  & = and

#wybor kolumny, ktore zaczynaja sie na petal lub zawieraja dth
dplyr::select(iris, dplyr::starts_with("petal")|dplyr::contains("dth"))
#       | = or   (czasami działa też przecinek)


#Gwiezdne Wojny
swars <- starwars

#zdefiniowanie własnej funkcji 
anonim <- function(x){
  x+1
}

#wektor liczb
roman <- c(4,7,9,2,1,0)

#nowy wektor, mutacja romana z uzyciem anonima
anonim(roman)

# Wybor kolumn numerycznych za pomoca funkcji (anonimowej)
#   wykorzystywanie funkcji do sprawdzenia typu funkcji i warunkow spelnianych przez kolumny
#      dplyr::where()
dplyr::select(swars,dplyr::where(\(kolumna)is.numeric(kolumna)))

#wybor wszystkich kolumn tekstowych 
dplyr::select(swars,dplyr::where(\(kolumna)is.character(kolumna)))

#Wybor kolumn tekstowych z "r" w nazwie
dplyr::select(swars,dplyr::contains("r"))
dplyr::select(swars,dplyr::where(\(kolumna)is.character(kolumna))&dplyr::contains("r"))

#wybor kolumn numerycznych, w ktorych średnia jest niższa niz 100
dplyr::select(swars,dplyr::where(\(kolumna)is.numeric(kolumna)&&mean(kolumna,na.rm=TRUE)<100))
#   !!! nie można policzyć średniej z NA, więc trzeba je ominąć <- na.rm=TRUE

#wybor kolumn tekstowych i liczbowych, ktore zaczynaja sie na "h"
dplyr::select(swars,dplyr::where(\(kolumna)is.character(kolumna)||is.numeric(kolumna))&dplyr::starts_with("h"))

#wybor kolumn numerycznych, w ktorych srednia jest wyzsza niz 70 i nizsza niz 90
dplyr::select(swars, dplyr::where(\(kolumna)is.numeric(kolumna)&&mean(kolumna,na.rm=TRUE)>70&&mean(kolumna,na.rm=TRUE)<90))

#używanie wcześniej zdefiniowanych nazw
schowek <- c("name","mass")

schowek_z_bledem <- c("name", "naaame", "mass")

#wybor select na podstawie wektorow (wybiersmy wszystkie wartosci ktore sa wspolne dla wektora [schowek]i bazy danych [swars])
dplyr::select(swars,dplyr::all_of(schowek))

#to nie zadziała (bo schowek_z_bledem ma wartosc ktorej nie ma w naszej paczke swars, a all_of bierze wszystko co pasuje albo nic)
dplyr::select(swars,dplyr::all_of(schowek_z_bledem))

#To zadziała (bo wybieramy any_of wiec wybuera jakiekolwiek jakie pasuje)
dplyr::select(swars,dplyr::any_of(schowek_z_bledem))
