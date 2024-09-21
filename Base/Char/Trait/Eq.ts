import { Char } from '../../../Base/Char/Type';
import { Eq } from '../../../Base/Trait/Eq';
import { $eq } from '../../../Base/Char/eq';
import { $neq } from '../../../Base/Char/neq';

export const EqChar: Eq<Char> = {
  eq: $eq,
  neq: $neq
};
