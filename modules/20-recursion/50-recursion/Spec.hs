module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "sumFirst" $ do
    it "returns zero when no numbers are requested" $ do
      Solution.sumFirst 0 `shouldBe` 0

    it "counts zero as the first nonnegative integer" $ do
      Solution.sumFirst 1 `shouldBe` 0

    it "adds the first two numbers" $ do
      Solution.sumFirst 2 `shouldBe` 1

    it "adds the first three numbers" $ do
      Solution.sumFirst 3 `shouldBe` 3

    it "stops before the number equal to the count" $ do
      Solution.sumFirst 4 `shouldBe` 6

    it "handles five terms" $ do
      Solution.sumFirst 5 `shouldBe` 10

    it "handles ten terms" $ do
      Solution.sumFirst 10 `shouldBe` 45

    it "handles a larger count" $ do
      Solution.sumFirst 25 `shouldBe` 300

    it "handles one hundred terms" $ do
      Solution.sumFirst 100 `shouldBe` 4950

    it "handles the upper input boundary" $ do
      Solution.sumFirst 1000 `shouldBe` 499500
