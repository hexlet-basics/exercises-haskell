module Main where

import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "normalizeSpaces" $ do
    it "joins words separated by several spaces" $ do
      Solution.normalizeSpaces "Ready   to  start" `shouldBe` "Ready to start"

    it "removes leading and trailing spaces" $ do
      Solution.normalizeSpaces "  Ready to start  " `shouldBe` "Ready to start"

    it "replaces tabs and line breaks with spaces" $ do
      Solution.normalizeSpaces "Sensor\tA7\nready" `shouldBe` "Sensor A7 ready"

    it "preserves case and punctuation" $ do
      Solution.normalizeSpaces "Keep,  CASE!" `shouldBe` "Keep, CASE!"

    it "handles an empty string" $ do
      Solution.normalizeSpaces "" `shouldBe` ""

    it "handles a string containing only whitespace" $ do
      Solution.normalizeSpaces " \t\n\r  " `shouldBe` ""

    it "leaves a single word unchanged" $ do
      Solution.normalizeSpaces "Sensor-42" `shouldBe` "Sensor-42"

    it "leaves already normalized text unchanged" $ do
      Solution.normalizeSpaces "one two three" `shouldBe` "one two three"

    it "handles several kinds of separators together" $ do
      Solution.normalizeSpaces "\t one \n\t two\r\nthree \t" `shouldBe` "one two three"
