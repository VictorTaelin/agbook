// Represents the result of a comparison.
export type Ordering
  = { $: 'LT' } // Less than
  | { $: 'EQ' } // Equal to
  | { $: 'GT' } // Greater than

export const $LT: Ordering = { $: 'LT' };
export const  LT: Ordering = $LT;

export const $EQ: Ordering = { $: 'EQ' };
export const  EQ: Ordering = $EQ;

export const $GT: Ordering = { $: 'GT' };
export const  GT: Ordering = $GT;