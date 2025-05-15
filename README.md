# 🔥 Conversor de Temperaturas em MIPS Assembly

Este projeto implementa um conversor de temperaturas no simulador **MIPS Assembly**, utilizando operações com ponto flutuante, condicionais, sub-rotinas e entrada/saída de dados. Desenvolvido como parte de um trabalho acadêmico.

## 📌 Funcionalidades

- Conversão de **Celsius para Fahrenheit**
- Conversão de **Fahrenheit para Celsius**
- Interface de terminal com menu interativo
- Aceita valores com **casas decimais (float)**
- Mostra resultados com unidade (°C ou °F)
- Loop para repetir até o usuário escolher sair
- Estrutura modular com **sub-rotinas (`jal` / `jr`)**

## 🚀 Como executar

1. Baixe o simulador [**MARS**](http://courses.missouristate.edu/kenvollmar/mars/) ou [**QtSPIM**](https://sourceforge.net/projects/spimsimulator/)
2. Abra o arquivo `.asm` do projeto no simulador
3. Monte (Assemble) e execute (Run)
4. Siga o menu no terminal:

=== Conversor de Temperatura ===
1 - Celsius para Fahrenheit
2 - Fahrenheit para Celsius
0 - Sair
Escolha:

## 💡 Exemplos

- Entrada: `1` (Celsius → Fahrenheit)  
  Temperatura: `100.0`  
  Resultado: `212.0 °F`

- Entrada: `2` (Fahrenheit → Celsius)  
  Temperatura: `32.0`  
  Resultado: `0.0 °C`

## 🧠 Estrutura do Código

- `main_loop`: exibe o menu e chama as funções
- `conv_celsius_fahrenheit`: lógica de C → F
- `conv_fahrenheit_celsius`: lógica de F → C
- `print_float_result`: imprime resultado com unidade
- `sair_programa`: finaliza o programa

## 👨‍💻 Equipe

- Diogo Borges Corso [daiogocrs]
- João Vitor Wagner Pereira [joaovwp]
- Lívia Souza Rech [livia-sz]

## 📁 Licença

Este projeto é apenas para fins acadêmicos e educacionais.