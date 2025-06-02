# Jeu en texte (Devinette de nombre) en MIPS

# Ce programme génère un nombre secret et demande à l'utilisateur de le deviner.
# Chaque tentative est comparée et un message est affiché.
# Fonctionne avec QtSpim ou MARS.

.data
prompt:     .asciiz "Devine le nombre (entre 1 et 100) : "
trop_petit: .asciiz "Trop petit !\n"
trop_grand: .asciiz "Trop grand !\n"
bravo:      .asciiz "Bravo, tu as deviné !\n"

secret_num: .word 42        # Nombre à deviner (peut être remplacé par génération aléatoire)

.text
.globl main

main:
    li $v0, 4                # syscall pour afficher une chaîne
    la $a0, prompt
    syscall

loop:
    li $v0, 5                # lire un entier
    syscall
    move $t0, $v0            # $t0 = entrée utilisateur

    lw $t1, secret_num       # $t1 = nombre secret

    beq $t0, $t1, gagne      # si égal → victoire
    blt $t0, $t1, petit      # si entrée < secret → trop petit
    bgt $t0, $t1, grand      # si entrée > secret → trop grand

petit:
    li $v0, 4
    la $a0, trop_petit
    syscall
    j main

grand:
    li $v0, 4
    la $a0, trop_grand
    syscall
    j main

gagne:
    li $v0, 4
    la $a0, bravo
    syscall

    li $v0, 10               # quitter
    syscall
