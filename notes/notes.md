Blazing

```
tt ::= vv
  | (c tt_1 ... tt_k)⊕
  | (f vv_1 ... vv_k)⊕
  | (case vv_0 of p_1 -> tt_1 | ··· | p_n -> tt_n)⊕

vv ::= v
  | (c vv_1 ... vv_k)⊖
  | (f vv_1 ... vv_k)⊖
  | (case vv_0 of p_1 -> vv_1 | ··· | p_n -> vv_n)⊖
```

Q:

Why in the original paper not all blazed sub-terms are extracted?
