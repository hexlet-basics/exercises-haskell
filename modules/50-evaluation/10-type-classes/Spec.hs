module Main where

import Test.Hspec

import qualified Solution

data TestToken = Token String Integer
  deriving (Eq)

main :: IO ()
main = hspec $ do
  describe "findPosition" $ do
    it "returns Nothing for an empty list" $ do
      Solution.findPosition (7 :: Integer) [] `shouldBe` Nothing
    it "returns zero for a matching singleton" $ do
      Solution.findPosition (7 :: Integer) [7] `shouldBe` Just 0
    it "returns Nothing for a non-matching singleton" $ do
      Solution.findPosition (7 :: Integer) [2] `shouldBe` Nothing
    it "returns Nothing when the target is absent" $ do
      Solution.findPosition (9 :: Integer) [2, 7] `shouldBe` Nothing
    it "returns zero for a matching first element" $ do
      Solution.findPosition (7 :: Integer) [7, 2, 7] `shouldBe` Just 0
    it "returns the first matching position among repeated values" $ do
      Solution.findPosition (7 :: Integer) [2, 7, 7] `shouldBe` Just 1
    it "finds a match at the last position" $ do
      Solution.findPosition (7 :: Integer) [2, 3, 4, 7] `shouldBe` Just 3
    it "works with string elements" $ do
      Solution.findPosition "B" ["A", "B", "C"] `shouldBe` Just 1
    it "can find an empty string as a real value" $ do
      Solution.findPosition "" ["A", "", "B"] `shouldBe` Just 1
    it "works with Boolean elements" $ do
      Solution.findPosition True [False, False, True] `shouldBe` Just 2
    it "works with a custom type that derives Eq without Show" $ do
      Solution.findPosition (Token "A" 2) [Token "A" 1, Token "A" 2, Token "B" 2]
        `shouldBe` Just 1
