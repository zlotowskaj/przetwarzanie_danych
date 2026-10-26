#ladowanie paczek 
library("dplyr")
iris <- iris

#indeksowanie, pierwsza kolumna
iris[,1]
mean(iris[,1])

#zaokraglenie, jak wyzej, do 2 miejsc
round(mean(iris[,1]),digits = 2)

#zaokraglenie w gore i dol
floor(mean(iris[,1]))
ceiling(mean(iris[,1]))

#mediana z drugiej kolumny
median(iris$Petal.Width)

#nowa kolumna w ramce danych, na podstawie dzialania
#suma, kolumna nr 4 + kolumna nr 3
iris$wynik_sumy <- iris$Petal.Width + iris[,3]

#nadpisanie kolumny nr 2
#logarytm naturalny
iris[0,2] <- log(iris[,2])
summary(iris)

mean(iris$Petal.Length)
mean(iris[101-150,3])

#średnia długosc platka dla argumentu virginica ↑
# 1 sposob - kiedy mozna przescrollowac
mean(iris[101:150,3])
#2 sposob kiedy nie mozna przescrollowac i wypisac wiersze 
mean(iris[iris$Species="virginica",3])

#POCZĄTEK PRACY Z PACZKĄ DPLYR

#pierwsza funkcja z pakietu dyprl :: select()
#select - pracuje z kolumnami, filter - pracuje z wierszami

#wybieranie za pomoca nazwy - jedna kolumna
#iris Petal.length
iris$Petal.Length
iris[,3]

dplyr::select(iris,Petal.Length)
# -> trzeba napisać ręcznie nazwę kolumny, ale ładniej podaje dane w ramce

#wybranie więcej niż jednej kolumny po nazwie
dplyr::select(iris,Petal.Length,Sepal.Length)

#wybieranie negatywne
dplyr::select(iris,-Species)

#wybieranie negatywne, wiecej niz jedna kolumna
dplyr::select(iris,-c(Petal.Length,Species))
dplyr::select(iris,Sepal.Length:Petal.Width)

#Wybieranie za pomocą wyszukiwania nazwy
#wybieranie za pomoca poczatku nazwy - petal
dplyr::select(iris,dplyr::starts_with("Petal"))

#wybieranie za pomoca konca - legth
dplyr::select(iris, dplyr::ends_with("length"))

#wybieranie za pomoca arbitalnego ciagu znakow
dplyr::select(iris, dplyr::contains("."))
dplyr::select(iris, dplyr::contains("_"))
