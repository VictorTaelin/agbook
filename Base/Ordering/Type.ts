export type Ordering
  = { $: 'LT' }
  | { $: 'EQ' }
  | { $: 'GT' };

export const $LT: Ordering = { $: 'LT' };
export const  LT: Ordering = $LT;

export const $EQ: Ordering = { $: 'EQ' };
export const  EQ: Ordering = $EQ;

export const $GT: Ordering = { $: 'GT' };
export const  GT: Ordering = $GT;