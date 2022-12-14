# Método de Levenberg-Maquardt para Quadrados Mínimos


## Apresentação <span id="Depnd"><span>



Apresentamos uma implementação para o método de Levenberg-Maquardt para resolução do problema de quadrados mínimos na linguagem de programação [julia](https://julialang.org/). A partir de um conjunto de dados representados em uma matriz $A$ de dimensão $n \times 2$ em que cada linha representa: na primeira coluna o $\textit{input}$ e na segunda coluna o $\textit{output}$ de uma função a ser modelada. O método utiliza uma função modelo $f: \mathbb{R} \times \mathbb{R}^k \rightarrow \mathbb{R}$ e busca encontrar um parâmetro ótimo para que a função modelo melhor se aproxime dos dados fornecidos pela matriz $A$. Para isso, definimos $R: \mathbb{R}^k \rightarrow \mathbb{R}^n$ pondo 

$R(t) =(y_1 - f(x_1,t), \ldots, y _n - f(x_n,t))$,
 
onde $x_i$ e $y_i$ são, respectivamente, a primeira e a segunda coluna da $i$-ésima linha de $A$. Assim, o objetivo é resolver o problema de otimização


$\displaystyle \min_{t \in \mathbb{R}^k} \frac{1}{2}||R(t)||^2$.

As condições teóricas para o método bem como uma análise com respeito ao parâmetro de Damping são apresentadas no arquivo `theory.pdf`.

   




## Instalação


É além do julia propriamente dito é necessário ter instalado em seu computador o seguinte pacote:

 - [ForwardDiff](https://github.com/JuliaDiff/ForwardDiff.jl)


## Dependências


* `Put_in_vector.jl`: tem como objetivo criar a função $R$ como na [Apresentação](#Depnd) a partir da função modelo $f$. O arquivo contém uma função com três entradas:
    - Uma `matriz` $A$ de dimensão $n \times 2$ com entradas em `::Float64`;
    -  Uma `função` $f: \mathbb{R} \times \mathbb{R}^k \rightarrow \mathbb{R}$ como a função modelo;
    -  Um `vetor` $t_0$ de dimensão $k$.

* `Differentiation.jl`: tem como objetivo calcular a derivada de $R$ como na [Apresentação](#Depnd) no parâmetro $t_0$. O arquivo contém uma função com as mesmas entradas da função em `Put_in_vector.jl`
    
    




## Utilização do arquivo `Levenberg-Maquardt.jl`


Para utilizar o algoritmo é necessário compilar o arquivo `Load_packs.jl` para carregar os pacotes do julia e as dependências da pasta `DEPENDENCIES`.

O algoritmo tem como entradas obrigatórias, nesta ordem:

 * Uma `matriz` $A$ de dimensão $n \times 2$ com entradas em `::Float64`;
 * Uma `função` $f: \mathbb{R} \times \mathbb{R}^k \rightarrow \mathbb{R}$ como a função modelo;
 * A dimensão $k$ que representa o número de parâmetros que o modelo apresenta.

Os entradas opcionais vem logo em seguida sendo:
 * `Parâmetro de Damping`. Apresentamos cinco alternativas para o parâmetro de Damping que serão inseridas a partir de um dos números $1,2,3,4$ e $5$ no formato `::Int32`, o padrão é a opção $5$. Caso o usuário prefira usar um parâmetro de Damping fixo basta inseri-lo no formato `::Float64`. Para ver o os parâmetros de Damping representados pelos números $1,2,3,4$ e $5$, veja o arquivo `theory.pdf`;
 * `Precisão de parada`, o padrão é $10^{-5}$;
 * `Número máximo de iterações`, o padrão é $1000$.

O retorno do algoritmo são, nesta ordem, um vetor com os parâmetros para a função modelo de acordo com o dados fornecidos pela matriz e o número de iterações utilizadas.

 
 # Método de Levenberg-Maquardt para Quadrados Mínimos -- Análise do Parâmetro de Damping

## Apresentação

Buscamos analisar a eficiência de algumas propostas para parâmetro de Damping no método de Levenberg-Maquardt implementado em [Método de Levenberg-Maquardt para Quadrados Mínimos](https://github.com/morescoh/Levenberg_Maquardt.git). A análise é feita baseada em uma base de [problemas testes](https://u.pcloud.link/publink/show?code=XZCY8jVZ1WK4Mso5V2B8fVDqzai9mFaWxJQ7). Os arquivos necessários para realizar essa análise estão na pasta `TEST` e arquivos no formato dos contidos no arquivo [problemas testes](https://u.pcloud.link/publink/show?code=XZCY8jVZ1WK4Mso5V2B8fVDqzai9mFaWxJQ7). Inicialmente, é preciso carregar os pacotes necessários incluindo o arquivo `Load_packs.jl` utilizando o comando
```
include("Load_packs.jl")
```
É preciso definir a pasta em que os arquivos estão utilizando o comando:
```
Pasta  =  "Diretório_dos_arquivos_a_serem_analisados"
```
Escolher o parâmetro de Damping como
```
PD = n
```
onde $n$ é no formato `::Int64` um número de $1$ à $5$. Por fim, basta utilizar
```
include("Comparation.jl")
```
O retorno será um vetor contendo o número iterações para cada um dos problemas e a média dos valores nesse vetor.
