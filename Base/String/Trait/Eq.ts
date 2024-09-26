import { String } from '../../../Base/String/String';
import { $eq } from '../../../Base/String/eq';
import { $neq } from '../../../Base/String/neq';
import { Eq } from '../../../Base/Trait/Eq';

export const eq_string: Eq<String> = {
  eq: $eq,
  neq: $neq
};