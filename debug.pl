
bird(parrot).
bird(penguin).

can_fly(penguin):- fail.
can_fly(A):- bird(A).