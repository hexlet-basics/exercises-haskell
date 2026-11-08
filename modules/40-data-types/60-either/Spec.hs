module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "validateQuantity" $ do
    it "accepts the lower boundary" $ do
      Solution.validateQuantity 1 `shouldBe` Right 1
    it "accepts the upper boundary" $ do
      Solution.validateQuantity 1000 `shouldBe` Right 1000
    it "keeps a valid interior quantity unchanged" $ do
      Solution.validateQuantity 10 `shouldBe` Right 10
    it "rejects zero with the lower-bound reason" $ do
      Solution.validateQuantity 0 `shouldBe` Left "Quantity must be at least 1"
    it "rejects a negative quantity with the lower-bound reason" $ do
      Solution.validateQuantity (-1) `shouldBe` Left "Quantity must be at least 1"
    it "rejects the first value above the upper boundary" $ do
      Solution.validateQuantity 1001 `shouldBe` Left "Quantity must be at most 1000"
    it "rejects a large positive quantity" $ do
      Solution.validateQuantity 1000000 `shouldBe` Left "Quantity must be at most 1000"
    it "rejects a large negative quantity" $ do
      Solution.validateQuantity (-1000000) `shouldBe` Left "Quantity must be at least 1"
