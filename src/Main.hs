-- {{{ begin_fold
-- script
-- #!/usr/bin/env runhaskell -i/Users/cat/myfile/bitbucket/haskelllib
-- {-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE DuplicateRecordFields #-}
-- {-# LANGUAGE CPP #-} 
-- import Turtle
-- echo "turtle"

{-# LANGUAGE MultiWayIf        #-}
{-# LANGUAGE QuasiQuotes       #-} -- support raw string [r|<p>dog</p> |]
import Text.RawString.QQ       -- Need QuasiQuotes too 

-- import Data.Set   -- collide with Data.List 
import Control.Monad
import Data.Char
import Data.Typeable (typeOf) -- runtime type checker, typeOf "k"
import qualified Data.List as L
import Data.List.Split
import Data.Time
import Data.Time.Clock.POSIX
import System.Directory
import System.Environment
import System.Exit
import System.FilePath.Posix
import System.IO
import System.Posix.Files
import System.Posix.Unistd
import System.Process
import Text.Read
import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import Text.Regex.Posix
import Data.IORef 
import Control.Monad (unless, when)
import Control.Concurrent 
import qualified System.Console.Pretty as SCP

import qualified Text.Regex.TDFA as TD

import AronModule 

main = do 
        ls <- getArgs
        case len ls of
           v | v == 2 -> do
                 let s1 = head ls
                 let s2 = last ls
                 let lt = prefix s2
                 let b = s1 `elem` lt
                 if b then do
                   putStr "1"
                   else putStr "0"
             | otherwise -> do
                 pt c "\tNeed Two argument"
                 pt c "\tisPrefix \"abc\" \"abcd\""
                 pt c "\t----------------------"
                 pt c "\tisPrefix abc abcd => 1"
                 pt c "\tisPrefix k   abcd => 0"
     
	where
      pt n s = (putStrLn . colorfgStr n) s
      c = 119
