module Imp.Backend.Cuda.grid-to-cuda where

import Base.Nat.show as Nat
open import Base.String.append
open import Base.String.String
open import Base.String.join
open import Base.Nat.Nat
open import Base.Nat.add
open import Imp.Eval.Config.Grid.Grid
open import Imp.Expr.Expr
open import Imp.Stmt.Stmt

private
  module U64 where
    open import Base.U64.U64
    open import Base.U64.to-nat as U64

    show : U64 -> String
    show n = Nat.show (U64.to-nat n)

grid-to-cuda : Grid -> String
grid-to-cuda (MkGrid global shared blocks threads code) =
  "
    #include <stdint.h>
    #include <stdio.h>

    #define GLOBAL_SIZE " ++ (Nat.show global)  ++ "
    #define SHARED_SIZE " ++ (Nat.show shared)  ++ "
    #define NUM_BLOCKS  " ++ (Nat.show blocks)  ++ "
    #define NUM_THREADS " ++ (Nat.show threads) ++ "

    typedef uint64_t u64;

    __device__ u64 GLOBAL[GLOBAL_SIZE];

    __device__ inline u64 TID() {
      return threadIdx.x;
    }

    __device__ inline u64 BID() {
      return blockIdx.x;
    }

    __device__ inline u64 GID() {
      return TID() + BID() * blockDim.x;
    }

    __global__ void grid() {
      __label__ RETURN;
      u64 __ret__ = 0;

      #if SHARED_SIZE
      __shared__ u64 SHARED[SHARED_SIZE];
      #endif\n\n" ++
      (to-kernel 3 code) ++ "

      RETURN: 0;
    }

    #define cudaCheckError(ans) { cudaAssert((ans), __FILE__, __LINE__); }
    inline void cudaAssert(cudaError_t code, const char *file, int line, bool abort=true) {
      if (code != cudaSuccess) {
        fprintf(stderr, \"CUDA Error: %s %s %d\\n\", cudaGetErrorString(code), file, line);
        if (abort) exit(code);
      }
    }

    int main() {
      grid<<<NUM_BLOCKS, NUM_THREADS, SHARED_SIZE>>>();

      // dumps global memory
      u64 *global = (u64*) calloc(GLOBAL_SIZE, sizeof(u64));
      cudaMemcpyFromSymbol(global, GLOBAL, sizeof(u64) * GLOBAL_SIZE);
      cudaCheckError(cudaGetLastError());

      for (u64 i = 0; i < GLOBAL_SIZE; i++) {
        printf(\"%04lx | %04lx\\n\", i, global[i]);
      }
    }
  " where

  indent : Nat → String
  indent Zero     = ""
  indent (Succ n) = "  " ++ (indent n)

  expr-to-cuda : Expr -> String
  expr-to-cuda (Var v) = v
  expr-to-cuda (Num n) = U64.show n

  expr-to-cuda Tid = "TID()"
  expr-to-cuda Bid = "BID()"
  expr-to-cuda Gid = "GID()"

  expr-to-cuda (Add a b) = (expr-to-cuda a) ++  " + " ++ (expr-to-cuda b)
  expr-to-cuda (Sub a b) = (expr-to-cuda a) ++  " - " ++ (expr-to-cuda b)
  expr-to-cuda (Mul a b) = (expr-to-cuda a) ++  " * " ++ (expr-to-cuda b)
  expr-to-cuda (Div a b) = (expr-to-cuda a) ++  " / " ++ (expr-to-cuda b)
  expr-to-cuda (Mod a b) = (expr-to-cuda a) ++  " % " ++ (expr-to-cuda b)
  expr-to-cuda (And a b) = (expr-to-cuda a) ++ " && " ++ (expr-to-cuda b)
  expr-to-cuda (Or  a b) = (expr-to-cuda a) ++ " || " ++ (expr-to-cuda b)
  expr-to-cuda (Not a)   = "~" ++ (expr-to-cuda a)

  expr-to-cuda (Eq  a b) = (expr-to-cuda a) ++ " == " ++ (expr-to-cuda b)
  expr-to-cuda (Neq a b) = (expr-to-cuda a) ++ " != " ++ (expr-to-cuda b)
  expr-to-cuda (Lt  a b) = (expr-to-cuda a) ++  " < " ++ (expr-to-cuda b)
  expr-to-cuda (Le  a b) = (expr-to-cuda a) ++ " <= " ++ (expr-to-cuda b)
  expr-to-cuda (Gt  a b) = (expr-to-cuda a) ++  " > " ++ (expr-to-cuda b)
  expr-to-cuda (Ge  a b) = (expr-to-cuda a) ++ " >= " ++ (expr-to-cuda b)

  expr-to-cuda (Cond e a b) = (expr-to-cuda e) ++ " ? " ++ (expr-to-cuda a) ++ " : " ++ (expr-to-cuda b)

  expr-to-cuda (SGet e) = "SHARED[" ++ (expr-to-cuda e) ++ "]"
  expr-to-cuda (GGet e) = "GLOBAL[" ++ (expr-to-cuda e) ++ "]"

  expr-to-cuda (SAdd v i) = "atomicAdd_block(SHARED[" ++ (expr-to-cuda v) ++ "], " ++ (expr-to-cuda i) ++ ")"
  expr-to-cuda (GAdd v i) = "atomicAdd_device(GLOBAL[" ++ (expr-to-cuda v) ++ "], " ++ (expr-to-cuda i) ++ ")"
  expr-to-cuda (SExc v e) = "atomicExc_block(SHARED[" ++ (expr-to-cuda v) ++ "], " ++ (expr-to-cuda e) ++ ")"
  expr-to-cuda (GExc v e) = "atomicExc_device(GLOBAL[" ++ (expr-to-cuda v) ++ "], " ++ (expr-to-cuda e) ++ ")"

  to-kernel : (indent : Nat) -> Stmt -> String
  to-kernel i (Locals vs) = (indent i) ++ "u64 " ++ (join ", " vs) ++ ";"
  to-kernel i (LSet v e) = (indent i) ++ v ++ " = " ++ (expr-to-cuda e) ++ ";"
  to-kernel i (SSet n e) = (indent i) ++ "SHARED[" ++ (expr-to-cuda n) ++ "] = " ++ (expr-to-cuda e) ++ ";"
  to-kernel i (GSet n e) = (indent i) ++ "GLOBAL[" ++ (expr-to-cuda n) ++ "] = " ++ (expr-to-cuda e) ++ ";"
  to-kernel i (If e a b) =
    (indent i) ++ "if (" ++ (expr-to-cuda e) ++ ") {\n" ++
      (to-kernel (i + 1) a) ++ "\n" ++
    (indent i) ++ "} else {\n" ++
      (to-kernel (i + 1) b) ++ "\n" ++
    (indent i) ++ "}"
  to-kernel i (While e b) =
    (indent i) ++ "while (" ++ (expr-to-cuda e) ++ ") {\n" ++
      (to-kernel (i + 1) b) ++ "\n" ++
    (indent i) ++ "}"
  to-kernel i (Ret e) =
    (indent i) ++ "__ret__ = " ++ (expr-to-cuda e) ++ ";\n" ++
    (indent i) ++ "goto RETURN;"
  to-kernel i (Cont)  = (indent i) ++ "continue;"
  to-kernel i (Break) = (indent i) ++ "break;"
  to-kernel i (Ignore e) = (indent i) ++ (expr-to-cuda e) ++ ";"
  to-kernel i (Then a b) = (to-kernel i a) ++ "\n" ++ (to-kernel i b)
  to-kernel i (Call v b) =
    (indent i) ++ v ++ " = ({\n" ++
      (indent (i + 1)) ++ "__label__ RETURN;\n" ++
      (indent (i + 1)) ++ "u64 __ret__ = 0;\n" ++
      (to-kernel (i + 1) b) ++ "\n" ++
      (indent (i + 1)) ++ "RETURN: __ret__;\n" ++
    (indent i ) ++ "});"
