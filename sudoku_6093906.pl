/* gemaakt door: 	Inge Becht 	 6093906 */

%opgave 1.
/* de begintoestand geef ik weer in 9 lijsten in één lijst waarbij elk van de
lijsten een rij voorsteld van de sudoku. Alle in te vullen vakken geef ik aan met een x,
de rest van de cijfers staan al ingevuld.
*/

begintoestand([
[1,x,x, x,x,2, 7,6,x],
[2,x,x, x,x,1, x,x,8],
[x,3,6, x,x,7, x,x,4],

[x,x,x, x,6,x, 8,7,2],
[6,x,7, x,2,9, x,x,x],
[x,x,x, x,x,x, x,x,x],

[x,8,x, x,7,x, 3,x,x],
[x,1,3, x,x,x, 5,x,x],
[x,x,x, x,1,x, x,9,7]]).



%opgave 2.
/* bij de volgende opgaves ga ik uit van een input die op eenzelfde manier vormgegeven
is als de begintoestand uit onze vorige opgave.*/
rij(0, [A|_], A).					%basisgeval:wanneer de teller 0 is, wordt de head de output

rij(N, [_|T], R):-					%teller N geeft output R zodra het basisgeval geldt
	N1 is N-1,					%stel N-1 op, tot deze 0 wordt
	rij(N1, T, R).					%via recursie tot het basisgeval, waarbij de head wordt weggelaten

kolom(_, [], []).					%basisgeval:als de lijst waaruit je de N-de term wilt halen leeg is, moet de output verschijnen

kolom(N, [P|Q], [X|Y]):-
	nth1(N, P, X),					%built-in nth1 verschaft ons met de Nde term van head P
	kolom(N, Q, Y).					%via recursie tot het basisgeval geldt.

/*kwadrant defineer ik door alle kwadranten(9) stuk voor stuk te defineren. Hierbij begin ik links boven, werken naar rechts, gaan naar links
, waarnaar naar rechts gewerkt wordt. De kwadrantenverdeling ziet er dus als volgt uit:
	|	|
    1	|   2	|   3
    	|   	|
------------------------
	|	|
    4	|   5	|   6
    	|   	|
------------------------
	|	|
    7	|   8	|   9
	|	|		*/

kwadrant(1, P, Q):-					%als er gevraagd wordt om het eerste kwadrant,
	rij(0, P, W1),					%pas ik rij toe met input 0 en dezelfde rij lijsten
	rij(1, P, W2),					%pas ik rij toe met input 1
	rij(2, P, W3),					%pas ik rij toe met input 2
	W1=[A,B,C,_,_,_,_,_,_],				%ik defineer de eerste 3 termen van de eerste rij
	W2=[A1,B1,C1,_,_,_,_,_,_],			%ik defineer de eerste 3 termen van de tweede rij
	W3=[A2,B2,C2,_,_,_,_,_,_],			%ik defineer de eerste 3 termen van de derde rij
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.		%ik bepaal Q uit de eerder gegeven variabelen


/* op eenzelfde manier werk ik de rest uit*/
kwadrant(2, P, Q):-
	rij(0, P, W1),
	rij(1, P, W2),
	rij(2, P, W3),
	W1=[_,_,_,A,B,C,_,_,_],
	W2=[_,_,_,A1,B1,C1,_,_,_],
	W3=[_,_,_,A2,B2,C2,_,_,_],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.

kwadrant(3, P, Q):-
	rij(0, P, W1),
	rij(1, P, W2),
	rij(2, P, W3),
	W1=[_,_,_,_,_,_,A,B,C],
	W2=[_,_,_,_,_,_,A1,B1,C1],
	W3=[_,_,_,_,_,_,A2,B2,C2],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.

kwadrant(4, P, Q):-
	rij(3, P, W1),
	rij(4, P, W2),
	rij(5, P, W3),
	W1=[A,B,C,_,_,_,_,_,_],
	W2=[A1,B1,C1,_,_,_,_,_,_],
	W3=[A2,B2,C2,_,_,_,_,_,_],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.

