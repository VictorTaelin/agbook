// Represents the result of a comparison operation.
export type Ordering
  = { $: 'LT' }  // Less Than
  | { $: 'EQ' }  // Equal
  | { $: 'GT' }; // Greater Than

export const $LT: Ordering = { $: 'LT' };
export const  LT: Ordering = $LT;

export const $EQ: Ordering = { $: 'EQ' };
export const  EQ: Ordering = $EQ;

export const $GT: Ordering = { $: 'GT' };
export const  GT: Ordering = $GT;
