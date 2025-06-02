# Émulation d’un automate fini déterministe (DFA) en MIPS
# Cet automate reconnaît les chaînes binaires contenant un nombre pair de 0 (zéro).
# Exemple de chaînes acceptées : "", "11", "1010", "0011"
# Rejetées : "0", "10", "0001"

.data
prompt:     .asciiz "Entrez une chaîne binaire (0 et 1 uniquement) : "
accept:     .asciiz "Chaîne acceptée !\n"
reject:     .asciiz "Chaîne rejetée.\n"
newline:    .asciiz "\n"
buffer:     .space 100       # buffer pour la chaîne entrée

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 8               # lire la chaîne
    la $a0, buffer
    li $a1, 100
    syscall

    # Initialiser l'état à 0 (état initial : paire de 0)
    li $t0, 0               # $t0 = état (0 = pair, 1 = impair)
    la $t1, buffer          # $t1 = pointeur sur la chaîne

loop:
    lb $t2, 0($t1)          # charger le caractère courant
    beq $t2, 10, check_end  # fin de ligne (\n)
    beqz $t2, check_end     # fin de chaîne (null)

    # Vérifier si caractère est '0' ou '1'
    li $t3, 48              # ASCII '0'
    beq $t2, $t3, is_zero

    li $t3, 49              # ASCII '1'
    beq $t2, $t3, is_one

    # Caractère invalide → rejet immédiat
    j reject_str

is_zero:
    # basculer l'état
    xori $t0, $t0, 1        # pair <-> impair
    j next_char

is_one:
    # état inchangé
    j next_char

next_char:
    addi $t1, $t1, 1
    j loop

check_end:
    beqz $t0, accept_str    # état 0 = accepté
    j reject_str

accept_str:
    li $v0, 4
    la $a0, accept
    syscall
    j exit

reject_str:
    li $v0, 4
    la $a0, reject
    syscall

exit:
    li $v0, 10
    syscall
