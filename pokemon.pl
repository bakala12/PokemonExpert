:-dynamic db_facts/1.
:-dynamic db_denied_facts/1.

clear_db :- retract(db_facts(_)), fail.
clear_db :- retract(db_denied_facts(_)),fail.
clear_db :- !.

save_db(X,tak):-asserta(db_facts(X)),!.
save_db(X,nie):-asserta(db_denied_facts(X)),!,fail.
save_db(X,_):-ask_question(X),!.

ask_question(X):-
    question(X),
    nl,
    read(R),
    save_db(X,R).

check(X):- db_facts(X),!.
check(X):- not(db_denied_facts(X)),!,ask_question(X).

first_char_uppercase(WordLC, WordUC) :-
    atom_chars(WordLC, [FirstChLow|LWordLC]),
    atom_chars(FirstLow, [FirstChLow]),
    lwrupr(FirstLow, FirstUpp),
    atom_chars(FirstUpp, [FirstChUpp]),
    atom_chars(WordUC, [FirstChUpp|LWordLC]).

lwrupr(Low,Upp) :- upcase_atom(Low,Upp).

print_answer(X):-
    write("Twój pokemon to: "),
    write(X),
    nl.

display_pokemon(X):-
    atom_concat(X,".png",Y),
    atom_concat("Images\\",Y,Z),
    win_shell(open,Z).

find_pokemon:- clear_db, pokemon(X), first_char_uppercase(X,Y), print_answer(Y), display_pokemon(Y).

question(round) :- write("Czy jest okragly?"),!.
question(flies) :- write("Czy unosi sie w powietrzu?"),!.
question(poisonous) :- write("Czy jest typu trujacego?"),!.
question(pokeball) :- write("Czy wyglada jak pokeball?"),!.
question(scary) :- write("Czy lubi straszyc ludzi?"),!.
question(evolve) :- write("Czy moze evoluowac?"),!.
question(thunder):- write("Czy moze atakowac piorunem?"),!.
question(fight):- write("Czy jest typem walczacym?"),!.
question(water):- write("Czy jest typu wodnego?"),!.
question(tourtle) :- write("Czy jest zólwiem?"),!.
question(yellow):- write("Czy jest koloru zóltego?"),!.
question(teamR):- write("Czy jest czlonkiem zespolu R?"),!.
question(grass):- write("Czy jest typu trawiastego?"),!.

pokemon(gastly) :-
    check(round),
    check(flies),
    check(poisonous),
    check(scary),!.

pokemon(koffing) :-
    check(round),
    check(flies),
    check(poisonous),
    not(check(scary)),!.

pokemon(magnemite) :-
    check(round),
    check(flies),
    not(check(poisonous)),
    check(thunder),!.

pokemon(geodude) :-
    check(round),
    check(flies),
    not(check(poisonous)),
    not(check(thunder)),!.

pokemon(voltorb) :-
    check(round),
    not(check(flies)),
    check(pokeball),
    check(evolve),!.

pokemon(electrode) :-
    check(round),
    not(check(flies)),
    check(pokeball),
    not(check(evolve)),!.

pokemon(poliwrath) :-
    check(round),
    not(check(flies)),
    not(check(pokeball)),
    check(fight),!.

pokemon(golem):-
    check(round),
    not(check(flies)),
    not(check(pokeball)),
    not(check(fight)),!.

pokemon(squirtle) :-
    not(check(round)),
    check(water),
    check(tourtle),
    check(evolve),!.

pokemon(blastoise) :-
    not(check(round)),
    check(water),
    check(tourtle),
    not(check(evolve)),!.

pokemon(psyduck) :-
    not(check(round)),
    check(water),
    not(check(tourtle)),
    check(yellow),!.

pokemon(gyarados) :-
    not(check(round)),
    check(water),
    not(check(tourtle)),
    not(check(yellow)),!.

pokemon(victreebel) :-
    not(check(round)),
    not(check(water)),
    check(grass),
    check(teamR),!.

pokemon(bulbasaur) :-
    not(check(round)),
    not(check(water)),
    check(grass),
    not(check(teamR)),!.

pokemon(pikachu) :-
    not(check(round)),
    not(check(water)),
    not(check(grass)),
    check(thunder),!.

pokemon(charizard) :-
    not(check(round)),
    not(check(water)),
    not(check(grass)),
    not(check(thunder)),!.





















