// Represents a binary string.
// - O: Represents a zero bit.
// - I: Represents a one bit.
// - E: Represents the end of the binary string.
// Least significant bits are leftmost. Examples:
// (E)           represents nil (0)
// (O E)         represents 0b0 (0)
// (I E)         represents 0b1 (1)
// (O (I E))     represents 0b10 (2)
// (O (I (I E))) represents 0b110 (6)
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
