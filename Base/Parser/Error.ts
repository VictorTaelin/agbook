import { Nat } from '../../Base/Nat/Type';
import { String } from '../../Base/String/Type';

// Represents a parser error with an index and an error message.
// - index: The position in the input where the error occurred.
// - error: A string describing the error.
export type Error = { $: 'MkError', index: Nat, error: String };

export const $MkError = (index: Nat, error: String): Error => ({ $: 'MkError', index, error });
export const  MkError = (index: Nat) => (error: String) => $MkError(index, error);
