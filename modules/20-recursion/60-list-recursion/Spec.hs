module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "removeInvalid" $ do
    it "returns an empty list for an empty input" $ do
      Solution.removeInvalid 7 [] `shouldBe` []
    it "removes the only element when it is invalid" $ do
      Solution.removeInvalid 5 [5] `shouldBe` []
    it "preserves a single valid element" $ do
      Solution.removeInvalid 5 [4] `shouldBe` [4]
    it "removes invalid readings from the beginning middle and end" $ do
      Solution.removeInvalid 7 [7, 1, 7, 2, 7] `shouldBe` [1, 2]
    it "preserves all readings when the invalid value is absent" $ do
      Solution.removeInvalid 9 [1, 2, 3] `shouldBe` [1, 2, 3]
    it "removes consecutive invalid readings" $ do
      Solution.removeInvalid 3 [3, 3, 3] `shouldBe` []
    it "handles zero as the invalid value" $ do
      Solution.removeInvalid 0 [1, 0, -2, 0, 1] `shouldBe` [1, -2, 1]
    it "handles negative invalid values and both input boundaries" $ do
      Solution.removeInvalid (-1) [-1, -1000, 0, 1000, -1]
        `shouldBe` [-1000, 0, 1000]
    it "preserves the order and repetition of valid values" $ do
      Solution.removeInvalid 8 [4, 4, 8, 4] `shouldBe` [4, 4, 4]
    it "processes a list at the maximum valid length" $ do
      Solution.removeInvalid 50 [1 .. 100]
        `shouldBe` ([1 .. 49] ++ [51 .. 100])
