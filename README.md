
# Conversor de Temperatura em Portugol para Processador BIP

Este projeto implementa um conversor de temperaturas entre Celsius e Fahrenheit utilizando a linguagem **Portugol**, desenvolvida para simular instruções de alto nível compiláveis para a **arquitetura BIP (Básico Interpretador de Programas)**.

## 📌 Contexto

Projeto desenvolvido como parte da disciplina de **Organização e Arquitetura de Computadores** do curso de **Engenharia da Computação - UFSC Araranguá**.

O código visa reforçar conceitos fundamentais como:
- Operações aritméticas sem multiplicação e divisão direta (restrições do BIP)
- Uso de laços e estruturas condicionais
- Conversão de instruções de alto nível em manipulações compatíveis com hardware simplificado

## 📐 Arquitetura

O processador **BIP** não suporta multiplicação, divisão ou funções complexas diretamente. Assim, as conversões de temperatura foram feitas utilizando:
- Somatórios para multiplicação
- Subtrações sucessivas para divisão
- Controle de sinal para lidar com números negativos (em complemento de dois)
- Arredondamento manual para garantir precisão na conversão de Fahrenheit para Celsius

## 🔄 Regras de Conversão

Como o BIP trabalha com apenas **uma entrada numérica** e **uma saída numérica**, foram adotadas regras de interpretação:

- Se o valor de entrada estiver entre `-999` e `999`, ele será interpretado como temperatura em **graus Celsius**
- Se o valor for **maior ou igual a 1000**, ele será interpretado como **temperatura em Fahrenheit** deslocada em `+1000`

### Exemplos:

| Entrada | Interpretação | Saída |
|---------|---------------|-------|
| `25`    | 25°C          | `77`  |
| `-40`   | -40°C         | `-40` |
| `1050`  | 50°F          | `10`  |
| `2010`  | -10°F         | `-23` |

## 🛠 Execução

Este código foi testado e executado utilizando o ambiente de simulação **BIPIDE**.

**Arquivo principal:** `conversor.bip`

Abra este arquivo no **BIPIDE**, execute e insira o valor desejado.

**Exemplo de entrada e saída esperada:**

```
Entrada: 1050
Saída: 10
```

## 📄 Arquivo Principal

- `conversor.bip`: contém todo o código-fonte com tratamento completo de sinais, operações sem multiplicação e arredondamento correto para a divisão.

## 👨‍💻 Autor

- **Aluno**: Diogo Borges Corso
- **Curso**: Engenharia da Computação
- **Universidade**: Universidade Federal de Santa Catarina - Campus Araranguá
- **Disciplina**: Organização e Arquitetura de Computadores
