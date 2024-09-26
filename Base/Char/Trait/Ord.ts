import { Char } from '../../../Base/Char/Char';
import { Ord } from '../../../Base/Trait/Ord';
import { $compare } from '../../../Base/Char/compare';
import { $lt } from '../../../Base/Char/lt';
import { $gt } from '../../../Base/Char/gt';
import { $lte } from '../../../Base/Char/lte';
import { $gte } from '../../../Base/Char/gte';

export const OrdChar: Ord<Char> = {
  compare: $compare,
  lt: $lt,
  gt: $gt,
  lte: $lte,
  gte: $gte
};

// NOTE: We're using the imported functions directly as they already handle the comparison logic.
// This matches the Agda implementation more closely.
