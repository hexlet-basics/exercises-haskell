module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "buildChain" $ do
    it "returns the exact ending for an empty list" $ do
      Solution.buildChain "END" [] `shouldBe` "END"
    it "handles an empty list and an empty ending" $ do
      Solution.buildChain "" [] `shouldBe` ""
    it "places a separator between one label and the ending" $ do
      Solution.buildChain "END" ["A"] `shouldBe` "A>END"
    it "preserves the order of distinct labels" $ do
      Solution.buildChain "STOP" ["C", "A", "B"] `shouldBe` "C>A>B>STOP"
    it "uses the supplied ending rather than a fixed suffix" $ do
      Solution.buildChain "DONE" ["A", "B"] `shouldBe` "A>B>DONE"
    it "preserves repeated labels" $ do
      Solution.buildChain "END" ["B", "A", "B"] `shouldBe` "B>A>B>END"
    it "keeps the separator for each empty label" $ do
      Solution.buildChain "END" ["A", "", "B"] `shouldBe` "A>>B>END"
    it "leaves a final separator when the ending is empty" $ do
      Solution.buildChain "" ["A", "B"] `shouldBe` "A>B>"
    it "keeps existing separator characters inside the ending" $ do
      Solution.buildChain "tail>stop" ["A", "B"] `shouldBe` "A>B>tail>stop"
    it "keeps existing separator characters inside labels" $ do
      Solution.buildChain "END" ["A>B", "C"] `shouldBe` "A>B>C>END"
