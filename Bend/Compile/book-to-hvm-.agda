module Bend.Compile.book-to-hvm- where

open import Base.Equal.Equal
open import Base.Bool.Bool
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.Result.Result
open import Base.String.String
open import Bend.Fun.Book.Book
open import Bend.Fun.Book.add-fn-def
import Bend.Fun.Book.new as Book
open import Bend.Fun.Term.Term using () renaming (Term to BTerm)
open import Bend.Fun.Type.Type using (Type)
open import Bend.Source.Source
open import Bend.Source.SourceKind
open import HVM.Mode.Mode
open import HVM.Net.Net
open import HVM.Redex.Redex
open import HVM.Term.Term using () renaming (Term to H)
open import Bend.Compile.book-to-hvm
open import Bend.nat-to-name renaming (nat-to-name to nam)
open import Bend.Fun.dsl
import Bend.Fun.FnDef.FnDef as Def'
import Bend.Fun.Rule.Rule as Rule'

private
  open module Def = Def' BTerm
  open module Rule = Rule' BTerm

compile-term : BTerm → Result (List (Pair String (Net NAMED))) String
compile-term term = do
  let main = MkFnDef "main" Type.Any False ((MkRule [] term) :: []) (MkSource None None Generated)
  let book = add-fn-def Book.new main
  book-to-hvm book

make-result : List (Redex NAMED) → (H NAMED) → Result (List (Pair String (Net NAMED))) String
make-result rbag root = Done (("main" , MkNet root rbag) :: [])

-- Test compilation of the id function
-- @x x  =>  (0 0)
test-id :
  let term = λ' (p' "x") (v' "x") in
  (compile-term term)
  ≡
  let root = H.Con (H.Var (nam 0)) (H.Var (nam 0)) in
  make-result [] root
test-id = refl

-- Test compilation of the self-app function
-- @{x1 x2} (x1 x2)  =>  ({(0 1) 0} 1)
test-self-app :
  let term = λ' (p'dup (p' "x1" :: p' "x2" :: [])) (v' "x1" $ v' "x2") in
  (compile-term term)
  ≡
  let root = H.Con (H.Dup (H.Con (H.Var (nam 0)) (H.Var (nam 1))) (H.Var (nam 0))) (H.Var (nam 1)) in
  make-result [] root
test-self-app = refl

-- Test compilation of let bindings
-- let a = @x x; a  =>  (0 0)
-- TODO: Since we produce wires on 'let', this becomes '0 & (1 1) ~ 0'
test-let-var :
  let term = let' p' "a" := λ' (p' "x") (v' "x") in' (v' "a") in
  (compile-term term)
  ≡
  let rbag = MkRedex (H.Con (H.Var (nam 1)) (H.Var (nam 1))) (H.Var (nam 0)) :: [] in
  let root = H.Var (nam 0) in
  make-result rbag root
test-let-var = refl

-- Test compilation of unscoped variables without shadowing normal variables
-- @a (a (@$a $b, @$b $a))  =>  ((((0 1) (1 0)) 2) 2)
test-unscoped-var-no-shadow :
  let term = λ' (p' "a") (v' "a" $ tup (λ' (p'$ "a") (v'$ "b") :: λ' (p'$ "b") (v'$ "a") :: [])) in
  (compile-term term)
  ≡
  let rbag = [] in
  let root = H.Con (H.Con (H.Con (H.Con (H.Var (nam 0)) (H.Var (nam 1))) (H.Con (H.Var (nam 1)) (H.Var (nam 0)))) (H.Var (nam 2))) (H.Var (nam 2)) in
  make-result rbag root
test-unscoped-var-no-shadow = refl

-- Test compilation of let bindings with nested patterns
-- let ({x1 *}, *) = (*, *); x1
-- =>  a & * ~ ({a *} *)
-- TODO: '0 & (* *) ~ 1 & ({0 *} *) ~ 1' with wires
test-nested-let-pat :
  let term = let' (p'tup ((p'dup (p' "x1" :: p'* :: [])) :: p'* :: [])) := (tup (*' :: *' :: [])) in' v' "x1" in
  (compile-term term)
  ≡
  let rbag = MkRedex (H.Con H.Era H.Era) (H.Var (nam 1)) :: MkRedex (H.Con (H.Dup (H.Var (nam 0)) H.Era) H.Era) (H.Var (nam 1)) :: [] in
  let root = H.Var (nam 0) in
  make-result rbag root
test-nested-let-pat = refl

-- @x let a = let b = x; b; a
-- => (0 0)
-- TODO: '(0 1) & 1 ~ 0' with wires
test-nested-let-simple :
  let term = λ' (p' "x") (let' (p' "a") := (let' (p' "b") := (v' "x") in' (v' "b")) in' (v' "a")) in
  (compile-term term)
  ≡
  let rbag = MkRedex (H.Var (nam 1)) (H.Var (nam 0)) :: [] in
  let root = H.Con (H.Var (nam 0)) (H.Var (nam 1)) in
  make-result rbag root
test-nested-let-simple = refl

-- Test compilation of a more complex nested let
-- @x let a = @b let {b1 *} = (x b); b1; @* a
-- => ((0 {1 *}) (* (0 1)))
-- TODO: '((0 1) (* 2)) & {3 *} ~ 1 & 2 ~ (0 3)' with wires
test-complex-nested-let :
  let term = λ' (p' "x")
               (let' (p' "a") := (λ' (p' "b")
                  (let' (p'dup (p' "b1" :: p'* :: []))
                      := (v' "x" $ v' "b")
                    in' v' "b1"))
                in' (λ' p'* (v' "a")))
  in
  (compile-term term)
  ≡
  let root = (H.Con (H.Con (H.Var (nam 0)) (H.Var (nam 1))) (H.Con H.Era (H.Var (nam 2))))
      rbag = MkRedex (H.Dup (H.Var (nam 3)) H.Era) (H.Var (nam 1)) ::
             MkRedex (H.Var (nam 2)) (H.Con (H.Var (nam 0)) (H.Var (nam 3))) :: []
  in
  make-result rbag root
test-complex-nested-let = refl
