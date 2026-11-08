module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "combineReadings" $ do
    it "combines the requested primary prefix and backup remainder" $ do
      Solution.combineReadings 2 1 [10, 20, 30] [40, 50, 60]
        `shouldBe` [10, 20, 50, 60]
    it "keeps all primary values when the requested count is larger" $ do
      Solution.combineReadings 1000 0 [10] [20, 30]
        `shouldBe` [10, 20, 30]
    it "omits the primary list when the keep count is zero" $ do
      Solution.combineReadings 0 1 [10, 20] [30, 40]
        `shouldBe` [40]
    it "uses the whole backup list when the skip count is zero" $ do
      Solution.combineReadings 1 0 [10, 20] [30, 40]
        `shouldBe` [10, 30, 40]
    it "omits the backup list when the skip count equals its length" $ do
      Solution.combineReadings 2 2 [10, 20, 30] [40, 50]
        `shouldBe` [10, 20]
    it "omits the backup list when the skip count is larger" $ do
      Solution.combineReadings 2 1000 [10, 20] [30]
        `shouldBe` [10, 20]
    it "handles an empty primary list" $ do
      Solution.combineReadings 2 1 [] [30, 40]
        `shouldBe` [40]
    it "handles an empty backup list" $ do
      Solution.combineReadings 2 1 [10, 20, 30] []
        `shouldBe` [10, 20]
    it "handles two empty lists" $ do
      Solution.combineReadings 1000 1000 [] []
        `shouldBe` []
    it "preserves repeated values and the order of negative readings" $ do
      Solution.combineReadings 3 1 [-1000, 7, 7, 8] [5, 1000, -3, 1000]
        `shouldBe` [-1000, 7, 7, 1000, -3, 1000]
