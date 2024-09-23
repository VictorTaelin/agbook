import { String } from '../../../Base/String/Type';
import { Ord } from '../../../Base/Trait/Ord';
import { $lt } from '../../../Base/String/lt';
import { $lte } from '../../../Base/String/lte';
import { $gt } from '../../../Base/String/gt';
import { $gte } from '../../../Base/String/gte';
import { $compare } from '../../../Base/String/compare';

export const OrdString: Ord<String> = {
  compare: $compare,
  lt: $lt,
  lte: $lte,
  gt: $gt,
  gte: $gte
};