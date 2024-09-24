module Base.IO.is-directory where

open import Base.IO.Type
open import Base.String.Type
open import Base.Bool.Type

postulate
  is-directory : String -> IO Bool

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
