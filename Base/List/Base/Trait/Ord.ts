import { Bool } from '../../Base/Bool/Type';

// Trait for types that can be ordered
export interface Ord<A> {
  _<_: (x: A, y: A) => Bool;
  _<=_: (x: A, y: A) => Bool;
  _>_: (x: A, y: A) => Bool;
  _>=_: (x: A, y: A) => Bool;
}