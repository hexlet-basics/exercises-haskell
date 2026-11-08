module Main where

import Test.Hspec
import qualified Solution

difference :: Integer -> Integer -> Integer
difference first second = first - second

appendText :: String -> String -> String
appendText first second = first ++ second

belowLimit :: Integer -> Integer -> Bool
belowLimit limit value = value < limit

statusLabel :: String -> Bool -> String
statusLabel label enabled = if enabled then label else "off"

makeEntry :: Integer -> String -> (Integer, String)
makeEntry identifier label = (identifier, label)

main :: IO ()
main = hspec $ do
  describe "bindFirst" $ do
    it "fixes the first argument of subtraction" $ do
      Solution.bindFirst difference 20 3 `shouldBe` 17
    it "allows repeated use with different remaining arguments" $ do
      let subtractFromTwenty = Solution.bindFirst difference 20
      subtractFromTwenty 8 `shouldBe` 12
      subtractFromTwenty 5 `shouldBe` 15
    it "keeps the order of string arguments" $ do
      Solution.bindFirst appendText "pre-" "fix" `shouldBe` "pre-fix"
    it "allows an empty fixed string" $ do
      Solution.bindFirst appendText "" "Book" `shouldBe` "Book"
    it "allows an empty remaining string" $ do
      Solution.bindFirst appendText "Book" "" `shouldBe` "Book"
    it "can return a boolean" $ do
      Solution.bindFirst belowLimit 18 17 `shouldBe` True
      Solution.bindFirst belowLimit 18 18 `shouldBe` False
    it "allows different argument types" $ do
      let readyLabel = Solution.bindFirst statusLabel "ready"
      readyLabel True `shouldBe` "ready"
      readyLabel False `shouldBe` "off"
    it "can return a pair" $ do
      Solution.bindFirst makeEntry 7 "Room" `shouldBe` (7, "Room")
