module Sll where

type Name = String
type Variable = String
data Expr = Var Variable | Ctr Name [Expr] | FCall Name [Expr] | GCall Name [Expr] deriving (Eq)
data Pat = Pat Name [Variable] deriving (Eq)
data GDef = GDef Name Pat [Variable] Expr deriving (Eq)
data FDef = FDef Name [Variable] Expr deriving (Eq)
data Program = Program [FDef] [GDef] deriving (Eq)
