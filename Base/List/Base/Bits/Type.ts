// Represents a binary string.
// - O: Represents a zero bit.
// - I: Represents a one bit.
// - E: Represents the end of the binary string.
export type Bits
  = { $: 'O', tail: Bits }
  | { $: 'I', tail: Bits }
  | { $: 'E' };

export const $O = (tail: Bits): Bits => ({ $: 'O', tail });
export const  O = (tail: Bits): Bits => $O(tail);

export const $I = (tail: Bits): Bits => ({ $: 'I', tail });
export const  I = (tail: Bits): Bits => $I(tail);

export const $E: Bits = { $: 'E' };
export const  E: Bits = $E;