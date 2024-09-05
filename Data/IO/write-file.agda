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

{-# FOREIGN JS
import * as fs from "fs";
import * as path from "path";
#-}

{-# COMPILE JS write-file = function(filename) { return function(content) { return function(cb) {
  fs.writeFile(path.normalize(filename), content, function(err) {
    if (err) {
      throw err;
    }
    cb();
  });
}; }; }
#-}
