module GSll where

type GName = String
type GVariable = String
data GExpr = GVar GVariable
           | Ctr GName [BExpr]
           | FCall GName [BExpr]
           | GCall GName [BExpr]
           | GLet GVariable BExpr BExpr
           deriving (Eq)
data BExpr = BPlus GExpr | BMinu GExpr deriving (Eq)

data GPat = GPat GName [GVariable] deriving (Eq)
data GGDef = GGDef GName GPat [GVariable] GExpr deriving (Eq)
data GFDef = GFDef GName [GVariable] GExpr deriving (Eq)
data GProgram = GProgram [GFDef] [GGDef] deriving (Eq)
