module Data.IO.write-file where

open import Data.IO.Type
open import Data.String.Type
open import Data.Unit.Type

postulate
  write-file   : String → String → IO Unit


{-# FOREIGN GHC import qualified Data.Text    as T   #-}
{-# FOREIGN GHC import qualified Data.Text.IO as TIO    #-}
{-# FOREIGN GHC import qualified System.IO              #-}

{-# COMPILE GHC getLine     = TIO.getLine               #-}
{-# COMPILE GHC write-file  = TIO.writeFile . T.unpack  #-}

{-# COMPILE JS write-file = function(path) { 
  return function(content) { 
    return function() { 
      return new Promise(function(resolve, reject) { 
        require('fs').writeFile(path, content, function(err) { 
          if (err) reject(err); 
          else resolve({}); 
        }); 
      }); 
    }; 
  }; 
} #-}