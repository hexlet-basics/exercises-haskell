module Main where

import Test.Hspec

import qualified Solution

main :: IO ()
main = hspec $ do
  describe "countLeaves" $ do
    it "counts a single leaf rather than its label" $ do
      Solution.countLeaves (Solution.Item 500) `shouldBe` 1
    it "counts a zero-labelled leaf" $ do
      Solution.countLeaves (Solution.Item 0) `shouldBe` 1
    it "counts a negative-labelled leaf" $ do
      Solution.countLeaves (Solution.Item (-1000)) `shouldBe` 1
    it "does not count a bundle as an extra leaf" $ do
      Solution.countLeaves (Solution.Bundle (Solution.Item 10) (Solution.Item 20))
        `shouldBe` 2
    it "visits a nested right child" $ do
      Solution.countLeaves
        (Solution.Bundle
          (Solution.Item 10)
          (Solution.Bundle (Solution.Item 20) (Solution.Item 30)))
        `shouldBe` 3
    it "visits a nested left child" $ do
      Solution.countLeaves
        (Solution.Bundle
          (Solution.Bundle (Solution.Item 10) (Solution.Item 20))
          (Solution.Item 30))
        `shouldBe` 3
    it "counts leaves from both compound children" $ do
      Solution.countLeaves
        (Solution.Bundle
          (Solution.Bundle (Solution.Item 1) (Solution.Item 2))
          (Solution.Bundle (Solution.Item 3) (Solution.Item 4)))
        `shouldBe` 4
    it "counts repeated leaf values as separate occurrences" $ do
      let item = Solution.Item 7
      Solution.countLeaves (Solution.Bundle item item) `shouldBe` 2
    it "handles a tree with the maximum permitted number of leaves" $ do
      let tree = foldr (\_ rest -> Solution.Bundle (Solution.Item 0) rest)
                       (Solution.Item 0)
                       ([1 .. 99] :: [Integer])
      Solution.countLeaves tree `shouldBe` 100
