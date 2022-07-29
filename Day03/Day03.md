# Fund me

O mesmo que antes, vamos criar um arquivo .sol. Vamos chamá-lo de FundMe.sol e o mesmo da última vez que adicionamos o identificador de licença SPDX.

Chmaremos nosso contrato "FundMe"

![Fundme](Assets/Fundme.png)

### Proposito desse contrato

Nós queremos que esse contrato seja capaz de aceitar uma quantidade de pagamento.

### Payable function && Gas

![Payable](Assets/payPublic.png)

Quando definimos nossa função como `payable` significa que ela sera usada para pagar por coisas.
Cada chamada de função tem um valor associado.
Sempre que você faz una transação, você sempre pode acrescentar um valor.
Esse valor é quanto de `wei`, `gwei`, `finney` ou `ether` você irá enviar com a sua trnasação ou chamada de função.

`wei`, `gwei`, `ether` são apenas maneiras diferentes de falarmos sobre quanto de `ether` você vai enviar. Vemos a quantidade de `gwei` que equivale a `1 eth`

![calculator](Assets/e3.png)

- 1 `wei` é a menor quantidade de `Ethereum`, que você pode fracionar, nada será menor que 1 `wei`, por isso que quando falamos sobre quando que algo custa, sempre falamos por padrão em `wei`.

![fundDeploy](Assets/fund.png)

O botão está em vermelho pois ele é uma função payable, se clicarmos no botão, podemos associar um valor.

![valueAssociete](Assets/sendValue.png)

Então, o que queremos fazer com esse nosso contrato, ou melhor o que podemos fazer com ele quando as pessoas enviarem algo ?

Iniciamente vamos acompanhar quem nos enviou, portanto iremos criar uma mapping entre valor é endereço(addresses).

![mappingAddress](Assets/sendValue.png)

### Mapping, msg.sender, msg.value

Nessa função de fundos vamos acompanhar todas as pessoas que nos enviaram dinheiro ou todos os endereços que nos enviaram algum valor. Para isso usaremos algumas palavras chaves que acompanham casa transação.

`msg.sender` é `msg.value`são palavras chave de um contrato é cada transação, `msg.sender` é o remetente da chamada da função `msg.value` é o quanto foi enviado.

Então sempre que chamamos a função `fund`, alguém pode enviar algum valor pois, é uma fução de pagamento.

Vamos salvar no nosso mapping `addressAmountFunded`.

![addressAmountFunded](Assets/msg.png)

### Financiando

Se clicarmos em `Fund`, nada irá acontecer pois, nosso endereço vai estar enviado zero.
Para enviar algo, temos que adicionar algum valor junto com a transação.

Então acima de 1 `gwei` que é igual a `1000000000 wei`.

Vamos copiar o nosso endereço da conta falsa para recuperar o valor `financiado`.

Chamamos a função `fund` com o valor associado a ela.

Se chamarmos uma função com um valor de 1 `gwei` associado a ela.

Se chamarmos `addressFundedAmount` com o mesmo `address`, poderemos ver quanto foi `"financiado"` a este contrato é agregarmos mais valor caso queiramos.

Quando enviamos fundos para nosso contrato, isso realmente siginifica que esse contrato, onde quer que seja implementado, agora é o proprietario do valor de `addressFundedAmount`.

Agora temos uma maneira de financiar contratos

## ETH -> USD /conversion

Neste contrato, queremos trazer melhorias a sua implementação, acressentando o valor mínimo para que a pessoa posa financiar nossos empreendimentos, sejam eles a nossa escolha.

Para exemplo iremos trabalhar com `USD` mas poderiamos usar qualquer outra moeda.

Como vamos obter a taxa de conversão dessa moeda para que possamos usar no nosso contrato ?

A primeira coisa que precisamos fazer é definir um valor é saber qual é a taxa de conversão, por que se quiser aceitar `ETH` para `USD`.

## Problemas Deterministicos & Soluções Oracle

*`Então, como vamos colocar esses dados em nosso contrato ? De onde vamos tirar esses dados ?`*
Quando falamos no sistema de blockchains como algo deterministico é oracles sendo uma ponte entre a blockchain é o mundo real.

Quando estamos falando sobre sistemas, você conhece essas blockchains, eles não podem conectar a eventos do mundo real, Elas não podem se conectar a sistemas externos. Elas não podem fazer computação externas. Elas são intencionalmente esses sistemas determinísticos.

Para que possamos atravessar as muralhas que cercam esse castelo, para que possamos fazer a conexão, precisamo de um `Oracle Blockchain` um tipo de rede.

Se olharmos para a Blockchain, ela pode facilmente dizer **`1 + 1 = 2`**.

