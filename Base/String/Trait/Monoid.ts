import { Monoid } from '../../../Base/Trait/Monoid';
import { String } from '../../../Base/String/Type';
import { $append } from '../../../Base/String/append';

export const MonoidString: Monoid<String> = {
  memp: "",
  mapp: $append
};