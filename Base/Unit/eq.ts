import { Unit } from '../../Base/Unit/Type';
import { Bool, True } from '../../Base/Bool/Type';

// Checks if two Unit values are equal.
// Always returns True since there's only one Unit value.
// - a: The first Unit value.
// - b: The second Unit value.
// = Always True.
export const $eq = (_a: Unit, _b: Unit): Bool => True;
export const  eq = (_a: Unit) => (_b: Unit): Bool => True;

// NOTE: Operator omitted: '_==_'.