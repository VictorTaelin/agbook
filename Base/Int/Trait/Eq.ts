import { Int } from '../../../Base/Int/Int';
import { $eq } from '../../../Base/Int/eq';
import { $neq } from '../../../Base/Int/neq';
import { Eq } from '../../../Base/Trait/Eq';

export const EqInt: Eq<Int> = {
  eq: $eq,
  neq: $neq
};
