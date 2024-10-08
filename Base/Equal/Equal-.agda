module Base.Equal.Equal- where

open import Base.Equal.Equal
open import Base.Nat.Nat

-- Test reflexivity
test-refl-nat : (n : Nat) → n ≡ n
test-refl-nat n = refl

-- Test symmetry (requires defining a symmetry function)
sym : {A : Set} {x y : A} → x ≡ y → y ≡ x
sym refl = refl

test-sym : {A : Set} {x y : A} (p : x ≡ y) → sym (sym p) ≡ p
test-sym refl = refl

-- Test transitivity (requires defining a transitivity function)
trans : {A : Set} {x y z : A} → x ≡ y → y ≡ z → x ≡ z
trans refl refl = refl

test-trans : {A : Set} {x y z : A} (p : x ≡ y) (q : y ≡ z) → trans p (trans q refl) ≡ trans (trans p q) refl
test-trans refl refl = refl

-- Test congruence (requires defining a congruence function)
cong : {A B : Set} (f : A → B) {x y : A} → x ≡ y → f x ≡ f y
cong f refl = refl

test-cong : {A B : Set} (f : A → B) {x : A} → cong f (refl {x = x}) ≡ refl
test-cong f = refl

-- Test substitution (requires defining a substitution function)
subst : {A : Set} {x y : A} (P : A → Set) → x ≡ y → P x → P y
subst P refl px = px

test-subst : {A : Set} {x : A} (P : A → Set) (px : P x) → subst P (refl {x = x}) px ≡ px
test-subst P px = refl

