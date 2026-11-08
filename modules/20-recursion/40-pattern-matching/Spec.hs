module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "firstOrDefault" $ do
    it "returns the supplied fallback for an empty list" $ do
      Solution.firstOrDefault 42 [] `shouldBe` 42
    it "accepts a negative fallback" $ do
      Solution.firstOrDefault (-3) [] `shouldBe` (-3)
    it "returns the only element of a singleton list" $ do
      Solution.firstOrDefault 99 [7] `shouldBe` 7
    it "returns the first element rather than a later element" $ do
      Solution.firstOrDefault 0 [7, 11, 17] `shouldBe` 7
    it "returns a zero first element without using the fallback" $ do
      Solution.firstOrDefault 100 [0, 4] `shouldBe` 0
    it "returns a negative first element" $ do
      Solution.firstOrDefault 20 [-5, 10] `shouldBe` (-5)
    it "handles repeated elements" $ do
      Solution.firstOrDefault (-1000) [11, 11, 11] `shouldBe` 11
    it "handles the boundary values of the input range" $ do
      Solution.firstOrDefault 999 [1000, -1000] `shouldBe` 1000
