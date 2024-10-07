
module HVM.Net.root-set where

open import HVM.Net.Net
open import HVM.Term.Term

root-set : Term → Net → Net
root-set new-root net = record net { root = new-root }
