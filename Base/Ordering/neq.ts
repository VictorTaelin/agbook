import { Ordering } from '../../Base/Ordering/Type';
import { Bool } from '../../Base/Bool/Type';

export const $neq = (a: Ordering, b: Ordering): Bool => {
  switch (a.$) {
    case 'LT':
      return b.$ !== 'LT';
    case 'EQ':
      return b.$ !== 'EQ';
    case 'GT':
      return b.$ !== 'GT';
  }
};

export const neq = (a: Ordering) => (b: Ordering) => $neq(a, b);

// NOTE: Operator omitted: '_!=_'.