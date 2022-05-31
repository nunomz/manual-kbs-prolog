:- dynamic(fact/1),
[forward, database, filters, knowledgebase].

:- initialization(manual).

manual :- nl,
    write('Manual de Utilizacao:'),nl,
    write('  start.  - Iniciar o questionario'),nl,
    write('  info.   - Informacao sobre o programa'),nl,
    write('  manual. - Manual de utilizador'),nl,
    write('  cls.    - Limpar consola'),nl,nl.

cls :- write('\e[H\e[2J').

info :- nl,
    write('Projeto desenvolvido no ambito da UC Tecnicas de Inteligencia Artificial'),nl,
    write('Engenharia e Gestao de Sistemas de Informacao'),nl,
    write('Universidade do Minho'),nl,
    write('2021/2022'),nl,nl,
    write('  Projeto 1 - Recomendacao de Alojamento'),nl,
    write('  Parte A - Aquisicao manual de conhecimento'),nl,nl.

start :- menu.

menu :- nl,nl,nl,
    write('Bem-vindo ao seu ajudante turistico, com aquisicao de conhecimento manual.'),nl,nl,
    write('Por favor escolha uma opcao: '),nl,
    write('  1. Iniciar'),nl,
    write('  2. Sair'),nl,
    write('Introduza a sua escolha: '),
    read(X),
    escolhaMenu(X).

escolhaMenu(1) :- q01.
escolhaMenu(2) :- write('Obrigado por utilizar o nosso servico.'), halt.
escolhaMenu(other) :- write('Por favor introduza uma opcao valida.'), menu.

q01 :- nl,nl,nl,
    write('Deseja pesquisar destinos por: '),nl,
    write('  1. Pais'),nl,
    write('  2. Continente'),nl,
    write('  3. Nao desejo filtrar o destino por localizacao'),nl,
    read(E01),
    (   (E01 == 1),assert(fact(pais)),qPais;
    (E01 == 2),assert(fact(cont)),qCont;
    (E01 == 3),assert(fact(carac)),qDist).

qPais :- nl,nl,nl,
    write('Qual o pais que deseja visitar? (em minusculas por favor)	'),nl,
    read(E00),assert(variable(E00)),resultado.

qCont :- nl,nl,nl,
    write('Qual o continente que deseja visitar?'),nl,
    read(E00),assert(variable(E00)),resultado.

qDist :- nl,nl,nl,
    write('Gosta de caminhar? Qual o seu limite quanto a\' distancia do hotel até ao centro da cidade? Introduza um valor em km.'),nl,
    %write('  1. Ate\' 2.5km'),nl,
    %write('  2. Ate 5km'),nl,
    %write('  3. A distancia aos pontos de interesse nao e relevante.'),nl,
    read(E00),assert(variable(E00)),qCusto.

qCusto :- nl,nl,nl,
    write('Qual destas experiencias se parece mais consigo? '),nl,
    write('  1. Um hotel que oferece comodidades e servicos minimos por um preco mais baixo do que um hotel regular na area.'),nl,
    write('  2. Um hotel de 3/4 estrelas com tudo o que e necessario para umas ferias relaxadas, sem destruir o orcamento.'),nl,
    write('  3. Hotel de 5 estrelas, que proporciona uma experiencia de acomodacao luxuosa. Para quem procura o melhor servico, independente do preco.'),nl,
    read(Custo),
    (
    (Custo == 1),assert(fact(lowcost)),qTipo;
    (Custo == 2),assert(fact(medio)),qTipo;
    (Custo == 3),assert(fact(luxo)),qTipo).

qTipo :- nl,nl,nl,
    write('Qual destes ambientes e mais do seu agrado? '),nl,
    write('  1. Praia'),nl,
    write('  2. Cidade'),nl,
    write('  3. Campo'),nl,
    read(Tipo),
    (
    (Tipo == 1),assert(fact(praia)),qPraia;
    (Tipo == 2),assert(fact(cidade)),qCidade;
    (Tipo == 3),assert(fact(campo)),qCampo).

qPraia :- nl,nl,nl,
     write('Qual destas caracteristicas/atvidades lhe interessam mais? '),nl,
     write('  1. Surf'),nl,
     write('  2. Nadar/Mergulhar'),nl,
     write('  3. Festas/Vida Noturna'),nl,
     read(Carac),
     (
     (Carac == 1),assert(fact(surf)),resultado;
     (Carac== 2),assert(fact(nadar)),resultado;
     (Carac== 3),assert(fact(festas)),resultado).

qCidade :- nl,nl,nl,
     write('Qual destas caracteristicas/atvidades lhe interessam mais? '),nl,
     write('  1. Compras'),nl,
     write('  2. Cultura/Museus/Historia'),nl,
     write('  3. Festas/Vida Noturna'),nl,
     write('  4. Gastronomia'),nl,
     read(Carac),
     (
     (Carac == 1),assert(fact(compras)),resultado;
     (Carac == 2),assert(fact(cultura)),resultado;
     (Carac == 3),assert(fact(festas)),resultado;
     (Carac == 4),assert(fact(gastronomia)),resultado).

qCampo :- nl,nl,nl,
     write('Qual destas caracteristicas/atvidades lhe interessam mais? '),nl,
     write('  1. Paisagens'),nl,
     write('  2. Cultura/Historia'),nl,
     write('  3. Aventura'),nl,
     write('  4. Gastronomia'),nl,
     read(Carac),
     (
     (Carac == 1),assert(fact(paisagens)),resultado;
     (Carac == 2),assert(fact(cultura)),resultado;
     (Carac == 3),assert(fact(aventura)),resultado;
     (Carac == 4),assert(fact(gastronomia)),resultado).

resultado :- nl,nl,nl,
    write('Quetionario terminado. O seu resultado esta a ser calculado...'),nl,
    result.

printresultado(P) :- nl,
    variable(E00),
    /*write('O seu perfil e o '),write(P),nl,nl,*/
    write('Hoteis aconselhados: '),nl,profile(P,E00),
    retractall(variable(_)),retractall(fact(_)),
    qFinal.

qFinal :- nl,nl,nl,
     write('Pretende recomecar o question�rio? '),nl,
     write('  1. Sim.'),nl,
     write('  2. Nao.'),nl,
     write('  3. Pretendo sair do SWI-Prolog.'),nl,
     read(E03),
     (
     (E03== 1),start;
     (E03== 2);
     (E03== 23),halt).