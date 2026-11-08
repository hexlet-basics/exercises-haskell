module Main where

import Test.Hspec
import qualified Solution

addThree :: Integer -> Integer
addThree number = number + 3

double :: Integer -> Integer
double number = number * 2

half :: Double -> Double
half number = number / 2

addMark :: String -> String
addMark text = text ++ "!"

removeFirst :: [Integer] -> [Integer]
removeFirst values = drop 1 values

swapPair :: (Integer, Integer) -> (Integer, Integer)
swapPair (first, second) = (second, first)

nextCode :: Char -> Char
nextCode code = if code == 'A' then 'B' else 'C'

main :: IO ()
main = hspec $ do
  describe "applyTwice" $ do
    it "applies integer addition twice" $ do
      Solution.applyTwice addThree 4 `shouldBe` 10

    it "feeds the first integer result into the second application" $ do
      Solution.applyTwice double 3 `shouldBe` 12

    it "works with fractional values" $ do
      Solution.applyTwice half 8 `shouldBe` 2

    it "negates True twice" $ do
      Solution.applyTwice not True `shouldBe` True

    it "negates False twice" $ do
      Solution.applyTwice not False `shouldBe` False

    it "applies a string transformation twice" $ do
      Solution.applyTwice addMark "Hi" `shouldBe` "Hi!!"

    it "accepts an empty initial string" $ do
      Solution.applyTwice addMark "" `shouldBe` "!!"

    it "works with lists" $ do
      Solution.applyTwice removeFirst [1, 2, 3, 4] `shouldBe` [3, 4]

    it "handles an empty initial list" $ do
      Solution.applyTwice removeFirst [] `shouldBe` []

    it "works with pairs" $ do
      Solution.applyTwice swapPair (3, 7) `shouldBe` (3, 7)

    it "works with characters" $ do
      Solution.applyTwice nextCode 'A' `shouldBe` 'C'
