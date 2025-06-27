% Define basic relationships
parent(john, mary).
male(john).
female(mary).

parent(mary, david).
male(david).
female(mary).

parent(david, emily).
male(david).
female(emily).

% Implement derived relationships using rules

% Grandparent rule
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Sibling rule
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Cousin rule
cousin(X, Y) :- parent(Z, X), sibling(Z, W), parent(W, Y).

% Logical inference queries

% Who are the children of a particular person?
children(Parent, Children) :- findall(Child, parent(Parent, Child), Children).

% Who are the siblings of a particular person?
siblings(Person, Siblings) :- findall(Sibling, sibling(Person, Sibling), Siblings).

% Is one person a cousin of another?
is_cousin(Person1, Person2) :- cousin(Person1, Person2).

% Recursive logic to answer queries that involve indirect relationships

% Identify all descendants of a person
descendants(Person, Descendants) :- findall(Descendant, descendant(Person, Descendant), Descendants).

descendant(Person, Descendant) :- parent(Person, Descendant).
descendant(Person, Descendant) :- parent(Person, Parent), descendant(Parent, Descendant).