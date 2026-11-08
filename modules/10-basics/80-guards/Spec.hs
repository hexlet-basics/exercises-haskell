module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "humidityStatus" $ do
    it "classifies the lowest allowed reading" $ do
      Solution.humidityStatus 0 `shouldBe` "dry"
    it "classifies the reading below the normal range" $ do
      Solution.humidityStatus 29 `shouldBe` "dry"
    it "includes the lower normal boundary" $ do
      Solution.humidityStatus 30 `shouldBe` "normal"
    it "classifies a reading inside the normal range" $ do
      Solution.humidityStatus 50 `shouldBe` "normal"
    it "includes the upper normal boundary" $ do
      Solution.humidityStatus 70 `shouldBe` "normal"
    it "classifies the reading above the normal range" $ do
      Solution.humidityStatus 71 `shouldBe` "wet"
    it "classifies the highest allowed reading" $ do
      Solution.humidityStatus 100 `shouldBe` "wet"
