import { Nat } from '../../../Base/Nat/Nat';
import { Eq } from '../../../Base/Trait/Eq';
import { $eq } from '../../../Base/Nat/eq';
import { $neq } from '../../../Base/Nat/neq';

export const EqNat: Eq<Nat> = {
  eq: $eq,
  neq: $neq
};
