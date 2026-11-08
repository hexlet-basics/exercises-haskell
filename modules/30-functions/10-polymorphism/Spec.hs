module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "swapPair" $ do
    it "swaps a string and an integer" $ do
      Solution.swapPair ("Room", 6 :: Integer) `shouldBe` (6, "Room")
    it "swaps a boolean and a string" $ do
      Solution.swapPair (True, "Ready") `shouldBe` ("Ready", True)
    it "preserves an empty string" $ do
      Solution.swapPair (0 :: Integer, "") `shouldBe` ("", 0)
    it "swaps a character and a boolean" $ do
      Solution.swapPair ('x', False) `shouldBe` (False, 'x')
    it "allows the same type in both positions" $ do
      Solution.swapPair ("North", "South") `shouldBe` ("South", "North")
    it "preserves a nonempty list" $ do
      Solution.swapPair ([1, 2] :: [Integer], "samples") `shouldBe` ("samples", [1, 2])
    it "preserves an empty list" $ do
      Solution.swapPair ([] :: [Integer], False) `shouldBe` (False, [])
    it "preserves a nested pair" $ do
      Solution.swapPair (("A", True), 3 :: Integer) `shouldBe` (3, ("A", True))
