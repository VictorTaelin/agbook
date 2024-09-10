module Data.Bits.decode-char-utf8 where

open import Data.Char.Type
import Data.Char.from-nat as C
open import Data.Nat.Type
open import Data.Bits.Type
import Data.Bits.to-nat as B
import Data.Bits.from-nat as B
open import Data.Bits.and
open import Data.Bits.or
open import Data.Bits.lshift
open import Data.Bits.eq
open import Data.Bits.lte
open import Data.List.Type
open import Data.List.singleton
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Pair.Type

utf8-replacement-character : Char
utf8-replacement-character = C.from-nat 0xfffd

maskx : Bits
maskx = B.from-nat 0b00111111

mask2 : Bits
mask2 = B.from-nat 0b00011111

mask3 : Bits
mask3 = B.from-nat 0b00001111

mask4 : Bits
mask4 = B.from-nat 0b00000111

conv : Bits → Char
conv b = C.from-nat (B.to-nat b)

decode-char-utf8 : List Bits → Pair Char (List Bits)
decode-char-utf8 [] = (C.from-nat 0 , [])

decode-char-utf8 (a :: []) = if a <= (B.from-nat 0x7f)
  then (conv a , [])
  else (utf8-replacement-character , [])

decode-char-utf8 (a :: b :: []) with a <= (B.from-nat 0x7f)
... | True = (conv a , [ b ])
... | False with (a && (B.from-nat 0xe0)) == (B.from-nat 0xc0)
...   | True =
        let res = ((a && mask2) << 6) || (b && maskx)
        in  (conv res , [])
...   | False = (utf8-replacement-character , [])

decode-char-utf8 (a :: b :: c :: []) with a <= (B.from-nat 0x7f)
... | True = (conv a , b :: c :: [])
... | False with (a && (B.from-nat 0xe0)) == (B.from-nat 0xc0)
...   | True =
        let res = ((a && mask2) << 6) || (b && maskx)
        in  (conv res , [ c ])
...   | False with (a && (B.from-nat 0xf0)) == (B.from-nat 0xe0)
...      | True =
           let res = ((a && mask3) << 12) || (((b && maskx) << 6) || (c && maskx))
           in  (conv res , [])
...      | False = (utf8-replacement-character , [])

decode-char-utf8 (a :: b :: c :: d :: rest) with a <= (B.from-nat 0x7f)
... | True = (conv a , b :: c :: d :: rest)
... | False with (a && (B.from-nat 0xe0)) == (B.from-nat 0xc0)
...   | True =
        let res = ((a && mask2) << 6) || (b && maskx)
        in  (conv res , c :: d :: rest)
...   | False with (a && (B.from-nat 0xf0)) == (B.from-nat 0xe0)
...     | True =
          let res = ((a && mask3) << 12) || (((b && maskx) << 6) || (c && maskx))
          in  (conv res , d :: rest)
...     | False with (a && (B.from-nat 0xf8)) == (B.from-nat 0xf0)
...       | True =
            let res = (((a && mask4) << 18) || (((b && maskx) << 12) || (((c && maskx) << 6) || (d && maskx))))
            in  (conv res , rest)
...       | False = (utf8-replacement-character , [])
