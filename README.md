# 1. Jeu de Devinette - MIPS Assembly

Un petit jeu interactif codé en assembleur MIPS où l'utilisateur doit deviner un nombre secret. Ce projet illustre la gestion des entrées/sorties, la logique conditionnelle, et la boucle de contrôle.

## Fonctionnalités

- Affiche un message demandant de deviner un nombre entre 1 et 100.
- Compare la tentative de l'utilisateur au nombre secret.
- Affiche :
  - `Trop petit !` si la tentative est inférieure.
  - `Trop grand !` si la tentative est supérieure.
  - `Bravo, tu as deviné !` si c'est correct.

##  Fichier

- `jeu.asm`

##  Exécution (QtSPIM / MARS)

1. Ouvrir le fichier `guessing_game.asm`.
2. Lancer le programme.
3. Entrer un nombre lorsque demandé.
4. Répéter jusqu'à deviner correctement.

>  Le nombre secret est actuellement fixé à `42` (modifiable dans le segment `.data`).

##  Exemple
Devine le nombre (entre 1 et 100) : 20
Trop petit !
Devine le nombre (entre 1 et 100) : 50
Trop grand !
Devine le nombre (entre 1 et 100) : 42
Bravo, tu as deviné !


# 2. Automate Fini Déterministe (DFA) - MIPS Assembly

Ce projet implémente un automate fini en assembleur MIPS, capable de reconnaître les chaînes binaires contenant un **nombre pair de zéros**.

##  Langage reconnu

L’automate accepte **toute chaîne binaire** (composée de `0` et `1`) ayant un **nombre pair de `0`**.

## Fichier

- `dfa.asm`

##  Exécution (QtSPIM / MARS)

1. Ouvrir le fichier dans QtSPIM ou MARS.
2. Entrer une chaîne binaire quand demandé.
3. Le programme affiche `Chaîne acceptée` ou `Chaîne rejetée`.

##  Exemples

| Entrée     | Résultat         |
|------------|------------------|
| `1010`     | Acceptée        |
| `000`      | Rejetée       |
| `11`       | Acceptée        |
| `1001`     | Acceptée        |
| `0`        | Rejetée        |

##  Contraintes

- La chaîne doit contenir uniquement `0` et `1`.
- Tout caractère invalide entraîne un rejet immédiat.

##  Concepts couverts

- Lecture de chaîne ASCII
- Transitions d’automate via registres
- État stocké et manipulé via XOR


