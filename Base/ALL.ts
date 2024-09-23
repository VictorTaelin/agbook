// Namespaced Modules
// ------------------

import * as BoolModule from '../Base/Bool/ALL';
import * as CharModule from '../Base/Char/ALL';
import * as StringModule from '../Base/String/ALL';
import * as NatModule from '../Base/Nat/ALL';
import * as IntModule from '../Base/Int/ALL';
import * as FloatModule from '../Base/Float/ALL';
import * as U64Module from '../Base/U64/ALL';
import * as ListModule from '../Base/List/ALL';
import * as PairModule from '../Base/Pair/ALL';
import * as MaybeModule from '../Base/Maybe/ALL';
import * as ResultModule from '../Base/Result/ALL';
import * as BitsModule from '../Base/Bits/ALL';
import * as EmptyModule from '../Base/Empty/ALL';
import * as EqualModule from '../Base/Equal/ALL';
import * as FunctionModule from '../Base/Function/ALL';
import * as IOModule from '../Base/IO/ALL';
import * as MapModule from '../Base/Map/ALL';
import * as OrderingModule from '../Base/Ordering/ALL';
import * as ParserModule from '../Base/Parser/ALL';
import * as QueueModule from '../Base/Queue/ALL';
import * as TreeModule from '../Base/Tree/ALL';
import * as UnitModule from '../Base/Unit/ALL';

export { BoolModule as Bool };
export { CharModule as Char };
export { StringModule as String };
export { NatModule as Nat };
export { IntModule as Int };
export { FloatModule as Float };
export { U64Module as U64 };
export { ListModule as List };
export { PairModule as Pair };
export { MaybeModule as Maybe };
export { ResultModule as Result };
export { BitsModule as Bits };
export { EmptyModule as Empty };
export { EqualModule as Equal };
export { FunctionModule as Function };
export { IOModule as IO };
export { MapModule as Map };
export { OrderingModule as Ordering };
export { ParserModule as Parser };
export { QueueModule as Queue };
export { TreeModule as Tree };
export { UnitModule as Unit };

// Traits
// ------

export * from '../Base/Trait/Add';
export * from '../Base/Trait/Eq';
export * from '../Base/Trait/Monad';
export * from '../Base/Trait/Monoid';
export * from '../Base/Trait/Ord';
export * from '../Base/Trait/Show';

// Types and Constructors
// ----------------------

export type Bool = BoolModule.Bool;
export const True: Bool = BoolModule.True;
export const False: Bool = BoolModule.False;

export type Char = CharModule.Char;

export type String = StringModule.String;

export type Nat = NatModule.Nat;
export const Zero: Nat = NatModule.Zero;
export const Succ = NatModule.Succ;

export type Int = IntModule.Int;
export const Pos = IntModule.Pos;
export const NegSuc = IntModule.NegSuc;

export type Float = FloatModule.Float;

export type U64 = U64Module.U64;

export type List<A> = ListModule.List<A>;
export const Nil: List<never> = ListModule.$Nil;
export const Cons = ListModule.$Cons;

export type Sigma<A, B> = PairModule.Sigma<A, B>;
export type Σ<A, B> = PairModule.Sigma<A, B>;
export type Pair<A, B> = PairModule.Pair<A, B>;
export const $Pair = PairModule.$Pair;

export type Maybe<A> = MaybeModule.Maybe<A>;
export const None: Maybe<never> = MaybeModule.$None;
export const Some = MaybeModule.$Some;

export type Result<A, E> = ResultModule.Result<A, E>;
export const Done = ResultModule.$Done;
export const Fail = ResultModule.$Fail;

export type Bits = BitsModule.Bits;
export const O = BitsModule.$O;
export const I = BitsModule.$I;
export const E: Bits = BitsModule.$E;

export type Empty = EmptyModule.Empty;

export type Equal<A> = EqualModule.Equal<A>;
export const refl: Equal<any> = EqualModule.$refl;

export type IO<A> = IOModule.IO<A>;

export type Map<A> = MapModule.Map<A>;

export type Ordering = OrderingModule.Ordering;
export const LT: Ordering = OrderingModule.$LT;
export const EQ: Ordering = OrderingModule.$EQ;
export const GT: Ordering = OrderingModule.$GT;

export type Parser<A> = ParserModule.Parser<A>;

export type Queue<A> = QueueModule.Queue<A>;
export const MkQueue = QueueModule.$MkQueue;

export type Tree<A> = TreeModule.Tree<A>;
export const Node = TreeModule.$Node;
export const Leaf: Tree<never> = TreeModule.$Leaf;

export type Unit = UnitModule.Unit;
export const unit: Unit = UnitModule.$unit;

// NOTE: Some constructs like infixr and infix operators are not directly translatable to TypeScript.
// Users will need to use the exported functions directly instead of infix notation.