kwadrant(5, P, Q):-
	rij(3, P, W1),
	rij(4, P, W2),
	rij(5, P, W3),
	W1=[_,_,_,A,B,C,_,_,_],
	W2=[_,_,_,A1,B1,C1,_,_,_],
	W3=[_,_,_,A2,B2,C2,_,_,_],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.

kwadrant(6, P, Q):-
	rij(6, P, W1),
	rij(7, P, W2),
	rij(8, P, W3),
	W1=[_,_,_,_,_,_,A,B,C],
	W2=[_,_,_,_,_,_,A1,B1,C1],
	W3=[_,_,_,_,_,_,A2,B2,C2],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.

kwadrant(7, P, Q):-
	rij(6, P, W1),
	rij(7, P, W2),
	rij(8, P, W3),
	W1=[A,B,C,_,_,_,_,_,_],
	W2=[A1,B1,C1,_,_,_,_,_,_],
	W3=[A2,B2,C2,_,_,_,_,_,_],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.

kwadrant(8, P, Q):-
	rij(6, P, W1),
	rij(7, P, W2),
	rij(8, P, W3),
	W1=[_,_,_,A,B,C,_,_,_],
	W2=[_,_,_,A1,B1,C1,_,_,_],
	W3=[_,_,_,A2,B2,C2,_,_,_],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.

kwadrant(9, P, Q):-
	rij(6, P, W1),
	rij(7, P, W2),
	rij(8, P, W3),
	W1=[_,_,_,_,_,_,A,B,C],
	W2=[_,_,_,_,_,_,A1,B1,C1],
	W3=[_,_,_,_,_,_,A2,B2,C2],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.


%opg. 3

/*om een doel predicaat te defineren zijn er verschillende stappen nodig. Eerst alle kolommen en kwadranten
in één en dezelfde lijst stoppen. Dit hoeft niet voor rijen aangezien dit al in de begintoestand gedaan is.
Daarna wil ik elk van deze lijsten controleren op dubbelen. Dit doe ik dmv goalrij2/1, goalrij/1, goalkolom2/1, goalkolom/1
en goalkwadrant2/1 en goalkwadrant/1
*/

%hier stel ik nog even hulppredicaat 'amount' op. 

pop_top([], []).					%basisgeval pop_top: bij een lege lijst output lege lijst.

pop_top([_|Q], X):-					%pop_top uitgevoerd op een lijst levert als output de lijst minus de head.
	X=Q.



amount(X, Y):-						% ik verwijs her predicaat met twee argumenten om naar eentje met een teller.
	amount(X, Y, 0).

amount([], Y, Y):-!.					%basisgeval: als het eerste geval een lege lijst wordt, dan stel ik de teller gelijk aan de output.

amount(P, Y, T):-					% P is de input, Y de output, T de teller
	pop_top(P, Z),					% haal de head van lijst P af en noemen de overgeblevne lijst Z
	T1 is T+1,					% verhoog de teller met 1
	amount(Z,Y,T1).					%recursie: ga verder met lijst Z(dus zonder head), Y en de met 1 verhoogde teller.


goalrij2([]).						%basisgeval: slaagt als er een lege lijst ingevoerd wordt

goalrij2([[H|T]|Q]):-					%de input zijn lijsten in lijsten
	goalrij([H|T]),					%stuur de eerste lijst naar goalrij/1
	goalrij2(Q).					%recursie: doe ditzelfde nu met Q

goalrij([]).						%basisgeval: slaagt als er een lege lijst ingevoerd wordt

goalrij([H|T]):-					%input is één lijst
	\+member(H, T),					%voorwaarde: H mag géén member zijn van T(anders false)
	goalrij(T).					%recursie: controleer nu de tail op dubbelen

/*columns/2 maakt een lijst geordend naar de kolommen,
een beetje omslachtig, maar hij werkt goed.*/

columns([[P|Q]|T], Z):-					% een invoer met lijsten in lijsten
	columns(1,[[P|Q]|T],X, Z),			%bouw een teller in die begint met 1 en een X
	amount([P|Q], X),!.				%de X heeft als getal de hoeveelheid elementen in de eerste lijst van de input

