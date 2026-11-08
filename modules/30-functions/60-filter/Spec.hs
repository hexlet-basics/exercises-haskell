module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "keepInRange" $ do
    it "handles an empty input list" $ do
      Solution.keepInRange 10 20 [] `shouldBe` []

    it "includes both interval boundaries" $ do
      Solution.keepInRange 10 20 [9, 10, 15, 20, 21] `shouldBe` [10, 15, 20]

    it "keeps a single matching element" $ do
      Solution.keepInRange 10 20 [15] `shouldBe` [15]

    it "removes a single nonmatching element" $ do
      Solution.keepInRange 10 20 [9] `shouldBe` []

    it "returns an empty list when no elements match" $ do
      Solution.keepInRange 10 20 [1, 9, 21, 30] `shouldBe` []

    it "preserves the order and repetitions of matching elements" $ do
      Solution.keepInRange 0 10 [8, -1, 3, 12, 8, 0, 10] `shouldBe` [8, 3, 8, 0, 10]

    it "accepts a one-value interval" $ do
      Solution.keepInRange 5 5 [4, 5, 5, 6] `shouldBe` [5, 5]

    it "supports negative boundaries and readings" $ do
      Solution.keepInRange (-3) 2 [-5, -3, -1, 0, 2, 4] `shouldBe` [-3, -1, 0, 2]

    it "keeps all elements when all match" $ do
      Solution.keepInRange 0 10 [5, 1, 8] `shouldBe` [5, 1, 8]

    it "uses the supplied boundaries" $ do
      Solution.keepInRange 100 120 [105, 95, 100, 120, 121] `shouldBe` [105, 100, 120]
