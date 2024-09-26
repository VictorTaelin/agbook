# Style guide for the Agda Monobook

These are still a work in progress and not complete. Many are more like goals, so you might find some parts of the library that don't fully follow them yet. The plan is to eventually Koder automate most of this.

## File Strucutre
- The standard library follows the structure outlined below:

1. Module declaration.
2. Imports (alphabetically ordered).
3. Primitive declarations.
4. Helper functions.
5. Comments.
6. Function definitions.
7. Infix declarations.

example:

```agda
module Base.Float.add where

open import Base.Float.Type

primitive primFloatPlus : Float ->  Float ->  Float

-- Addition of floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The sum of x and y.
add : Float -> Float -> Float
add = primFloatPlus

-- The infix version of add.
_+_ : Float -> Float -> Float
_+_ = add

infixl 6 _+_
```

### Indentation

- The contents of a top-level module should have zero indentation.
- Every subsequent nested scope should then be indented by an additional **two spaces**.

### Primitives and Postules

- For a single declaration, it should be written on one line:

```agda
postulate IO : Set -> Set
```

- For multiple declarations, use two-space indentation:

```agda
postulate
  runClient : String -> Int -> String -> (WSConnection -> IO Unit) -> IO Unit
  runSecureClient : String -> Int -> String -> (WSConnection -> IO Unit) -> IO Unit
  receiveData : WSConnection -> IO String
```

### Function arguments

- Align arguments and patterns in function definitions at the start of each one rather than inside the arument.

```hs
pred : Bits ->  Bits
pred E      = E
pred (O E)  = E
pred (O bs) = I (pred bs)
pred (I bs) = O bs
```

rather than:

```hs
pred : Bits ->  Bits
pred         E  = E
pred (O      E) = E
pred (O     bs) = I (pred bs)
pred (I     bs) = O bs
```

- **Note** that for functions with many arguments, alignment is not necessary. **Use good judgment** for readability.
- Avoid unnecessary parentheses. Only use them when they are required for precedence or clarity.

### Imports

- Use qualified import statements to avoid name clashes. **Note** that the `qualified` keyword is not used in Agda.

```agda
import Base.Float.div as Float
```

usage:

```
div (MkV2 x1 y1) (MkV2 x2 y2) = MkV2 (x1 Float./ x2) (y1 Float./ y2)
```


- Each file should export only one definition (except for infix operators).
- Each folder in the project should contain an `ALL.agda` file. The purpose of this file is to:
  1. Import and re-export all modules in the folder.
  2. We should use the imports from `All.agda` only when we are outside the `Base` directory.

Example:

```agda
module Base.Example.ALL where

open import Base.Example.Type public
open import Base.Example.function1 public
open import Base.Example.function2 public

-- Re-export the main type and its constructors
open Base.Example.Type public using (ExampleType; Constructor1; Constructor2)
```

This structure allows other modules to import all functionality from a folder by simply importing its ALL module:

```agda
open import Base.Example.ALL
```

### Comments
- Start comments with a capital letter and end with a period.
- Use complete sentences for explanatory comments.
- Use numerical abbreviations for simple argument descriptions (e.g., 1st, 2nd, 3rd, 4th...).
- Use `=` to comment on what the function will return.
- Comments should be placed above a term rather then on the same line.

Example:

```agda
-- Multiplies a V2 vector by a scalar.
-- - 1st: V2 vector to be multiplied.
-- - 2nd: Scalar (F64) to multiply by.
-- = A new V2 vector with both components multiplied by the scalar.
mul-scalar : V2 -> F64 -> V2
mul-scalar (MkV2 x y) s = MkV2 (x F64.* s) (y F64.* s)

-- Infix operator for multiplying a V2 vector by a scalar.
_*_ : V2 -> F64 -> V2
_*_ = mul-scalar

infixl 7 _*_
```

##  Naming Conventions

- Variables and Functions: Use kebab-case (e.g., "add-nat").
- For natural numbers, use native syntax (e.g., `3`) instead of `Succ(Succ(Succ Zero))`.
- Avoid apostrophes in names.
- Helper functions should have the prefix of the filename followed by "-go".

### Types

- Use CamelCase (e.g., NaturalNumber, BinaryTree).
- For types under `Base/`, use naming consistent with Agda builtins (e.g., `Zero` and `Succ`).

 ```agda
  data Nat : Set where
   Zero : Nat
   Succ : Nat -> Nat
  ```
- If the type of a term does not fit on one line then the subsequent lines of the type should all be aligned with the first character of the first line of type, e.g.
  ```agda
    merge : ∀ {A B C : Set} -> 
      (a : A -> C) -> 
      (b : B -> C) -> 
      (ab : A -> B -> C) -> 
      BinTree A -> 
      BinTree B ->  
      BinTree C
  ```
 ### Unicode and Operators

- Use Unicode for ∀, λ, ≡, and Σ.
- Use standard arrow (->) instead of Unicode arrow.
- Minimize operator use, except for common ones like arithmetic and bitwise operators.

   Arithmetic: \_+\_ (add), \_-\_ (sub), \_\*\_ (mul), \_/\_ (div), \_%\_ (mod), \_\*\*\_ (exp).
   Bitwise: \_&\_ (and), \_|\_ (or), \_^_\ (xor), \_~\_ (not), \_<<\_ (left shift), \_>>\_ (right shift).

## Function Style

