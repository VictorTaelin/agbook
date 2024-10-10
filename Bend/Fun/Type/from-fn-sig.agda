module Bend.Fun.Type.from-fn-sig where

open import Base.List.List
open import Base.List.foldr
open import Bend.Fun.Type.Type

from-fn-sig : List Type → Type → Type
from-fn-sig args ret = foldr Arr ret args

