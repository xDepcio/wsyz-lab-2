# Modele analityczne (2024-03-18)

## Kolokwium
* 5 pierwszych wykładów
* pytania otwarte
* odp takie jak na wykładzie o modelach analitycznych
* narysować bpmn na podstawie opisu słownego
* pytania teoretyczne o definicje
* przygotować model na podstawie (danych?)


Zgłosić zespoły projektowe na maila WSYZ - projekt, 3 osoby

## Model
Model matematyczny jest odzwierciedleniem fragmentu rzeczywistości w formie zależności matematycznych

Wykład dotyczy modeli algebraicznych

* Model abstrakcyjny i model danych
* Model powinien być ogólny, a szczególna sytuacja jest opisywana przez dane
* Model podlega walidacji - jak udowodnić poprawność

## Model rzeczowy
* $y = f(x,p)$
    * $x \in X$ - wektor zmiennych decyzyjnych
    * $p \in P$ - wektor parametrów
    * $y \in Y$ - wektor zmiennych wyjściowych
    * $X$ - zbiór decyzji dopuszczalnych
    * $Y$ - zbiór ograniczeń na zmienne wyjściowe
    * $P$ - zbiór ograniczeń na parametry

### Zadania analizy modelu
* Symulacja
* Symulacja odwrotna
* Optymalizacja jednokryterialna
* Analiza wielokryterialna

### Symulacja
* Na etapie weryfikacji modelu
* Podajemy przykładowe wejście i parametry
* Patrzymy, czy wyjścia mają sens

### Symulacja odwrotna
* Jakie powinny być zmienne decyzyjne, żeby uzyskać określone wyjście
* Zadanie optymalizacji 
* $\min_{x \in X} |y - \hat{y}| + \rho |x - \hat{x}|$
	* $\rho$ - czynnik regularyzacji

### Optymalizacja
* Minimalizacja funkcji kosztu, określonego wyjścia
* Dotyczy jednego wyjścia
* $\min_{x \in X} q_i$

### Analiza wielokryterialna
* Często konfliktowe cele (np. cena vs jakość)
* $\min_{x \in X} \bf{q}$ 

## Klasyfikacja modeli
* Statyczne
	* liniowe - jeśli się da, to najlepiej budować model liniowy, stosować aproksymacje, są łatwiejsze obliczeniowo, bardzo wydajne solvery
	* dyskretne
	* nieliniowe
* Dynamiczne
* Stochastyczne
* Inne (np. oparte o zbiory rozmyte)

## Zadanie liniowe
* $\min_{x \in X} c^Tx$
* $Ax \le b, x \ge 0$

### Poziomica funkcji
....definicja


### Rough set
Do wygooglowania

## Operations research vs optimization
* Badania operacyjne  - zorientowane na zastosowania w przemyśle i usługach
* Optymalizacja - bardziej ogólny kontekst

## Modele w systemach zarządzania
* ...

## Narzędznia do modelowania i rozwiązywania zadań optymalizacji
* Narzędzia do modelowania
	* AMPL
	* AIMMS
	* GAMS
	* GNU MathProg
	* Pyomo (python)
* Solwery optymalizacyjne
	* MINOS
	* CPLEX
	* GUROBI
	* GLPK

## Model
* Specyfikacja symboliczna modelu (zbiory, indeksy, parametry, zmienne decyzyjne)....
* model a instancja modelu

Na kolokwium model ma być w postaci asbtrakcyjnej, sparametryzowanej