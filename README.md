# Analiza Glazbenih Preferencija i Mentalnog Zdravlja

Projekt iz kolegija Statistička analiza podataka koji istražuje vezu između glazbenih navika i mentalnog zdravlja.

Članovi tima: Ena Dvojak, Patrik Blašković, Mislav Hlupić, Eugen Vucelić

## O Projektu

Projekt analizira podatke prikupljene putem ankete o glazbenim preferencijama i mentalnom zdravlju. Istražujemo kako različiti aspekti slušanja glazbe (žanrovi, vrijeme slušanja, dob, streaming servisi) koreliraju s mentalnim zdravljem pojedinaca.

## Ključna Istraživačka Pitanja

-   Slušaju li skladatelji više glazbe dnevno od drugih?
-   Je li korelacija između frekvencije služanja X žanra i samoprocijenjen razine depresije statistički značajna?
-   Postoji li povezanost između korištenog servisa i sklonosti istraživanju nove muzike?
-   Razlikuje li se prosječni broj sati slušanja glazbe značajno među korisnicima ovisno o njihovim omiljenim žanrovima?
-   Može li se iz zadanih podataka predvidjeti dob ispitanika?

## O Podacima

Analiza se temelji na skupu podataka koji obuhvaća: - 736 ispitanika - 33 varijable (demografija, glazbene preferencije, mentalno zdravlje) - Informacije o streaming servisima, navikama slušanja, žanrovskim preferencijama - Samoprocjene mentalnih stanja

## Struktura Projekta

``` text
project/
├── data/               # Podaci (raw i processed)
├── R/                  # R skripte
├── renv.lock           # Lista projektne pakete i njihove verzije
├── .Rprofile           # Aktivira renv za projekt 
├── report.Rmd          # R markdown report
└── output/             # Generirani grafovi i tablice
```
