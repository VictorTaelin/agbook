module Base.IO.mkdir where

open import Base.IO.Type
open import Base.String.Type
open import Base.Unit.Type

postulate
  mkdir : String → IO Unit

{-# FOREIGN GHC import qualified System.Directory #-}
{-# FOREIGN GHC import qualified Data.Text as T #-}

{-# COMPILE GHC mkdir = System.Directory.createDirectory . T.unpack #-}

{-# COMPILE JS mkdir = function(path) { 
  return function() { 
    return new Promise(function(resolve, reject) { 
      require('fs').mkdir(path, { recursive: true }, function(err) { 
        if (err && err.code !== 'EEXIST') {
          reject(err);
        } else {
          resolve({});
        }
      }); 
    }); 
  }; 
} #-}