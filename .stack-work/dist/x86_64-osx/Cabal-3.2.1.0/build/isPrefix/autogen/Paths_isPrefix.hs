{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_isPrefix (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/aaa/myfile/github/haskell-isPrefix/.stack-work/install/x86_64-osx/5050d4c17fb8dca4a9a81d415347c61f6a3a357b577d222bcc8d6b35e01917ad/8.10.3/bin"
libdir     = "/Users/aaa/myfile/github/haskell-isPrefix/.stack-work/install/x86_64-osx/5050d4c17fb8dca4a9a81d415347c61f6a3a357b577d222bcc8d6b35e01917ad/8.10.3/lib/x86_64-osx-ghc-8.10.3/isPrefix-0.1.0.0-3doUmGfE0DiHinXRbNZl8P-isPrefix"
dynlibdir  = "/Users/aaa/myfile/github/haskell-isPrefix/.stack-work/install/x86_64-osx/5050d4c17fb8dca4a9a81d415347c61f6a3a357b577d222bcc8d6b35e01917ad/8.10.3/lib/x86_64-osx-ghc-8.10.3"
datadir    = "/Users/aaa/myfile/github/haskell-isPrefix/.stack-work/install/x86_64-osx/5050d4c17fb8dca4a9a81d415347c61f6a3a357b577d222bcc8d6b35e01917ad/8.10.3/share/x86_64-osx-ghc-8.10.3/isPrefix-0.1.0.0"
libexecdir = "/Users/aaa/myfile/github/haskell-isPrefix/.stack-work/install/x86_64-osx/5050d4c17fb8dca4a9a81d415347c61f6a3a357b577d222bcc8d6b35e01917ad/8.10.3/libexec/x86_64-osx-ghc-8.10.3/isPrefix-0.1.0.0"
sysconfdir = "/Users/aaa/myfile/github/haskell-isPrefix/.stack-work/install/x86_64-osx/5050d4c17fb8dca4a9a81d415347c61f6a3a357b577d222bcc8d6b35e01917ad/8.10.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "isPrefix_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "isPrefix_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "isPrefix_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "isPrefix_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "isPrefix_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "isPrefix_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
