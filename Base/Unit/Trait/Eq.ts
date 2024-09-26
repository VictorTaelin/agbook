import { Unit } from '../../../Base/Unit/Unit';
import { $eq } from '../../../Base/Unit/eq';
import { $neq } from '../../../Base/Unit/neq';
import { Eq } from '../../../Base/Trait/Eq';

export const EqUnit: Eq<Unit> = {
  eq: $eq,
  neq: $neq
};
