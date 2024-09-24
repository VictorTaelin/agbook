module Base.BitMap.Test.del where

open import Base.BitMap.Type
open import Base.BitMap.del
open import Base.BitMap.empty
open import Base.BitMap.get
open import Base.BitMap.set
open import Base.Bits.Type
open import Base.Equal.Type
open import Base.Maybe.Type
open import Base.Nat.Type

test-empty : get (del empty E) E === None
test-empty = refl

test-del-root : get (del (set empty E 1) E) E === None
test-del-root = refl

test-del-left : get (del (set empty (O E) 1) (O E)) (O E) === None
test-del-left = refl

test-del-right : get (del (set empty (I E) 1) (O E)) (I E) === Some 1
test-del-right = refl

test-del-left-keep-right : 
  let m = set (set empty (O E) 1) (I E) 2
  in get (del m (O E)) (I E) === Some 2
test-del-left-keep-right = refl

test-del-right-keep-left : 
  let m = set (set empty (O E) 1) (I E) 2
  in get (del m (I E)) (O E) === Some 1
test-del-right-keep-left = refl

test-del-existing : 
  let m = set (set empty (O E) 1) (I E) 2
  in get (del m (I E)) (I E) === None
test-del-existing = refl

test-del-deep-left : 
  let m = set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3
  in get (del m (O (I E))) (O (I E)) === None
test-del-deep-left = refl

test-del-deep-right : 
  let m = set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3
  in get (del m (I (O E))) (O (O E)) === Some 3
test-del-deep-right = refl

test-del-deep-middle : 
  let m = set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3
  in get (del m (O (O E))) (I (O E)) === Some 2
test-del-deep-middle = refl
