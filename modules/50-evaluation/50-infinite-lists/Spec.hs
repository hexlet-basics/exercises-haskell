module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "scaledProgression" $ do
    it "takes and doubles a finite prefix with a positive step" $ do
      Solution.scaledProgression 4 3 2 `shouldBe` [6, 10, 14, 18]
    it "returns an empty list for zero requested elements" $ do
      Solution.scaledProgression 0 3 2 `shouldBe` []
    it "includes the starting value before applying the step" $ do
      Solution.scaledProgression 1 (-3) 8 `shouldBe` [-6]
    it "handles a zero step as a repeated value" $ do
      Solution.scaledProgression 3 5 0 `shouldBe` [10, 10, 10]
    it "handles a negative step and crossing zero" $ do
      Solution.scaledProgression 4 5 (-2) `shouldBe` [10, 6, 2, -2]
    it "handles a negative starting value" $ do
      Solution.scaledProgression 4 (-5) 3 `shouldBe` [-10, -4, 2, 8]
    it "handles zero as the starting value and step" $ do
      Solution.scaledProgression 4 0 0 `shouldBe` [0, 0, 0, 0]
    it "handles the largest allowed start and step" $ do
      Solution.scaledProgression 3 1000 1000 `shouldBe` [2000, 4000, 6000]
    it "returns the full finite prefix at the maximum requested count" $ do
      Solution.scaledProgression 100 0 1 `shouldBe` [0, 2 .. 198]