columns(N,[[P|Q]|T], Y, [Y1|Z1]):-
	kolom(N,[[P|Q]|T],Y1),				%de huidige tellerstand bepaalt welke lijst er uit de lijst met lijsten van de input wordt genomen
	N1 is N+1,					%de teller wordt met 1 verhoogd
	columns(N1, [[P|Q]|T],Y, Z1).			%recursie

columns(X, _,Y, []):-					%basisgeval: de outputs is een lege lijst alshet aantal elementen in lijst Y
	X1 is X-1,
	X1= Y.						%gelijk is aan X-1(de teller is namelijk een te ver gegaan).

/*derfineert de goalstaten voor kolom. voor uitleg kan gekeken wordne bij goalrij2/1 */

goalkolom2([]).

goalkolom2([[H|T]|Q]):-
	goalkolom([H|T]),
	goalkolom2(Q).

goalkolom([]).

goalkolom([H|T]):-
	\+member(H, T),
	goalkolom(T).



quadrants([[P|Q]|T], Z):-				%de quadrants/2 verwijzen naar
	quadrants(1,[[P|Q]|T],X, Z),			%quadrants/4 met een teller en een X
	amount([P|Q], X),!.				%die gelijk is aan de hoeveelheeid termen in de eerste lijst vd lijst.

quadrants(N,[[P|Q]|T], Y, [Y1|Z1]):-			%met de huidige teller en input
	kwadrant(N,[[P|Q]|T],Y1),			%pas kwadrant toe
	N1 is N+1,					        % verhogen de teller met 1
	quadrants(N1, [[P|Q]|T],Y, Z1).			%recursie: de vernieude teller toepassen op kwadrant

quadrants(X, _,Y, []):-					% het basisgeval; output is een legelijst als
	X1 is X-1,
	X1= Y.						%X-1 gelijk is aan het aantal elementen per lijst(Y).

/* zie goalrij2/1 voor uitleg(precies hetzelfde principe.*/
goalkwadrant2([]).

goalkwadrant2([[H|T]|Q]):-
	goalkwadrant([H|T]),
	goalkwadrant2(Q).

goalkwadrant([]).


goalkwadrant([H|T]):-
	\+member(H, T),
	goalkwadrant(T).


/* als laatste een predicaat dat kijkt of er lege elementen aanwezig zijn in de goal, en dan dus faalt.
hierbij  wordt atom gebruikt, omdat onze lege elementen een 'x' bevatten*/
noempty([]).						%basisgeval: slaag bij invoer lege lijst
noempty([[H|T]|Q]):-					%als input een lijst met lijsten is
	noempty2([H|T]),				%voer noempty2/1 uit op de head van de lijst met lijsten
	noempty(Q).					%recursie: doe hierna hetzelfde met de tail van de lijst met lijsten


noempty2([]).						%basisgeval: een lege lijst moet slagen
noempty2([H|T]):-					%input is een lijst
	\+atom(H),					%als de head geen atoom is
	noempty2(T).					%doorzoek dan ook de Tail(recursie)


/* met onderstaande input kan goal getest worden*/
%goal([[5,3,4,6,7,8,9,1,2], [6,7,2,1,9,5,3,4,8], [1,9,8,3,4,2,5,6,7], [8,5,9,7,6,1,4,2,3], [4,2,6,8,5,3,7,9,1], [7,1,3,9,2,4,8,5,6], [9,6,1,5,3,7,2,8,4], [2,8,7,4,1,9,6,3,5], [3,4,5,2,8,6,1,7,9]])

/* goal breidt bovengemaakte predicaten aan elkaar. Goalkolom2/1 en goalkwadrant2/1 vervangen kunnen worden door goalrij/2, maar dit werkt 
overzichtelijker*/

