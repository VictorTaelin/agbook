# Agda Style Guide

## Naming Conventions

### Variable Names
- Kebab Case (e.g., variable-name) is the standard style for variables and functions in our Agda code.
- Camel Case (e.g., TypeName) is used exclusively for types.
- Snake Case is not possible due to mixfix notation.
### Function and Variable Names
- Use kebab-case for function and variable names (e.g., "add-nat" instead of "addNat").
- Use basic operation names when possible.
- Use qualified imports to avoid name clashes (e.g., `import qualified Data.Nat as Nat`).
### Type Definitions
- Use CamelCase for type names (e.g., NaturalNumber, BinaryTree).- For types under `Data/`, use naming patterns consistent with Agda builtins.
- Example: Use `Zero` and `Succ` instead of `zero` and `suc` for natural numbers.

## Code Structure

### File Structure
1. Module declaration
2. Imports
3. Comments
4. Function definitions
5. Infix declarations

### Imports
- Order alphabetically and by character.
- Avoid using `renaming`.
- Use `import qualified`.
- Each file should export only one definition (except for infix operators).

### Indentation and Spacing
- Use 2 spaces for indentation.
- Align arguments when reasonable:
  ```agda
  concat : List Bits → Bits 
  concat []             = E 
  concat (E :: xs)      = concat xs
  concat (O bits :: xs) = O (concat (bits :: xs))
  concat (I bits :: xs) = I (concat (bits :: xs))
  ```
- Align patterns in function definitions:
  ```agda
  pred : Bits → Bits
  pred E      = E
  pred (O E)  = E
  pred (O bs) = I (pred bs)
  pred (I bs) = O bs
  ```

### Function Style
- Prefer `do` notation with `let` over `let...in` and `where`.
- Example:
  ```agda
  pad-length a b = do
    let len-a   = length a
    let len-b   = length b
    let trg-len = max len-a len-b
    pad-zeros trg-len a , pad-zeros trg-len b
  ```

## Documentation and Comments

### Function Documentation
Use the following format:
```agda
-- Performs right shift operation on a Bits value.
-- - 1st: The input Bits value.
-- - 2nd: The number of positions to shift right (represented as Nat).
-- = A new Bits value representing the right-shifted result.
rshift : Bits → Nat → Bits
```

### General Comment Guidelines
- Start with a capital letter and end with a period.
- Use complete sentences for explanatory comments.
- Use numerical abbreviations (1st, 2nd, etc.) for simple argument descriptions.

## Unicode and Operators

### Unicode
- Avoid Unicode characters except for:
  - ∀ (for all)
  - λ (lambda)
  - ≡ (equality)
  - Σ (sigma)
- Use standard arrow (→) instead of Unicode arrow.

### Operators
- Minimize the use of operators.
- Exceptions: Common operators like +, -, ++.
- When defining an operator, export both the operator and its corresponding function name.

## Testing

- Place test directories in the same location as the data being tested (e.g., `Data/Map/Test/`).
- Create a test file for each data file (e.g., `Data/Map/Test/hey.agda` for `Data/Map/hey.agda`).
- Prefer tests using Eq and `refl` as proofs.

## Best Practices

- Check all repository files when changing existing code or definitions.
- Run tests and type-checking frequently.
- Add a CI/CD pipeline for automated checks.
- Each file should export only one definition (except for infix operators).

## Review Process

After establishing the guideline, review and adjust all project files to ensure compliance with the new rules.

### Examples of Qualified Imports

Use qualified imports to avoid name clashes and improve code clarity:

```agda
import qualified Data.List as List
import qualified Data.Maybe as Maybe
import qualified Data.Nat as Nat
import qualified Data.Vec as Vec

-- Usage examples:
List.length : List A → Nat
Maybe.fromMaybe : A → Maybe A → A
Nat._+_ : Nat → Nat → Nat
Vec.replicate : ∀ {a} {A : Set a} → (n : Nat) → A → Vec A n
```

This approach allows you to use functions with the same name from different modules without conflicts.
