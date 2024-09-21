import { Nat } from '../../Base/Nat/Type';
import { Bool } from '../../Base/Bool/Type';

// Represents a 64-bit machine word.
export type U64 = bigint;

// NOTE: Using native BigInt to represent U64, but ensuring it's within 64-bit range.