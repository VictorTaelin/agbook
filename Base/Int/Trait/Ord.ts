import { Ord } from '../../../Base/Trait/Ord';
import { Int } from '../../../Base/Int/Type';
import { $compare } from '../../../Base/Int/compare';
import { $lt } from '../../../Base/Int/lt';
import { $gt } from '../../../Base/Int/gt';
import { $lte } from '../../../Base/Int/lte';
import { $gte } from '../../../Base/Int/gte';

// Instance of Ord for Int
export const OrdInt: Ord<Int> = {
  compare: $compare,
  lt: $lt,
  gt: $gt,
  lte: $lte,
  gte: $gte
};
