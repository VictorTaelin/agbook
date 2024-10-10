module Base.Maybe.map- where
 
open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Maybe.Maybe
open import Base.Maybe.map
open import Base.Nat.Nat
open import Base.Nat.add

-- Helper function for tests
not : Bool → Bool
not True = False
not False = True

double : Nat → Nat
double n = n + n

-- Test cases
test-map-none : map not None ≡ None
test-map-none = refl

test-map-some-true : map not (Some True) ≡ Some False
test-map-some-true = refl

test-map-some-false : map not (Some False) ≡ Some True
test-map-some-false = refl

test-map-some-nat : map double (Some 3) ≡ Some 6
test-map-some-nat = refl

test-map-composition : {A B C : Set} -> (f : B -> C) -> (g : A -> B) -> (ma : Maybe A) ->
                       map (\x -> f (g x)) ma ≡ map f (map g ma)
test-map-composition f g None = refl
test-map-composition f g (Some x) = refl