Todos os demais nós podem verificar isso facilmente, entretanto eles não podem fazer uma chmada de [API](https://pt.wikipedia.org/wiki/Interface_de_programa%C3%A7%C3%A3o_de_aplica%C3%A7%C3%B5es), pois se cada um dos nós chama a `API` e em um momento diferente outro nó a chama ou especificamente um `HTTP GET` pode obter resultados muito, muito diferentes e se outro nó tentar reproduzir essas transações por chamada essas `API's` novamente daqui alguns anos no futuro, há uma boa chance de que a `API` seja depreciada e elas possam ser atacadas de maneira maliciosa.

Outra razão pela qual Blockchains não podem instecionalmente fazer chamadas de `API`, pois estariam fazendo suposições sobre um mundo real, as camdas 1 da `Blockchain` normalmente não querem ter uma opnião sobre qualquer política ou geopolítica.

![DeterministicNonD](Assets/dnd.png)

## Oracles Centralizados

Outro principal ponto sobre o qual precisamos falar é que os `Oracles` centralizados são pontos de falha.

Se dissermos "Eu vou ser apenas um Oracle, Eu vou ser o único a colocar esses dados na cadeia."

Nós agora temos um grando ponto de falha centralizado massivo, pois já tivemos todo esse trabalho de massivo de ser um rede descentralizada e em cadeia, mas arruinamos toda a descentralidade por ter um único ponto de falha.

O propósito da Blockchain é que nenhuma entidade possa acionar um interruptor e restringir nossa liberdade de interação.

Com um `Oracle` centralizado, uma única entidade pode apertar um botão é acabar com tudo.

![centralized](Assets/central.jpg)

## Redes Decentralizadas Oracle.

Também precisamos obter dados de muitas fontes decentralizadas diferentes ou fazer qualquer tipo de computação descentralizada.
É aqui temos a chainlink.

![decentralized](Assets/e11.png)

[Chainlink](https://chain.link/) é uma infraestrutura oracle descentralizada modular e uma rede oracle que nos permite obter dados e fazer computação externa de uma maneira descentralizada altamente resistente.

Pode ser tão personalizavel quanto você quiser. Como pode executar com um nó ou varios nós ou fazer quantos nós quiser.

### Feed de dados Chainlink

Atualmente, uma das características mais populares do chainlink são seus feeds de dados ou seus feeds de preços. [chainlikdate](https://data.chain.link/?_ga=2.116906630.1818519823.1658981031-865325850.1656991002)

![ChainlinkDate](Assets/date.png)
![ChainlinkOracle](Assets/e13.png)

Temos varios feeds de preço diferentes e a que esta fornecendo os preços para eles sejam preços especificos. Podemos ver acima que há um numero inteiro de diferentes `Oracles` descentralizados retornando dados para feeds de preços diferentes.

Este acima o `ETH/USD` e exatamente a visão de preço que nós queremos.

Ter uma rede descentralizada trazendo dados em blocos e tê-los como um ponto de referêcia de verdade absoluta, permite que todos os usuários colaborem e usem esse bem comun e será mais barato, mais seguro e mais eficiente do que qualquer um mesmo executando o seu próprio `Oracle` centralizado.

Esses feeds de preços são incrivelmente poderosos.

Além disso, eles estão sendo usados por alguns dos principais protocolos do sistema `defi` no momento.

um exemplo de uma solução descentralizada pronta para uso que já foi empacotada de maneira descentralizada para você consumir e usar. Isso torna a produção mil vezes mais fácil do que construir tudo sozinho.

## Chainlink Código documentação ETH/USD

No entanto, se você quiser fazer uma chamada de API é constuir a sua própria rede descentralizada pode com as chamas de API da `chainlink`.

Mas vamos abordar o uso `pricefeeds`, `chainlink VRF`, `keepernetwork` e demais serviços descentralizados que tornama entrada na mainnet muito mais fácil.

Você sempre pode fazer uma chamada http do chainlink também. Não vamos passar por cima disso porque colocar isso em produção é um pouco mais complicado.

Se você quiser experimentá-los sozinhos, pode ir [aqui](https://docs.chain.link/docs/get-the-latest-price/) e clicar em "abrir no remix". Isso nos levará a remixar a edição com todo o código escrito para nós. Vamos em frente e compilá-lo e implantá-lo para real network(Injected Web3 in Environment).

O código é na verdade para [rede Koven]. Então mude sua metamask para Koven. Pegue a rede Koven se você não tiver nenhuma. Vamos implantar o contrato, a metamask vai aparecer e podemos obter o preço mais recente ao clicar no botão.

Podemos ver que a função realmente retorna o preço mais recente do ethereum. Você pode estar se perguntando "Por que esse número parece tão grande?" Lembre-se de como falamos sobre wei, gwei e ether.

A razão pela qual eles não existem em Solidity, Na verdade temos que retornar um vallor que é multiplicado por 10 para algum número.

Se obtivermos um valor de 261497384316, esse valor é na verdade 2614,97384316 * 10⁸.

Utilizamos a rede teste ao invés da rede local por conta da Chainlink VMs Javascript. aprendemos mais tarde como essas interações, retornamos dados para nossa blockchain, vamos ao contrato para implementarmos essa função do preço mais recente.

### LatestRoundData = ultima rodada de dados

Outro contrato chamado neste caso chamado priceFeed tem uma função chamada lastRoundData que retorna muitos dados.

![latestRoundData](Assets/latestRoundData.png)

Ele retorna um roundID que define quantas vezes esse priceFeed foi atualizado, retorna o preço que é a conversão real entre dois ativos, retorna um startedAt que define quando foi a última atualização, retorna um timestamp e retorna um AnswerInRound,não se preocupe sobre answerInRound por enquanto.



Se você quiser se aprofundar no que essas `rounds` significam e o que significa AnswerInRound, você pode definitivamente conferir o [Chainlink documentation](https://docs.chain.link/).

### Importando código do Datafeed através do NPM

primeira coisa que iremos precisar fazer é importar o código do chainlink [@chainlink/contracts](https://www.npmjs.com/package/@chainlink/contracts), como sabemos ao importar `@chainlink/contracts`, na verdade estamos importando do pacote npm, mas, também podemos fazer isso através do repositório [chainlink repositório](https://github.com/smartcontractkit/chainlink.git)

![import](Assets/import.png)

o que o `remix` está fazendo ao usarmos o npm é importar do github através do package e intalar para nós podermos trabalhar.

### Interface

![interface](Assets/v3.png)

Esse tipo de contrato não começam com a palavra-chave contract, mas começam com a palavra-chave interface.
A principal diferença é que você pode ver que suas funções não estão completas. Elas apenas têm o nome da função e seu tipo de retorno.

Em nosso código aqui, o Solidity não entende nativamente como interagir com outro contrato. Temos que dizer ao nosso contrato quais funções podem ser chamadas de outro contrato, è aqui que as interfaces realmente entram no jogo, semelhante à estrutura do que podemos fazer com as interfaces é similar as `structs`.

### ABI/Application Binary Interface

Interfaces compilam para a ABI, ela diz a Solidity quais funções podem ser chmadas em outro contrato, precisamos saber quais funções usar e com quais funções ele pode chamar outros contratos.

Sempre qe você interagir com outro contrato em SOlidity ou qualquer contrato inteligente em geral iŕa precisar dessa ABI de contratos.

### interagindo com a iterface de um contrato

Assim como `structs` é `variable` vamos definir uma função chamata `getVersion` é dentro dela chamaremos a interface do nosso contrato.

![getVersion](Assets/version.png)

definimos a interface do outro contrato é retornamos inicializamod a nossa variable dando o nome a ela, chamaremos ela de `priceNow`

![Interface](Assets/getversion.png)

Primeiro coisa que nomeamos é o tipo da AVI, já que estamos dentro de um contrato, vamos pular a visibilidade e dar um nome para inicializarmos ela, com ela inicializada escolhemos onde interagir com a AVI do contrato é passamos o endereço que está localizado o contrato.

### Encontrandoo Pricefeed Address

Para encontrarmos o preço que irá alimentar a nossa aplicação ETH/USD, podemos olha a documentação da chainlink em [ethereum price feeds](https://docs.chain.link/docs/ethereum-addresses/).

lá encontraremos diferentes `address` relacionados a cada rede é um endereço de contrato diferente com as informações necessarias para obter o preço.

### Getprice  function

Temos uma função getPrice que se olharmos para a nossa interface podemos ver que a outras funções dentro, vamos retornar a resposta da função price.

![tuples](Assets/tuples.png
)
Uma `Tuple` é uma lista de objetos de tipos potencialmente diferentes cujo o número é uma constante em tempo de compilação, podeos definir varias variaveis dentro de `tuples`

### Limpando as variaveis `Tuple` sem uso && Deploy

Podemos retornar espações em branco para cada uma das seções não utilizadas com virgulas entre si.

![clean](Assets/clean.png)

### Wei/Gwei (Correnspondencia)

Vimos que getPrice possui 8 casas decimais, no entando, a menor unidade de medida tem 18, então normalmente vamos fazer tudo ter 18 decimais também, precisamos fazer isso é economiza gas, se não fizermos, podemos declarar

`return uint256(price * 10000000000);`

ou

`return uint256(price * 1e10);`

obtendo assim o preço e a taxa de converção, assim da mesmo forma podemos usar para definir o valor minimo do financiamento do nosso contrato.

através de uma função que converta o valor que vai ser enviado em USD.

![convert](Assets/convert.png)

Assim retornamos com o valor convertido, por conta das casas decimais.
