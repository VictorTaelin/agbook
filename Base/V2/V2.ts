import { F64 } from '../../Base/F64/F64';

// Represents a 2D vector with float coordinates.
export type V2 = {
  // - x: The x-coordinate.
  x: F64;
  // - y: The y-coordinate.
  y: F64;
};

export const $MkV2 = (x: F64, y: F64): V2 => ({ x, y });
export const  MkV2 = (x: F64) => (y: F64) => $MkV2(x, y);
