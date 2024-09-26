import { Unit } from '../../Base/Unit/Unit';
import { Bool, False } from '../../Base/Bool/Bool';

// Checks if two Unit values are not equal.
// Always returns False since there's only one Unit value.
// - a: The first Unit value.
// - b: The second Unit value.
// = Always False.
export const $neq = (a: Unit, b: Unit): Bool => False;
export const  neq = (a: Unit) => (b: Unit) => False;

// NOTE: Operator omitted: '_!=_'.
