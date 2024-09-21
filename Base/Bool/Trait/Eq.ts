import { Bool } from '../../../Base/Bool/Type';
import { $eq as bool_eq } from '../../../Base/Bool/eq';
import { $neq as bool_neq } from '../../../Base/Bool/neq';
import { Eq } from '../../../Base/Trait/Eq';

export const EqBool: Eq<Bool> = {
  eq: bool_eq,
  neq: bool_neq
};