import { Nat, $Zero } from '../../Base/Nat/Type';
import { String } from '../../Base/String/Type';

// Represents the state of a parser.
export type State = {
  $: 'MkState';
  input: String; // The remaining input text to be consumed.
  index: Nat;    // The current parsing index.
};

export const $MkState = (input: String, index: Nat): State => ({
  $: 'MkState',
  input,
  index
});

export const MkState = (input: String) => (index: Nat) => $MkState(input, index);

// Creates a new State with the given input and initial index of zero.
export const $new_parser_state = (input: String): State => $MkState(input, $Zero);
export const new_parser_state = (input: String) => $new_parser_state(input);