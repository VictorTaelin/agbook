module Base.IO.exists where

open import Base.IO.Type
open import Base.IO.bind
open import Base.IO.pure
open import Base.IO.is-directory
open import Base.IO.is-file
open import Base.String.Type
open import Base.Bool.Type
open import Base.Bool.if

-- Checks if a file or directory exists at the given path.
-- - path: The path to check.
-- = True if either a file or directory exists at the given path, False otherwise.
exists : String → IO Bool
exists path = is-file path >>= λ file-exists →
              if file-exists
              then pure True
              else is-directory path

{-# COMPILE JS exists = function(path) { 
  return function() { 
    return new Promise(function(resolve) { 
      require('fs').access(path, function(err) { 
        resolve(!err); 
      });
     }); 
  }; 
} #-}