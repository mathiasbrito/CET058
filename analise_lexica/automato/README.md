# Projeto - Parte 1

Escreva um Autômato na sua linguagem de preferência (Sem utilizar 
biblioteca de terceiros). Este automato deve reconhecer os tokens referentes
a uma expressão matemática do tipo:

a + b - c
a * c - a
a - b * c

Os tokens devem ser exibidos no formato `<nome_do_token, lexema>`, exemplo:

```
<soma,>
<identificador, a>
<identificador, b>
```

O Automato receberá como entrada uma string e analisará cada caractere, caso
atinja um estado final. Imprimir na tela o token, caso não imprimir o que foi
lido. Abaixo um exemplo de automato:

![Exemplo de Autômato](exemplo.png?raw=true "Exemplo de Autômato que reconhce operadores relacionais.")

Após a implementção, faço um relatório de no máximo duas páginas explicando
as limitações que encontrou, para isso test o seu programa intensamente sob
diferentes entradas.

Data da Entrega: 04/11

