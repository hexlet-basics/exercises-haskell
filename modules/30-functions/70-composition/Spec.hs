module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "countWords" $ do
    it "handles an empty string" $ do
      Solution.countWords "" `shouldBe` 0
    it "handles a string containing only spaces" $ do
      Solution.countWords "   " `shouldBe` 0
    it "counts a single word" $ do
      Solution.countWords "Haskell" `shouldBe` 1
    it "counts several words" $ do
      Solution.countWords "one two three" `shouldBe` 3
    it "ignores extra spaces around and between words" $ do
      Solution.countWords " one  two " `shouldBe` 2
    it "accepts tabs and newlines as separators" $ do
      Solution.countWords "one\ttwo\nthree" `shouldBe` 3
    it "keeps punctuation inside a word" $ do
      Solution.countWords "hello, world!" `shouldBe` 2
    it "does not split a word at a hyphen" $ do
      Solution.countWords "one-two" `shouldBe` 1
