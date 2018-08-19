module Main where

import Sll
import SllUtil
import SllIo
import Treeless

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)

prog :: Program
prog = read
  " gApp(Cons(x, xs), ys) = Cons(x, gApp(xs, ys));\
  \ gApp(Nil(), ys) = ys; \
  \ gApp1(Cons(x, xs), ys) = Cons(x, gApp2(xs, ys));\
  \ gApp1(Nil(), ys) = ys;\
  \ gApp2(Cons(x, xs), ys) = Cons(x, gApp1(xs, ys));\
  \ gApp2(Nil(), ys) = ys; \
  \ fZeros()  = Cons(Z(), fZeros()); \
  \  "

unitTests =
  testGroup
    "Unit tests"
    [progIsTreless]

progIsTreless =
  testCase "program is treless" $ assertEqual [] True (isTreelessProgram prog)

main = defaultMain unitTests
