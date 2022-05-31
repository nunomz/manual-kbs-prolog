%-----------------------------
%-----------filtros-----------
%-----------------------------

membro(X, [X|_]).
membro(X, [_|R]) :- membro(X, R).

%-----------------------------
%hotel(localização,pais,continente,dens populacional,tipo,[caracteristicas],nivel,nome,distancia,preco).
%-----------------------------

%-----------------------------

filter_pais(Z) :-
    findall((Y,L,X),(hotel(L,Z,_,_,_,X,_,Y,_,_)),L),
    print(L).

filter_cont(Z) :-
    findall((Y,L,X),(hotel(L,_,Z,_,_,X,_,Y,_,_)),L),
    print(L).

filter(Pais,Cont,Dens,Tipo,Carac,Custo,Dist) :-
    findall((Y,L,X),(hotel(L,Pais,Cont,Dens,Tipo,X,Custo,Y,W,_),Dist>=W,membro(Carac,X)),L),
    print(L).

%-----------------------------

profile(1,Z) :- filter_pais(Z).
profile(2,Z) :- filter_cont(Z).

profile(praia_lowcost_surf,D) :- filter(_,_,_,praia,surf,lowcost,D).
profile(praia_lowcost_nadar,D) :- filter(_,_,_,praia,nadar,lowcost,D).
profile(praia_lowcost_festas,D) :- filter(_,_,_,praia,festas,lowcost,D).

profile(praia_medio_surf,D) :- filter(_,_,_,praia,surf,medio,D).
profile(praia_medio_nadar,D) :- filter(_,_,_,praia,nadar,medio,D).
profile(praia_medio_festas,D) :- filter(_,_,_,praia,festas,medio,D).

profile(praia_luxo_surf,D) :- filter(_,_,_,praia,surf,luxo,D).
profile(praia_luxo_nadar,D) :- filter(_,_,_,praia,nadar,luxo,D).
profile(praia_luxo_festas,D) :- filter(_,_,_,praia,festas,luxo,D).

profile(cidade_lowcost_compras,D) :- filter(_,_,_,cidade,compras,lowcost,D).
profile(cidade_lowcost_cultura,D) :- filter(_,_,_,cidade,cultura,lowcost,D).
profile(cidade_lowcost_festas,D) :- filter(_,_,_,cidade,festas,lowcost,D).
profile(cidade_lowcost_gastronomia,D) :- filter(_,_,_,cidade,gastronomia,lowcost,D).

profile(cidade_medio_compras,D) :- filter(_,_,_,cidade,compras,medio,D).
profile(cidade_medio_cultura,D) :- filter(_,_,_,cidade,cultura,medio,D).
profile(cidade_medio_festas,D) :- filter(_,_,_,cidade,festas,medio,D).
profile(cidade_medio_gastronomia,D) :- filter(_,_,_,cidade,gastronomia,medio,D).

profile(cidade_luxo_compras,D) :- filter(_,_,_,cidade,compras,luxo,D).
profile(cidade_luxo_cultura,D) :- filter(_,_,_,cidade,cultura,luxo,D).
profile(cidade_luxo_festas,D) :- filter(_,_,_,cidade,festas,luxo,D).
profile(cidade_luxo_gastronomia,D) :- filter(_,_,_,cidade,gastronomia,luxo,D).

profile(campo_lowcost_paisagens,D) :- filter(_,_,_,campo,paisagens,lowcost,D).
profile(campo_lowcost_cultura,D) :- filter(_,_,_,campo,cultura,lowcost,D).
profile(campo_lowcost_aventura,D) :- filter(_,_,_,campo,aventura,lowcost,D).
profile(campo_lowcost_gastronomia,D) :- filter(_,_,_,campo,gastronomia,lowcost,D).

profile(campo_medio_paisagens,D) :- filter(_,_,_,campo,paisagens,medio,D).
profile(campo_medio_cultura,D) :- filter(_,_,_,campo,cultura,medio,D).
profile(campo_medio_aventura,D) :- filter(_,_,_,campo,aventura,medio,D).
profile(campo_medio_gastronomia,D) :- filter(_,_,_,campo,gastronomia,medio,D).

profile(campo_luxo_paisagens,D) :- filter(_,_,_,campo,paisagens,luxo,D).
profile(campo_luxo_cultura,D) :- filter(_,_,_,campo,cultura,luxo,D).
profile(campo_luxo_aventura,D) :- filter(_,_,_,campo,aventura,luxo,D).
profile(campo_luxo_gastronomia,D) :- filter(_,_,_,campo,gastronomia,luxo,D).

