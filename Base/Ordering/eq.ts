import { Ordering } from '../../Base/Ordering/Type';
import { Bool } from '../../Base/Bool/Type';

export const $eq = (a: Ordering, b: Ordering): Bool => {
  switch (a.$) {
    case 'LT':
      return b.$ === 'LT';
    case 'EQ':
      return b.$ === 'EQ';
    case 'GT':
      return b.$ === 'GT';
  }
};

export const eq = (a: Ordering) => (b: Ordering) => $eq(a, b);

// NOTE: Operator omitted: '_==_'.
