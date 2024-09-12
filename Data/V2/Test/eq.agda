module Data.V2.Test.eq where

open import Data.V2.Type
open import Data.V2.eq
open import Data.Float.Type
open import Data.Float.eq
open import Data.Bool.Type
open import Data.Equal.Type

-- Eq tests

_ : ((MkV2 1.0 2.0) == (MkV2 1.0 3.0)) === False
_ = refl

_ : ((MkV2 1.0 2.0) == (MkV2 2.0 2.0)) === False
_ = refl

_ : ((MkV2 1.0 2.0) == (MkV2 1.0 2.0)) === True
_ = refl

_ : ((MkV2 1.0 2.0) != (MkV2 2.0 1.0)) === True
_ = refl
