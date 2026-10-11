%Male
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

%Female
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

%Parent Relations
%parent(Parent, Child)

parent(abraham, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).

%Father Rule
father(X, Y) :-
male(X),
parent(X, Y).

%Mother Rule
mother(X, Y) :-
female(X),
parent(X, Y).

%Son Rule
son(X, Y) :-
male(X),
parent(Y, X).

%Daughter Rule
daughter(X, Y) :-
female(X),
parent(Y, X).

%Brother Rule
brother(X, Y) :-
male(X),
parent(Z, X),
parent(Z, Y),
X \= Y.

%Sister Rule
sister(X, Y) :-
female(X),
parent(Z, X),
parent(Z, Y),
X \= Y.

%Grandfather Rule
grandfather(X, Z) :-
male(X),
parent(X, Y),
parent(Y, Z).

%Aunt Rule
aunt(X, Y) :-
sister(X, P),
parent(P, Y).

%Uncle Rule
uncle(X, Y) :-
brother(X, P),
parent(P, Y).

%Cousin Rule
cousin(X, Y) :-
parent(P1, X),
parent(P2, Y),
P1 \= P2,
parent(G, P1),
parent(G, P2).

%Ancestor Rule (Recursive)
ancestor(X, Z) :-
parent(X, Z).

ancestor(X, Z) :-
parent(X, Y),
ancestor(Y, Z).

%----------Queries----------

/*
57 ?- father(homer, X).
X = bart ;
X = lisa ;
X = maggie.

58 ?- father(clancy, bart).
false.

59 ?- mother(jackie, X).
X = marge ;
X = patty ;
X = selma.

60 ?- mother(mona, herb).
false.

61 ?- son(bart, X).
X = homer ;
X = marge.

62 ?- son(X, clancy).
false.

63 ?- daughter(X, homer).
X = lisa ;
X = maggie ;
false.

64 ?- daughter(ling, selma).
true.

65 ?- brother(herb, X).
X = homer.

66 ?- brother(bart, bart).
false.

67 ?- sister(selma, X).
X = marge ;
X = patty ;
X = marge ;
X = patty.

68 ?- sister(lisa, maggie).
true.

69 ?- grandfather(abraham, X).
X = bart ;
X = lisa ;
X = maggie.

70 ?- grandfather(clancy, ling).
true.

71 ?- aunt(selma, X).
X = bart ;
X = lisa ;
X = maggie ;
X = bart ;
X = lisa ;
X = maggie.

72 ?- aunt(marge, bart).
false.

73 ?- uncle(herb, X).
X = bart ;
X = lisa ;
X = maggie.

74 ?- uncle(homer, ling).
false.

75 ?- cousin(lisa, X).
X = ling ;
X = ling.

76 ?- cousin(bart, lisa).
false.

77 ?- ancestor(abraham, X).
X = herb ;
X = homer ;
X = bart ;
X = lisa ;
X = maggie.

78 ?- ancestor(X, ling).
X = selma ;
X = clancy ;
X = jackie.

*/