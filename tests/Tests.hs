{-# LANGUAGE QuasiQuotes #-}

module Main where

import Text.RawString.QQ
import Sll
import SllIo
import SllTreeless
import SllUtil

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.HUnit (assertEqual, testCase)

prog1 :: Program
prog1 = readSllProgram [r|
  gApp(Cons(x, xs), ys) = Cons(x, gApp(xs, ys));
  gApp(Nil(), ys) = ys;
  gApp1(Cons(x, xs), ys) = Cons(x, gApp2(xs, ys));
  gApp1(Nil(), ys) = ys;
  gApp2(Cons(x, xs), ys) = Cons(x, gApp1(xs, ys));
  gApp2(Nil(), ys) = ys;
  fZeros()  = Cons(Z(), fZeros());
|]

prog2 :: Program
prog2 = readSllProgram [r|
  fA(a, b)  = fA(a, b);
|]

prog5 :: Program
prog5 = readSllProgram [r|
  fA(a, b)  = fA(a, a);
|]

prog6 :: Program
prog6 = readSllProgram [r|
  fA(a, b)  = fA(C(a), C(b));
|]

unitTests =
  testGroup
    "Unit tests"
    [prog1IsTreeless, prog2IsTreeless, prog5IsNotTreeless, prog6IsNotTreeless]

prog1IsTreeless =
  testCase "prog1 is treeless" $ assertEqual [] True (isTreelessProgram prog1)

prog2IsTreeless =
  testCase "prog2 is treeless" $ assertEqual [] True (isTreelessProgram prog2)

prog5IsNotTreeless =
  testCase "prog5 is not treeless" $ assertEqual [] False (isTreelessProgram prog5)

prog6IsNotTreeless =
  testCase "prog6 is not treeless" $ assertEqual [] False (isTreelessProgram prog6)

main = defaultMain unitTests
