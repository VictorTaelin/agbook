import { Unit } from '../../Base/Unit/Type';
import { Bool, True } from '../../Base/Bool/Type';

// Equality function for Unit type.
// Always returns True since there's only one value of Unit.
export const $eq = (_a: Unit, _b: Unit): Bool => True;
export const  eq = (_a: Unit) => (_b: Unit): Bool => True;

// NOTE: Operator omitted: '_==_'.
