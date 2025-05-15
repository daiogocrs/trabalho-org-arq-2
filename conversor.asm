.data
menu:         .asciiz "\n=== Conversor de Temperatura ===\n1 - Celsius para Fahrenheit\n2 - Fahrenheit para Celsius\n0 - Sair\nEscolha: "
erroMsg:      .asciiz "Opcao invalida. Tente novamente.\n"
msgCelsius:   .asciiz "Digite a temperatura em Celsius: "
msgFahrenheit:.asciiz "Digite a temperatura em Fahrenheit: "
labelC:       .asciiz "Resultado: "
labelF:       .asciiz "Resultado: "
unidadeC:     .asciiz " °C\n"
unidadeF:     .asciiz " °F\n"

.text
.globl main

main:
main_loop:
    # Exibe menu
    li $v0, 4
    la $a0, menu
    syscall

    # Lê a escolha do usuário
    li $v0, 5
    syscall
    move $t0, $v0      # $t0 = escolha

    # Se 0, sair
    beq $t0, $zero, sair_programa

    # Se 1, Celsius -> Fahrenheit
    li $t1, 1
    beq $t0, $t1, chama_celsius_fahrenheit

    # Se 2, Fahrenheit -> Celsius
    li $t1, 2
    beq $t0, $t1, chama_fahrenheit_celsius

    # Caso inválido
    li $v0, 4
    la $a0, erroMsg
    syscall
    j main_loop

# ===========================
# Sub-rotinas de conversão
# ===========================

chama_celsius_fahrenheit:
    jal conv_celsius_fahrenheit
    j main_loop

chama_fahrenheit_celsius:
    jal conv_fahrenheit_celsius
    j main_loop

# Celsius -> Fahrenheit: F = C * 9 / 5 + 32
conv_celsius_fahrenheit:
    # Solicita entrada
    li $v0, 4
    la $a0, msgCelsius
    syscall

    li $v0, 6       # Ler float
    syscall
    mov.s $f2, $f0  # $f2 = Celsius

    # C * 9
    li.s $f4, 9.0
    mul.s $f6, $f2, $f4

    # / 5
    li.s $f4, 5.0
    div.s $f6, $f6, $f4

    # + 32
    li.s $f4, 32.0
    add.s $f12, $f6, $f4  # $f12 = Fahrenheit final

    la $a1, unidadeF      # Unidade de saída
    jal print_float_result
    jr $ra

# Fahrenheit -> Celsius: C = (F - 32) * 5 / 9
conv_fahrenheit_celsius:
    # Solicita entrada
    li $v0, 4
    la $a0, msgFahrenheit
    syscall

    li $v0, 6       # Ler float
    syscall
    mov.s $f2, $f0  # $f2 = Fahrenheit

    # F - 32
    li.s $f4, 32.0
    sub.s $f6, $f2, $f4

    # * 5
    li.s $f4, 5.0
    mul.s $f6, $f6, $f4

    # / 9
    li.s $f4, 9.0
    div.s $f12, $f6, $f4  # $f12 = Celsius final

    la $a1, unidadeC      # Unidade de saída
    jal print_float_result
    jr $ra

# ===========================
# Função para imprimir resultado com unidade
# Entrada:
#   $f12 = valor float
#   $a1 = endereço da unidade (°C ou °F)
# ===========================
print_float_result:
    # Imprime label
    li $v0, 4
    la $a0, labelC     # "Resultado: "
    syscall

    # Imprime valor
    li $v0, 2
    syscall

    # Imprime unidade
    li $v0, 4
    move $a0, $a1
    syscall

    jr $ra

# ===========================
# Encerra o programa
# ===========================
sair_programa:
    li $v0, 10
    syscall
