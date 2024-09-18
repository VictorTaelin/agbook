module Base.IO.is-file where

open import Base.IO.Type
open import Base.String.Type
open import Base.Bool.Type

postulate
  is-file : String → IO Bool

{-# FOREIGN GHC import qualified System.Directory #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC is-file = System.Directory.doesFileExist . T.unpack #-}

{-# COMPILE JS is-file = function(path) { 
  return function() { 
    return new Promise(function(resolve) { 
      require('fs').stat(path, function(err, stats) { 
        if (err) resolve(false); 
        else resolve(stats.isFile()); 
        }); 
      }); 
    }; 
  } #-}