module Base.IO.append-file where

open import Base.String.Type
open import Base.IO.Type
open import Base.Unit.Type

postulate
  append-file  : String → String → IO Unit

{-# FOREIGN GHC import qualified Data.Text    as T   #-}
{-# FOREIGN GHC import qualified Data.Text.IO as TIO #-}

{-# COMPILE GHC append-file = TIO.appendFile . T.unpack #-}

{-# COMPILE JS append-file = function(path) { 
  return function(content) { 
    return function() { 
      return new Promise(function(resolve, reject) { 
        require('fs').appendFile(path, content, function(err) { 
          if (err) reject(err); 
          else resolve({}); 
        }); 
      }); 
    }; 
  }; 
} #-}