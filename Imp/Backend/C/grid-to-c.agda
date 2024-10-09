module Imp.Backend.C.grid-to-c where

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

    show : U64 → String
    show n = Nat.show (U64.to-nat n)

grid-to-c : Grid → String
grid-to-c (MkGrid global shared blocks threads code) =
  "
    #include <stdlib.h>
    #include <stdint.h>
    #include <stdio.h>
    #include <stdatomic.h>
    #include <pthread.h>

    #define GLOBAL_SIZE " ++ (Nat.show global)  ++ "
    #define SHARED_SIZE " ++ (Nat.show shared)  ++ "
    #define NUM_BLOCKS  " ++ (Nat.show blocks)  ++ "
    #define NUM_THREADS " ++ (Nat.show threads) ++ "

    typedef uint64_t u64;
    typedef _Atomic(u64) a64;

    a64 GLOBAL[GLOBAL_SIZE];

    typedef struct ThreadArg {
      u64 tid;     // thread id
      u64 bid;     // block id
      u64 gid;     // global id
      u64 *shared; // shared memory
    } ThreadArg;

    void* thread_func(void *__thread_arg__) {
      __label__ RETURN;
      u64 __ret__ = 0;

      ThreadArg* __thread__ = (ThreadArg*) __thread_arg__;\n\n" ++

      (to-kernel 3 code) ++ "

      RETURN: 0;
    }

    int main() {
      ThreadArg thread_args[NUM_BLOCKS * NUM_THREADS];
      pthread_t threads[NUM_BLOCKS * NUM_THREADS];

      // spawn threads
      for (u64 bid = 0; bid < NUM_BLOCKS; bid++) {
        u64 *shared = (u64 *) calloc(SHARED_SIZE, sizeof(u64));

        for (u64 tid = 0; tid < NUM_THREADS; tid++) {
          u64 gid = tid + bid * NUM_THREADS;

          ThreadArg *thread_arg = &thread_args[tid + bid * NUM_THREADS];
          thread_arg->tid    = tid;
          thread_arg->bid    = bid;
          thread_arg->gid    = gid;
          thread_arg->shared = shared;

          pthread_create(&threads[gid], NULL, thread_func, thread_arg);
        }
      }

      // join threads
      for (u64 i = 0; i < NUM_BLOCKS * NUM_THREADS; ++i) {
        pthread_join(threads[i], NULL);
      }

      // dumps global memory
      for (u64 i = 0; i < GLOBAL_SIZE; i++) {
        printf(\"%04lx | %04lx\\n\", i, atomic_load(&GLOBAL[i]));
      }
    }
  " where

  indent : Nat → String
  indent Zero     = ""
  indent (Succ n) = "  " ++ (indent n)

  wrapped : String → String
  wrapped s = "(" ++ s ++ ")"

  expr-to-c : Expr → String
  expr-to-c (Var v) = v
  expr-to-c (Num n) = U64.show n

  expr-to-c Tid = wrapped "__thread__->tid"
  expr-to-c Bid = wrapped "__thread__->bid"
  expr-to-c Gid = wrapped "__thread__->gid"

  expr-to-c (Add a b) = wrapped ((expr-to-c a) ++  " + " ++ (expr-to-c b))
  expr-to-c (Sub a b) = wrapped ((expr-to-c a) ++  " - " ++ (expr-to-c b))
  expr-to-c (Mul a b) = wrapped ((expr-to-c a) ++  " * " ++ (expr-to-c b))
  expr-to-c (Div a b) = wrapped ((expr-to-c a) ++  " / " ++ (expr-to-c b))
  expr-to-c (Mod a b) = wrapped ((expr-to-c a) ++  " % " ++ (expr-to-c b))
  expr-to-c (And a b) = wrapped ((expr-to-c a) ++ " && " ++ (expr-to-c b))
  expr-to-c (Or  a b) = wrapped ((expr-to-c a) ++ " || " ++ (expr-to-c b))
  expr-to-c (Not a)   = wrapped ("~" ++ (expr-to-c a))

  expr-to-c (Eq  a b) = wrapped ((expr-to-c a) ++ " == " ++ (expr-to-c b))
  expr-to-c (Neq a b) = wrapped ((expr-to-c a) ++ " != " ++ (expr-to-c b))
  expr-to-c (Lt  a b) = wrapped ((expr-to-c a) ++  " < " ++ (expr-to-c b))
  expr-to-c (Le  a b) = wrapped ((expr-to-c a) ++ " <= " ++ (expr-to-c b))
  expr-to-c (Gt  a b) = wrapped ((expr-to-c a) ++  " > " ++ (expr-to-c b))
  expr-to-c (Ge  a b) = wrapped ((expr-to-c a) ++ " >= " ++ (expr-to-c b))

  expr-to-c (Cond e a b) = wrapped ((expr-to-c e) ++ " ? " ++ (expr-to-c a) ++ " : " ++ (expr-to-c b))

  expr-to-c (SGet e) = wrapped ("atomic_load(&__thread__->shared[" ++ (expr-to-c e) ++ "])")
  expr-to-c (GGet e) = wrapped ("atomic_load(&GLOBAL[" ++ (expr-to-c e) ++ "])")

  expr-to-c (SAdd v i) = wrapped ("atomic_fetch_add(&__thread__->shared[" ++ (expr-to-c v) ++ "], " ++ (expr-to-c i) ++ ")")
  expr-to-c (GAdd v i) = wrapped ("atomic_fetch_add(&GLOBAL[" ++ (expr-to-c v) ++ "], " ++ (expr-to-c i) ++ ")")
  expr-to-c (SExc v e) = wrapped ("atomic_exchange(&__thread__->shared[[" ++ (expr-to-c v) ++ "], " ++ (expr-to-c e) ++ ")")
  expr-to-c (GExc v e) = wrapped ("atomic_exchange(&GLOBAL[" ++ (expr-to-c v) ++ "], " ++ (expr-to-c e) ++ ")")

  to-kernel : (indent : Nat) → Stmt → String
  to-kernel i (Locals vs) = (indent i) ++ "u64 " ++ (join ", " vs) ++ ";"
  to-kernel i (LSet v e) = (indent i) ++ v ++ " = " ++ (expr-to-c e) ++ ";"
  to-kernel i (SSet n e) = (indent i) ++ "atomic_store(&__thread__->shared[" ++ (expr-to-c n) ++ "], " ++ (expr-to-c e) ++ ");"
  to-kernel i (GSet n e) = (indent i) ++ "atomic_store(&GLOBAL[" ++ (expr-to-c n) ++ "], " ++ (expr-to-c e) ++ ");"
  to-kernel i (If e a b) =
    (indent i) ++ "if (" ++ (expr-to-c e) ++ ") {\n" ++
      (to-kernel (i + 1) a) ++ "\n" ++
    (indent i) ++ "} else {\n" ++
      (to-kernel (i + 1) b) ++ "\n" ++
    (indent i) ++ "}"
  to-kernel i (While e b) =
    (indent i) ++ "while (" ++ (expr-to-c e) ++ ") {\n" ++
      (to-kernel (i + 1) b) ++ "\n" ++
    (indent i) ++ "}"
  to-kernel i (Ret e) =
    (indent i) ++ "__ret__ = " ++ (expr-to-c e) ++ ";\n" ++
    (indent i) ++ "goto RETURN;"
  to-kernel i (Cont)  = (indent i) ++ "continue;"
  to-kernel i (Break) = (indent i) ++ "break;"
  to-kernel i (Ignore e) = (indent i) ++ (expr-to-c e) ++ ";"
  to-kernel i (Then a b) = (to-kernel i a) ++ "\n" ++ (to-kernel i b)
  to-kernel i (Call v b) =
    (indent i) ++ v ++ " = ({\n" ++
      (indent (i + 1)) ++ "__label__ RETURN;\n" ++
      (indent (i + 1)) ++ "u64 __ret__ = 0;\n" ++
      (to-kernel (i + 1) b) ++ "\n" ++
      (indent (i + 1)) ++ "RETURN: __ret__;\n" ++
    (indent i ) ++ "});"

