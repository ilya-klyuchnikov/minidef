# minidef

### Definitions

**Treeless form**.
Let F be a set of function names. A term is treeless with respect to F if it is linear, it only contains functions in F, and every argument of a function application and every selector of a case term is a variable.

In other words, writing `tt` for treeless terms with respect to `F`,
```
tt ::= v
    | c tt_1 ... tt_k
    | f v_1 ... v_k
    | case v0 of p_1 -> tt_1 | ··· | p_n -> tt_n
```
where, in addition, `tt` is linear and each `f` is in `F`.
A collection of function definitions F is treeless if each right-hand side in F is treeless with respect to F.

A definition for SLL language is even simpler:
```
tt ::= v
    | c tt_1 ... tt_k
    | f v_1 ... v_k
    | g v_1 ... v_k
```


**Deforestation Theorem**.
Every composition of functions with treeless definitions can be effectively transformed to a single function with a treeless definition, without loss of efficiency.
