module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "named string values" $ do
    it "defines the edge" $ do
      Solution.edge `shouldBe` "|"
    it "defines the gap" $ do
      Solution.gap `shouldBe` " "
  describe "makeBadge" $ do
    it "decorates a word" $ do
      Solution.makeBadge "Book" `shouldBe` "| Book |"
    it "preserves an empty input" $ do
      Solution.makeBadge "" `shouldBe` "|  |"
    it "preserves spaces in the input" $ do
      Solution.makeBadge " A " `shouldBe` "|  A  |"
    it "preserves several words" $ do
      Solution.makeBadge "North hall" `shouldBe` "| North hall |"
    it "preserves punctuation" $ do
      Solution.makeBadge "Ready?" `shouldBe` "| Ready? |"
    it "preserves an edge in the input" $ do
      Solution.makeBadge "|" `shouldBe` "| | |"
