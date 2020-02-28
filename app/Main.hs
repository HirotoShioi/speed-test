module Main where

import RIO
import Test.QuickCheck
import qualified Data.Text as T
import Control.Monad
import qualified Data.Text.IO as T
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    randomTexts <- generate genTexts
    case args of
      ["--rio"] -> runSimpleApp $ do
        mapM_ (logInfo . display) randomTexts
      _ -> do 
        mapM_ T.putStrLn randomTexts

-- | Generate random @[Text]@
genTexts :: Gen [Text]
genTexts = do
    let word = T.pack <$> replicateM 150 (elements $ ['a'..'z'] <> ['A' .. 'Z'] <> [' '])
    replicateM 20000 word