
module Data.IO.Main where

open import Data.IO.Type
open import Data.IO.bind
open import Data.IO.pure
open import Data.IO.seq
open import Data.IO.print
open import Data.String.Type
open import Data.Unit.Type
open import Data.IO.get-line
open import Data.IO.read-file
open import Data.IO.write-file
open import Data.IO.append-file

-- Everything is assumed to be finite
-- Simple lazy IO
-- Note that the functions below produce commands which, when
-- executed, may raise exceptions.

main : IO Unit
main = do
  print "Enter a filename to read:"
  filename ← get-line
  content ← read-file filename
  print "File content:"
  print content
  print "Enter a filename to write:"
  outFilename ← get-line
  write-file outFilename "Hello, this is a test file."
  print "File written successfully."
  append-file outFilename "\nThis line is appended."
  print "File appended successfully."

