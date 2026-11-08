module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "duration in minutes" $ do
    it "handles zero minutes" $ do
      Solution.fullHours 0 `shouldBe` 0
      Solution.remainingMinutes 0 `shouldBe` 0
    it "handles one minute" $ do
      Solution.fullHours 1 `shouldBe` 0
      Solution.remainingMinutes 1 `shouldBe` 1
    it "handles the last minute before an hour" $ do
      Solution.fullHours 59 `shouldBe` 0
      Solution.remainingMinutes 59 `shouldBe` 59
    it "handles exactly one hour" $ do
      Solution.fullHours 60 `shouldBe` 1
      Solution.remainingMinutes 60 `shouldBe` 0
    it "handles the first minute after an hour" $ do
      Solution.fullHours 61 `shouldBe` 1
      Solution.remainingMinutes 61 `shouldBe` 1
    it "handles several hours with a remainder" $ do
      Solution.fullHours 135 `shouldBe` 2
      Solution.remainingMinutes 135 `shouldBe` 15
    it "keeps hours beyond a full day" $ do
      Solution.fullHours 1500 `shouldBe` 25
      Solution.remainingMinutes 1500 `shouldBe` 0
    it "handles the upper allowed duration" $ do
      Solution.fullHours 1000000 `shouldBe` 16666
      Solution.remainingMinutes 1000000 `shouldBe` 40