- Align `where` clauses with the function definition.
- Prefer `do` notation with `let` over `let...in` and `where`.
- Use `with` for pattern matching instead of `case of` or `if`.
- If possible, replace a `record` with a sequence of `let` statements.


### Large Functions

- When a function is very large, especially in cases where different branches can become confusing, it is helpful to **leave a blank line between cases**. This improves readability and visually separates the different conditions.

- Continue using `do let` to maintain the style consistency.

Example:

```agda
swap : ∀ {A : Set} -> BitMap A -> Bits -> A -> Pair (BitMap A) (Maybe A)
swap (Node val l r) E v = do
  let n = (Node (Some v) l r)
  n , val

swap (Node val l r) (O k) v = do
  let (new-l , old-v) = swap l k v
  (Node val new-l r) , old-v

swap (Node val l r) (I k) v = do
  let (new-r , old-v) = swap r k v
  (Node val l new-r) , old-v

swap Leaf E v = do
  let n = (Node (Some v) Leaf Leaf)
  n , None

swap Leaf (O k) v = do
  let (new-l , old-v) = swap Leaf k v
  (Node None new-l Leaf) , old-v

swap Leaf (I k) v = do
  let (new-r , old-v) = swap Leaf k v
  (Node None Leaf new-r) , old-v
```

This structure enhances readability and understanding of the different cases while maintaining the function's style consistency.


### Layout of helper functions

- Define helper functions at the top of the file or in separate files for complex ones.
- If a helper function is very large or complex, it should be placed in a separate file.

instead of:

```agda
module Base.String.hash where

-- imports here

hash : String ->  Bits
hash str =
  let words = (map to-nat (to-list str)) in
  to-bits (fxhash words)

  where

  rotate-left : Nat ->  Nat ->  Nat ->  Nat
  rotate-left n shift width =
    let lower = div n (2 exp (width - shift)) in
    let upper = (n * (2 exp shift)) % (2 exp width) in
    (upper + lower)

  fxhash-step : Nat ->  Nat ->  Nat
  fxhash-step hash char =
    let seed = 0x517cc1b727220a95 in
    let hash = rotate-left hash 5 64 in
    let hash = hash xor char in
    let hash = hash * seed in
    let hash = hash % (2 exp 64) in
    hash

  fxhash : List Nat ->  Nat
  fxhash ns = foldl fxhash-step 0 ns
```

should be.

- file: Base/String/Hash.hs

```hs
  module Base.String.Hash where

-- imports here

-- Main hash function
hash : String ->  Bits
hash str =
  let words = (map to-nat (to-list str)) in
  to-bits (fxhash words)
```
you should write this way:

- file: Base/String/HashRotateLeft.hs

```agda
module Base.String.HashRotateLeft where

-- imports here

-- Helper function for left rotation
hash-rotate-left : Nat ->  Nat ->  Nat ->  Nat
hash-rotate-left n shift width =
  let lower = div n (2 exp (width - shift)) in
  let upper = (n * (2 exp shift)) % (2 exp width) in
  (upper + lower)
```

- file: Base/String/FxHash.hs

```agda
module Base.String.FxHash where

-- imports here

-- Helper function for a fxhash step
fxhash-step : Nat ->  Nat ->  Nat
fxhash-step hash char =
  let seed = 0x517cc1b727220a95 in
  let hash = hash-rotate-left hash 5 64 in
  let hash = hash xor char in
  let hash = hash * seed in
  let hash = hash % (2 exp 64) in
  hash

-- Main fxhash function
fxhash : List Nat ->  Nat
fxhash ns = foldl fxhash-step 0 ns
```

### Layout of With

* The `with` syntax is preferred over the use of `case` from the `Function`
  module. The `|` should not be aligned with the `with` statement, i.e.
  ```agda
  filter p (x ∷ xs) with p x
  ... | true  = x ∷ filter p xs
  ... | false = filter p xs
  ```
  instead of
  ```agda
  filter p (x ∷ xs) with p x
  ...                  | true  = x ∷ filter p xs
  ...                  | false = filter p xs
  ```


## Layout of Let in

```hs
pad-length : Bits ->  Bits ->  Pair Bits Bits
pad-length a b = do
  let len-a   = length a
  let len-b   = length b
  let trg-len = max len-a len-b
  pad-zeros trg-len a , pad-zeros trg-len b
```
```hs
pad-length : Bits ->  Bits ->  Pair Bits Bits
pad-length a b =
  let len-a = length a
      len-b = length b
      target-len = max len-a len-b
  in pad-zeros target-len a , pad-zeros target-len b
  ```


### Layout of Instance

```
instance
  Show-Int : Show Int
```

```
instance
  OrdInt : Ord Int
```

## Third-Party Libraries and Dependencies (FFI)

- Use a dedicated "FFI" folder with language-specific subfolders.
- Separate complex FFI functions into their own files.

## Tests

- Create a test file for each data file.
- Prefer tests using Eq and `refl` as proofs.
- Place test directories alongside the tested data.

Example directory structure:

```md
.
├── Base
│   ├── Nat
│   │   ├── ALL.agda
│   │   ├── Ord.agda
│   │   ├── Test
│   │   │   ├── eq.agda
│   │   │   ├── rshift.agda
│   │   │   └── show.agda
│   │   ├── Type.agda
│   │   └──add.agda
```

Path Example:

```agda
module Data.Nat.Test.eq where
```

## Code Review Process

- Regularly review code for guideline compliance.
- Be open to adjusting guidelines as the team's experience grows.
