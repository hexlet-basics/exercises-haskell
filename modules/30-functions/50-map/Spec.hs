module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "productCodes" $ do
    it "returns an empty list for empty input" $ do
      Solution.productCodes [] `shouldBe` []
    it "extracts the code from a single pair" $ do
      Solution.productCodes [("A1", 100)] `shouldBe` ["A1"]
    it "preserves the order of different product codes" $ do
      Solution.productCodes [("C3", 30), ("A1", 10), ("B2", 20)]
        `shouldBe` ["C3", "A1", "B2"]
    it "preserves repeated product codes" $ do
      Solution.productCodes [("A1", 10), ("A1", 20), ("B2", 30), ("A1", 40)]
        `shouldBe` ["A1", "A1", "B2", "A1"]
    it "keeps empty codes as ordinary elements" $ do
      Solution.productCodes [("", 20), ("B2", 30), ("", 0)]
        `shouldBe` ["", "B2", ""]
    it "does not use prices as output or ordering criteria" $ do
      Solution.productCodes [("Same", 1000000), ("Same", 0), ("Last", 1)]
        `shouldBe` ["Same", "Same", "Last"]
    it "handles several equal prices without dropping codes" $ do
      Solution.productCodes [("X", 250), ("Y", 250), ("Z", 250)]
        `shouldBe` ["X", "Y", "Z"]
    it "handles a code at the maximum allowed length" $ do
      Solution.productCodes [("1234567890123456789012345678901234567890", 50)]
        `shouldBe` ["1234567890123456789012345678901234567890"]
