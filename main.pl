:- include(database).                               

start:- concern(Disease),    /* here start is the procedure which   will return true only       if  its given condition return true */ 
write('I believe that the patient have : '), /* here we need to check or verify for the    */         
write(Disease),                   /*  disease which are given below whether it is true or not */
nl,              
write('Book an appointment with a licensed medical practitioner to confirm the diagnosis'),
write('with confirmative tests'),
undo.  
/* how to ask questions */
ask(Question) :-
write('Does the patient have following symptom:'),
write(Question),      /* here it will ask for the symptomps and the question is replaced by the symptomps */
write(' ? '),
read(Response),       /* the reply of the user is read by using this read command */
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;          /* it will assert and save it in memory if the answer is yes */
assert(no(Question)), fail).     /* it will not save in its memory if the answer is no and moved to the other question */

:- dynamic yes/1,no/1.           /* it will start keep asking questions from user dynamically and user has to give answer in yes(y) or no(n) format according to the question */  
/*How to askfor something */
askfor(S) :- (yes(S) -> true ;      
(no(S) -> fail ; ask(S))).      /* if the answer is yes and it is true an will ask for another set of question and if the answer is no it will fail and move to other hypothesis */ 
undo :- retract(yes(_)),fail.   /* and here the s is replaced by the symptoms as it is a parameter */
undo :- retract(no(_)),fail.    /* undo all yes/no assertions*/   
undo.                            /* the undo function is here to undo or clear(refresh) all the working memory and one set of question or hypothesis is verified */                           