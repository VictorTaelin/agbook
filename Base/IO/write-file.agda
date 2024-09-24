module Base.IO.write-file where

open import Base.IO.Type
open import Base.String.Type
open import Base.Unit.Type

postulate write-file : String -> String -> IO Unit

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
