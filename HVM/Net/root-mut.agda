
module HVM.Net.root-mut where

open import Base.IO.IO
open import Base.IO.Monad.bind
open import Base.IO.Monad.pure
open import HVM.Net.Net
open import HVM.Term.Term

root-mut : (Term → Term) → Net → IO Net
root-mut f net = pure (record net { root = f (Net.root net) })
