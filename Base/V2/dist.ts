import { Float } from '../../Base/Float/Type';
import { $sqrt } from '../../Base/Float/sqrt';
import { V2 } from '../../Base/V2/Type';
import { $sqr_dist } from '../../Base/V2/sqr-dist';

// Calculates the Euclidean distance between two V2 vectors.
// - v1: The 1st V2 vector.
// - v2: The 2nd V2 vector.
// = The distance between v1 and v2.
export const $dist = (v1: V2, v2: V2): Float => {
  return $sqrt($sqr_dist(v1, v2));
};

export const dist = (v1: V2) => (v2: V2) => $dist(v1, v2);