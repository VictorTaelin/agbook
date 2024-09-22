import { Nat } from '../../Base/Nat/Type';
import { String } from '../../Base/String/Type';

// Represents a parser error with an index and an error message.
export type Error = {
  $: 'MkError',
  index: Nat,   // The position in the input where the error occurred.
  error: String // A string describing the error.
};

export const $MkError = (index: Nat, error: String): Error => ({
  $: 'MkError',
  index,
  error
});

export const MkError = (index: Nat) => (error: String) => $MkError(index, error);