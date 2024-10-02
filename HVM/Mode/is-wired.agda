module HVM.Mode.is-wired where

open import Base.Bool.Bool
open import HVM.Mode.Mode

is-wired : Mode → Bool
is-wired WIRED = True
is-wired NAMED = False
