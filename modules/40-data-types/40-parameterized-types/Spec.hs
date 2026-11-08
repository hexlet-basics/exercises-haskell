module Main where

import Test.Hspec
import qualified Solution

addOne :: Integer -> Integer
addOne number = number + 1

main :: IO ()
main = hspec $ do
  describe "Tagged and tagValue" $ do
    it "extracts an Integer" $ do
      Solution.tagValue (Solution.Tagged "count" (12 :: Integer)) `shouldBe` 12

    it "preserves a negative Integer" $ do
      Solution.tagValue (Solution.Tagged "offset" (-7 :: Integer)) `shouldBe` (-7)

    it "extracts True" $ do
      Solution.tagValue (Solution.Tagged "ready" True) `shouldBe` True

    it "extracts False" $ do
      Solution.tagValue (Solution.Tagged "ready" False) `shouldBe` False

    it "extracts text without including its label" $ do
      Solution.tagValue (Solution.Tagged "message" "Hello there") `shouldBe` "Hello there"

    it "accepts an empty label" $ do
      Solution.tagValue (Solution.Tagged "" "Payload") `shouldBe` "Payload"

    it "preserves empty text" $ do
      Solution.tagValue (Solution.Tagged "empty" "") `shouldBe` ""

    it "extracts a list with repetitions in order" $ do
      Solution.tagValue (Solution.Tagged "readings" [3, 1, 3 :: Integer]) `shouldBe` [3, 1, 3]

    it "extracts an empty list" $ do
      Solution.tagValue (Solution.Tagged "readings" ([] :: [Integer])) `shouldBe` []

    it "extracts a pair of different types" $ do
      Solution.tagValue (Solution.Tagged "entry" ("A1", True)) `shouldBe` ("A1", True)

    it "extracts a character" $ do
      Solution.tagValue (Solution.Tagged "unit" 'C') `shouldBe` 'C'

    it "can store and extract a function" $ do
      Solution.tagValue (Solution.Tagged "operation" addOne) 4 `shouldBe` 5

    it "keeps both fields available through the constructor" $ do
      case Solution.Tagged "reading" (27 :: Integer) of
        Solution.Tagged label value -> do
          label `shouldBe` "reading"
          value `shouldBe` 27
