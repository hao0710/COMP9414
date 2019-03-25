/* 
comp9414 assignment1

*/

%question_1
%check whether the number is negtive
check_num(N) :-
N < 0.
%empty list returns 0
sumsq_neg([],0).
% if a number is postive then do not add it to the sum.
sumsq_neg([Head|Tail],Sum):-
	not(check_num(Head)),
	sumsq_neg(Tail,Sum).

%if negtive add it to the sum.
sumsq_neg([Head|Tail],Sum):-
	check_num(Head),
	sumsq_neg(Tail,S),
	Sum is S+Head*Head.


%question_2	
%one people like everything
one_people_like(_,[]).%I 错误删除了这一行
one_people_like(Person,[First_good|Rest_good]):-
	likes(Person,First_good),
	one_people_like(Person,Rest_good).

%either one is empty.
all_like_all(_,[]).
all_like_all([],_).
%check people
all_like_all([First_people|Rest_people],G):-
	one_people_like(First_people,G),
	all_like_all(Rest_people,G).


%question_3
check_num(N,M):-
	N>M,
	M>=0.
%base case when N and M are equal
sqrt_table(N,M,Result):-
	N=M,
	Answer is sqrt(N),
	Result=[[N,Answer]].
% when N>M
sqrt_table(N,M,Result):-
	check_num(N,M),
	Next_n is N-1,
	Answer is sqrt(N),
	Result=[[N,Answer]|Rest],
	sqrt_table(Next_n,M,Rest).



	
%question_4
%check two number if successive
check_succes_2(N,M):-
	M is N+1.
%if empty list
chop_up([],Result):-
	Result = [].
%if only one number
chop_up([Head|T],Result):-
	T=[],
	Result=[].



%question_5
% base_case1, when the end is z
tree_eval(Value,tree(empty,Variable,empty),Eval):-
	Variable=z,
	Eval=Value.
% base_case2, value is just a constant
tree_eval(_,tree(empty,Num,empty),Eval):-
	Eval=Num.
%for + operator
tree_eval(Value,tree(L,Op,R),Eval):-
	Op='+',
	tree_eval(Value,L,L_eval),
	tree_eval(Value,R,R_eval),
	Eval is L_eval+R_eval.

%for - operator
tree_eval(Value,tree(L,Op,R),Eval):-
	Op='-',
	tree_eval(Value,L,L_eval),
	tree_eval(Value,R,R_eval),
	Eval is L_eval-R_eval.

%for * operator
tree_eval(Value,tree(L,Op,R),Eval):-
	Op='*',
	tree_eval(Value,L,L_eval),
	tree_eval(Value,R,R_eval),
	Eval is L_eval*R_eval.

%for /operator
tree_eval(Value,tree(L,Op,R),Eval):-
	Op='/',
	tree_eval(Value,L,L_eval),
	tree_eval(Value,R,R_eval),
	Eval is L_eval/R_eval.
