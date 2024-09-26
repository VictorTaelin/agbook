// Represents a unit type with a single value.
export type Unit = { $: 'unit' };

// The single value of the Unit type.
export const $unit: Unit = { $: 'unit' };
export const  unit: Unit = $unit;
