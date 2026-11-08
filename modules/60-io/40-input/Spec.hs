module Main where

import ExerciseTest (captureOutput, withInput)
import Test.Hspec
import qualified Solution

checkOutput :: String -> String -> IO ()
checkOutput input expected = do
  (result, output) <- captureOutput (withInput input Solution.main)
  result `shouldBe` ()
  output `shouldBe` expected

main :: IO ()
main = hspec $ do
  describe "main" $ do
    it "accepts an ordinary quantity" $ do
      checkOutput "12\n" "Accepted: 12\n"
    it "accepts the lower boundary" $ do
      checkOutput "1\n" "Accepted: 1\n"
    it "accepts the upper boundary" $ do
      checkOutput "100\n" "Accepted: 100\n"
    it "accepts surrounding whitespace" $ do
      checkOutput " \t27 \t\n" "Accepted: 27\n"
    it "normalizes leading zeroes in the output" $ do
      checkOutput "001\n" "Accepted: 1\n"
    it "accepts parenthesized input supported by Read" $ do
      checkOutput "(42)\n" "Accepted: 42\n"
    it "accepts hexadecimal input supported by Read" $ do
      checkOutput "0x10\n" "Accepted: 16\n"
    it "rejects zero as outside the range" $ do
      checkOutput "0\n" "Rejected: Quantity out of range\n"
    it "rejects the value just above the upper boundary" $ do
      checkOutput "101\n" "Rejected: Quantity out of range\n"
    it "rejects a negative integer as outside the range" $ do
      checkOutput "-3\n" "Rejected: Quantity out of range\n"
    it "rejects a large integer as outside the range" $ do
      checkOutput "123456789012345678901234567890\n" "Rejected: Quantity out of range\n"
    it "rejects an empty line as an invalid integer" $ do
      checkOutput "\n" "Rejected: Invalid integer\n"
    it "rejects a whitespace-only line" $ do
      checkOutput " \t \n" "Rejected: Invalid integer\n"
    it "rejects text in place of a number" $ do
      checkOutput "hello\n" "Rejected: Invalid integer\n"
    it "rejects a valid prefix followed by text" $ do
      checkOutput "12x\n" "Rejected: Invalid integer\n"
    it "rejects a fractional notation" $ do
      checkOutput "12.0\n" "Rejected: Invalid integer\n"
    it "rejects an explicit plus sign unsupported by Read" $ do
      checkOutput "+3\n" "Rejected: Invalid integer\n"
    it "rejects two numbers on the same line" $ do
      checkOutput "12 3\n" "Rejected: Invalid integer\n"
