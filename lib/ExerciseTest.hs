module ExerciseTest (captureOutput, withInput) where

import Control.Exception (bracket, evaluate, finally)
import GHC.IO.Handle (hDuplicate, hDuplicateTo)
import System.Directory (removeFile)
import System.IO

withTemporaryHandle :: String -> (Handle -> IO a) -> IO a
withTemporaryHandle prefix action =
  bracket
    (openTempFile "/tmp" prefix)
    (\(path, handle) -> hClose handle `finally` removeFile path)
    (\(_, handle) -> action handle)

withRedirectedHandle :: Handle -> Handle -> IO a -> IO a
withRedirectedHandle source destination action =
  bracket
    (hDuplicate destination)
    (\saved -> hDuplicateTo saved destination `finally` hClose saved)
    (\_ -> hDuplicateTo source destination >> action)

captureOutput :: IO a -> IO (a, String)
captureOutput action =
  withTemporaryHandle "haskell-output" $ \handle -> do
    hFlush stdout
    result <- withRedirectedHandle handle stdout (action `finally` hFlush stdout)
    hSeek handle AbsoluteSeek 0
    output <- hGetContents handle
    _ <- evaluate (length output)
    pure (result, output)

withInput :: String -> IO a -> IO a
withInput input action =
  withTemporaryHandle "haskell-input" $ \handle -> do
    hPutStr handle input
    hSeek handle AbsoluteSeek 0
    withRedirectedHandle handle stdin action
