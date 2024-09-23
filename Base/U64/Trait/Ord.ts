import { U64 } from '../../../Base/U64/Type';
import { Ord } from '../../../Base/Trait/Ord';
import { $compare } from '../../../Base/U64/compare';
import { $lt } from '../../../Base/U64/lt';
import { $lte } from '../../../Base/U64/lte';
import { $gt } from '../../../Base/U64/gt';
import { $gte } from '../../../Base/U64/gte';

export const OrdU64: Ord<U64> = {
  compare: $compare,
  lt: $lt,
  gt: $gt,
  lte: $lte,
  gte: $gte
};
