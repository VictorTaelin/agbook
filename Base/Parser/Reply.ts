import { State } from '../../Base/Parser/State';

// Represents the reply of a parser.
// - A: The type of the parsed value.
export type Reply<A> = {
  $: 'MkReply';
  state: State; // The current state of the parser after parsing.
  value: A;     // The parsed value.
};

export const $MkReply = <A>(state: State, value: A): Reply<A> => ({
  $: 'MkReply',
  state,
  value
});

export const MkReply = <A>(state: State) => (value: A) => $MkReply(state, value);