export type Maybe<A>
  = { $: 'None' }
  | { $: 'Some', value: A };

export const $None: Maybe<never> = { $: 'None' };
export const  None: Maybe<never> = $None;

export const $Some = <A>(value: A): Maybe<A> => ({ $: 'Some', value });
export const  Some = <A>(value: A) => $Some(value);
