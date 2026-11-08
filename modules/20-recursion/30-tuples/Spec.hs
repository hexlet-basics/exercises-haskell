module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "itemTotal" $ do
    it "returns the code and the total price" $ do
      Solution.itemTotal "A12" 250 3 `shouldBe` ("A12", 750)
    it "handles a zero quantity" $ do
      Solution.itemTotal "B7" 1000 0 `shouldBe` ("B7", 0)
    it "handles a zero unit price" $ do
      Solution.itemTotal "FREE" 0 100 `shouldBe` ("FREE", 0)
    it "handles a single unit at the upper price boundary" $ do
      Solution.itemTotal "ONE" 1000000 1 `shouldBe` ("ONE", 1000000)
    it "handles both upper numeric boundaries" $ do
      Solution.itemTotal "MAX" 1000000 1000 `shouldBe` ("MAX", 1000000000)
    it "preserves an empty code" $ do
      Solution.itemTotal "" 35 2 `shouldBe` ("", 70)
    it "preserves spaces in a code" $ do
      Solution.itemTotal " x " 70 2 `shouldBe` (" x ", 140)
    it "handles a small price and a large quantity" $ do
      Solution.itemTotal "P9" 1 999 `shouldBe` ("P9", 999)
