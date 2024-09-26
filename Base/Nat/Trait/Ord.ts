import { Nat } from '../../../Base/Nat/Nat';
import { Ord } from '../../../Base/Trait/Ord';
import { $lt } from '../../../Base/Nat/lt';
import { $lte } from '../../../Base/Nat/lte';
import { $gt } from '../../../Base/Nat/gt';
import { $gte } from '../../../Base/Nat/gte';
import { $compare } from '../../../Base/Nat/compare';

export const OrdNat: Ord<Nat> = {
  compare: $compare,
  lt: $lt,
  lte: $lte,
  gt: $gt,
  gte: $gte
};
