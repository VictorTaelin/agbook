import { U64 } from '../../../Base/U64/U64';
import { $eq } from '../../../Base/U64/eq';
import { $neq } from '../../../Base/U64/neq';
import { Eq } from '../../../Base/Trait/Eq';

export const EqU64: Eq<U64> = {
  eq: $eq,
  neq: $neq
};
