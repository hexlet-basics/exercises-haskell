module Main where

import Test.Hspec

import qualified Solution

positive :: Integer -> Bool
positive value = value > 0

main :: IO ()
main = hspec $ do
  describe "findFirst" $ do
    it "returns Nothing for an empty list" $ do
      Solution.findFirst positive [] `shouldBe` Nothing
    it "finds the only matching element" $ do
      Solution.findFirst positive [5] `shouldBe` Just 5
    it "returns Nothing for a single non-matching element" $ do
      Solution.findFirst positive [-5] `shouldBe` Nothing
    it "returns Nothing when all values fail the predicate" $ do
      Solution.findFirst positive [-5, 0, -2] `shouldBe` Nothing
    it "returns the first of several matching numbers" $ do
      Solution.findFirst positive [-5, 3, 8, 4] `shouldBe` Just 3
    it "can return the first element of the list" $ do
      Solution.findFirst positive [2, -1, 5] `shouldBe` Just 2
    it "can find the last element of the list" $ do
      Solution.findFirst positive [-2, 0, 6] `shouldBe` Just 6
    it "keeps a matching zero as a real result" $ do
      Solution.findFirst (\value -> value == 0) ([4, 0, 2] :: [Integer])
        `shouldBe` Just 0
    it "works with strings and keeps the first matching string" $ do
      Solution.findFirst (\text -> length text >= 3) ["a", "cat", "horse"]
        `shouldBe` Just "cat"
    it "returns Nothing for a string list without a match" $ do
      Solution.findFirst (\text -> length text >= 3) ["", "a", "bb"]
        `shouldBe` Nothing
    it "works with Boolean elements" $ do
      Solution.findFirst (\value -> value) [False, True, True]
        `shouldBe` Just True
    it "uses a predicate that accepts every value" $ do
      Solution.findFirst (\_ -> True) ["first", "second"]
        `shouldBe` Just "first"
