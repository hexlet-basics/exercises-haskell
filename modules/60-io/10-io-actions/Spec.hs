module Main where

import ExerciseTest (captureOutput)
import Test.Hspec
import qualified Solution

main :: IO ()
main = hspec $ do
  describe "formatReading" $ do
    it "formats the sample reading as text" $ do
      Solution.formatReading 27 `shouldBe` "Reading: 27"

    it "formats zero" $ do
      Solution.formatReading 0 `shouldBe` "Reading: 0"

    it "formats a positive reading" $ do
      Solution.formatReading 1 `shouldBe` "Reading: 1"

    it "preserves a negative reading" $ do
      Solution.formatReading (-7) `shouldBe` "Reading: -7"

    it "uses the complete supplied number" $ do
      Solution.formatReading 1000 `shouldBe` "Reading: 1000"

    it "handles a large Integer" $ do
      Solution.formatReading 12345678901234567890 `shouldBe` "Reading: 12345678901234567890"

  describe "main" $ do
    it "prints the formatted sample reading with exactly one newline" $ do
      (_, output) <- captureOutput Solution.main
      output `shouldBe` "Reading: 27\n"

    it "returns the unit result of its output action" $ do
      (result, _) <- captureOutput Solution.main
      result `shouldBe` ()