goal(X):-
	noempty(X),					%check op atomen (ofwel lege plekken)
	goalrij2(X),					%controleeren rijen op dubbelen
	columns(X, [[A|B]|C]),				%maak van de input een lijst met kolommen
	goalkolom2([[A|B]|C]),				%controleer de kolommen op dubbelen
	quadrants(X,[[D|E]|F]),				%maak van de input een lijst met kwadranten
	goalkwadrant2([[D|E]|F]),!.			%controleer de kwadranten op dubbelen.

/* mits aan al deze voorwaarde voldaan worden, slaagt goal.*/



%opgaven 4

/*
het goal predicaat behoorlijk inefficient, en daarom predicaat evaluatie,
die kijkt of een gedane zet legaal is. Hier worden predicaten van de vorige opdracht gebruikt behalve noempty
*/

% één predicaat dat alle mogelijke lijsten evalueert als het wordt aangeroepen

evalueerlijst([]):-!.					%basisgeval: slaagt met een lege lijst

evalueerlijst([[H|T]|Q]):-				%bij invoer meerdere lijsten
	evalueerlijst2([H|T]),				%eerst de eerste lijst naar evalueerlijst2/1
	evalueerlijst(Q).				%recursie: dan hetzelfde met de tail

evalueerlijst2([]):-!.					%basisgeval: slaagt met een lege lijst

evalueerlijst2([H|T]):-					%de invoer is één lijst
	\+atom(H),					%toevoeging: dit geldt alleen als H géén atoom is
	\+member(H, T),					%de H mag geen member zijn van T
	evalueerlijst2(T).				%recursie: voer hetzelfde uit met T

evalueerlijst2([H|T]):-					%in het geval dat:
	atom(H),					%als H een atoom is
	evalueerlijst2(T).				%negeer deze dan en ga door met de tail


% uitprobeersel met:evaluatie([[5,3,x,6,7,8,9,1,2], [6,x,2,1,9,5,3,4,8], [1,9,8,3,4,2,x,6,7], [8,5,9,x,6,1,4,2,3], [x,2,x,8,x,3,7,9,1], [7,1,3,9,2,4,8,5,6], [9,6,1,5,3,7,2,8,4], [2,8,7,4,1,9,6,3,5], [3,4,5,2,8,6,1,7,9]])

evaluatie(X):-
	columns(X, [[A|B]|C]),				%maak een lijst met kolommen aan
	evalueerlijst([[A|B]|C]),			%evalueer deze lijst met kolommen
	quadrants(X,[[D|E]|F]),				%maak een lijst met kwadranten aan
	evalueerlijst([[D|E]|F]),!.			%evalueer deze lijst met kwadranten


/* Het volgende predicaat doet een eerste zet vanuit de linkerbovenhoek
het is opgedeeld in 3 kleine predicaten: move/2 , movelijst/2 en zetx/2.

move stuurt de lijst met lijsten door naar het volgende predicaat
en controleert na de zet of het een geldige zet is*/
move(X, Y):-
	movelijst(X,Y),					%stuur de lijst met lijsten door naar movelijst
	evaluatie(Y).					%evalueer de output


movelijst([H|T], [H1|T]):-				%de eerste lijjst veranderd
	member(x, H),!,					%als er een onbekende in zit
	zetx(H, H1).					%door middel van predicaat zetx/2

movelijst([H|T], [H|T1]):-				%de eerste lijst blijft gelijk
	\+member(x, H),					% als H geen x is,
	movelijst(T, T1).				%voer recursie uit op de tail

zetx([H|T], [P|Q]):-					% maar van het 2 argumenten predicaat
	zetx([H|T], [H|T], [P|Q]).			% een met 2, waarvan de eerste twee de input zijn


