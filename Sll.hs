module Sll where

type Name = String
data Expr = Var Variable | Ctr Name [Expr] | FCall Name [Expr] | GCall Name [Expr] deriving (Eq)
-- Variable is either named variable or selector variable.
data Variable = NVar Name deriving (Eq, Ord)
data Pat = Pat Name [Variable] deriving (Eq)
data GDef = GDef Name Pat [Variable] Expr deriving (Eq)
data FDef = FDef Name [Variable] Expr deriving (Eq)
data Program = Program [FDef] [GDef] deriving (Eq)
