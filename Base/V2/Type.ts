import { Float } from '../../Base/Float/Type';

// Represents a 2D vector with float coordinates.
export type V2 = {
  // - x: The x-coordinate.
  x: Float;
  // - y: The y-coordinate.
  y: Float;
};

export const $MkV2 = (x: Float, y: Float): V2 => ({ x, y });
export const  MkV2 = (x: Float) => (y: Float) => $MkV2(x, y);