zetx([H|T],Y,[P|T]):-
	atom(H),					%als het eerste element een atoom is
	between(1, 9, P),				%kies dan voor de head van de output een getal tussen 0 en 10
	\+member(P, Y).					%als geldt dat deze geen member is van Y(de originele [H|T]


zetx([H|T],Y, [H|T1]):-
	\+atom(H),					%als H geen atoom is
	zetx(T,Y, T1).					%doe dan recursie met T.


% dit kan uitgeprobeerd worden met: move([[5,3,4,6,7,8,9,1,2], [6,x,2,1,9,5,3,4,8], [1,9,8,3,4,2,5,6,7],[8,5,9,7,6,1,4,2,3], [4,2,6,8,5,3,7,9,1], [7,1,3,9,2,4,8,5,6], [9,6,1,5,3,7,2,8,4], [2,8,7,4,1,9,6,3,5], [3,4,5,2,8,6,1,7,9]],X).


%opgaven 5

writelists([]).						%basisgeval: slaag bij een lege lijst

writelists([[P|Q]|T]):-					%als de input lijsten in een lijst is
	writelist([P|Q]),				%pas writelist toe op de eerste lijst
	writelists(T).					%pas recursie toe op de Tail

writelist([]).						%basisgeval: lege lijst slaagt

writelist(X):-						%als X de input is
	nl,						%witregel
	write(X).					%schrijf X.

/*via sudoku/2 duurt het ongeveer 200 seconde*/

sudoku(X,Y):-					
	solve_depthfirst_bound(81, X, Y).		%solve_depthfirst_bound waar de bound op 81 gezet wordt, de waarschijnlijk maximaal mogelijke stappen

solve_depthfirst_bound(Bound, Node, Path) :-		%_solve_depthfirst_bound roeps hierna weer
	depthfirst_bound(Bound, [Node], Node, RevPath),	%depthfirst_bound aan, waarbij de huidige staat de eerstvolgende in de geschiedenis zal zijn
	reverse(RevPath, Path),				%uiteindelijk moet het pad omgedraaid worden
	!.


depthfirst_bound(_, Visited, Node, Visited) :-		%basisgeval: Node is de uitkomst als
	%goal(Node),					%(eventueel) Node aan predicaat goal voldoet
	noempty(Node),					%er geen lege vakken in zitten
	nl,
	writelists(Node),				%schrijf Node netjes op
	!.



depthfirst_bound(Bound, Visited, Node, Path) :-
	Bound > 0,					%bound moet groter zijn dan 0
	move_cyclefree(Visited, Node, NextNode),	%pas move_cyclefree toe, om tot een nieuwe staat te komen
	% sleep(0.5),					%eventuele ingebouwde vertraging
	NewBound is Bound - 1,				%de bound moet met 1 verminderd worden.
	depthfirst_bound(NewBound, [NextNode|Visited], NextNode, Path),
	!.


move_cyclefree(Visited, Node, NextNode) :-
	move(Node, NextNode),				%maak van de huidige staat de nieuwe staat dmv move/1
	\+ member(NextNode, Visited),			%als voorwaarde geldt dat de nieuwe staat niet onderdeel mag zijn van de geschiedenis aan staten
	nl,
	writelists(NextNode).				%schrijf de nieuwe staat netjes op.


%opgaven 6

/* eerst onze begintoestand van opdracht6 opschrijven*/
begintoestand_opdracht6([
[8,x,x, x,4,x, x,5,x],
[9,7,x, x,1,x, x,6,x],
[x,2,x, x,x,x, 3,x,x],

[x,x,x, x,x,x, x,x,x],
[x,4,x, x,x,x, x,x,1],
[x,x,x, x,x,x, x,x,x],

[x,x,x, 3,x,x, 2,x,x],
[x,6,2, x,x,7, x,x,4],
[x,x,x, x,x,x, x,x,x]]).

/* ik voeg een extra predicaat toe voor deze nieuwe kwadranten,
kwadrant2/2 en quadrants2/2  genaamd, en nummer ze als volgt:

-------------------		
 -------   ------ |
 |   	| |   	| |
 |   1  | |  2	| |
 |      | |	| |
 -------   ------ |
 -------   ------ |
 |	| |	| |
 |   3 	| |  4	| |
 |	| |	| |
 -------   ------ |
-------------------
*/

kwadrant2(1, P, Q):-					%het eerste kwadrant gederfineerd door
	rij(1, P, W1),					%de tweede rij in W1 te stoppen LET OP: onze rijen beginnen bij 0!
	rij(2, P, W2),					%de derde rij in W2 te stoppen
	rij(3, P, W3),					% de vierde rij in W3 te stoppen
	W1=[_,A,B,C,_,_,_,_,_],				%van ellen de tweede t/m 5de term te defineren
	W2=[_,A1,B1,C1,_,_,_,_,_],
	W3=[_,A2,B2,C2,_,_,_,_,_],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.		%de gedefineerde termen in Q te stoppen.

/*en zo ook voor de rest van de termen.*/
kwadrant2(2, P, Q):-
	rij(1, P, W1),
	rij(2, P, W2),
	rij(3, P, W3),
	W1=[_,_,_,_,_,A,B,C,_],
	W2=[_,_,_,_,_,A1,B1,C1,_],
	W3=[_,_,_,_,_,A2,B2,C2,_],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.

kwadrant2(3, P, Q):-
	rij(5, P, W1),
	rij(6, P, W2),
	rij(7, P, W3),
	W1=[_,A,B,C,_,_,_,_,_],
	W2=[_,A1,B1,C1,_,_,_,_,_],
	W3=[_,A2,B2,C2,_,_,_,_,_],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.


kwadrant2(4, P, Q):-
	rij(5, P, W1),
	rij(6, P, W2),
	rij(7, P, W3),
	W1=[_,_,_,_,_,A,B,C,_],
	W2=[_,_,_,_,_,A1,B1,C1,_],
	W3=[_,_,_,_,_,A2,B2,C2,_],
	Q=[A, B, C, A1, B1, C1, A2, B2, C2],!.


quadrants2([[P|Q]|T], Z):-				%quadrants2/2 wordt quadrants2/4
	quadrants2(1,[[P|Q]|T],4, Z).			%met een teller en een halt bij 4

quadrants2(N,[[P|Q]|T], Y, [Y1|Z1]):-			%met de huidige teller en input	
	kwadrant2(N,[[P|Q]|T],Y1),			%pas kwadrant2 toe
	N1 is N+1,					        %verhoof de teller met 1
	quadrants2(N1, [[P|Q]|T],Y, Z1).		%recursie: de vernieude teller toepassen op kwadrant

quadrants2(X, _,Y, []):-				% het basisgeval; output is een legelijst als
	X1 is X-1,!,					%X-1 gelijk is aan de Y.
	X1 = Y,!.


/*en nu deze toevoegen aan een nieuwe evaluatie, genaamd evaluatie2/1 */


evaluatie2(X):-
	columns(X, [[A|B]|C]),				
	evalueerlijst([[A|B]|C]),
	quadrants(X,[[D|E]|F]),
	evalueerlijst([[D|E]|F]),
	quadrants2(X, Z),				%quadrants 2 toegevoegd om te veranderen in een lijst met de 4 kwadranten
	evalueerlijst(Z),!.				%deze lijst evalueren

/*  Deze doet het overigens onder 1 minuut*/


sudoku2(X,Y):-						
	solve_depthfirst_bound2(100, X, Y).		%precies hetzelfde als voorheen. Met een bound van 100

solve_depthfirst_bound2(Bound, Node, Path) :-		
	depthfirst_bound2(Bound, [Node], Node, RevPath),
	reverse(RevPath, Path),!.


depthfirst_bound2(_, Visited, Node, Visited) :-
	noempty(Node),
	nl,
	writelists(Node),
	!.

depthfirst_bound2(Bound, Visited, Node, Path) :-
	Bound > 0,
	move_cyclefree2(Visited, Node, NextNode),
	% sleep(0.5),
	NewBound is Bound - 1,
	depthfirst_bound2(NewBound, [NextNode|Visited], NextNode, Path),!.


move_cyclefree2(Visited, Node, NextNode) :-
	move2(Node, NextNode),				% verwijderen naar move2/2 omdat hier de nieuwe evaluatie in voorkomt.
	\+ member(NextNode, Visited),
	nl,
	writelists(Node).

move2(X, Y):-
	movelijst(X, Y),
	evaluatie2(Y).








