export type Maybe<A>
  = { $: 'None' }
  | { $: 'Some', value: A };

export const $None = { $: 'None' };
export const  None = $None;

export const $Some = <A>(value: A): Maybe<A> => ({ $: 'Some', value });
export const  Some = <A>(value: A) => $Some(value);