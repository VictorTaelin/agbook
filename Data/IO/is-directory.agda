module Data.IO.is-directory where

open import Data.IO.Type
open import Data.String.Type
open import Data.Bool.Type

postulate
  is-directory : String → IO Bool

{-# FOREIGN GHC import qualified System.Directory #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC is-directory = System.Directory.doesDirectoryExist . T.unpack #-}

{-# COMPILE JS is-directory = function(path) { 
  return function() { 
    return new Promise(function(resolve) { 
      require('fs').stat(path, function(err, stats) { 
        if (err) resolve(false); 
        else resolve(stats.isDirectory()); 
      }); 
    });
  }; 
} #-}
