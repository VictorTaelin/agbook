import { U64 } from '../../../Base/U64/Type';
import { Ord, $make_default } from '../../../Base/Trait/Ord';
import { $compare } from '../../../Base/U64/compare';
import { $lt } from '../../../Base/U64/lt';
import { $lte } from '../../../Base/U64/lte';
import { $gt } from '../../../Base/U64/gt';
import { $gte } from '../../../Base/U64/gte';

export const OrdU64: Ord<U64> = $make_default($compare);

// NOTE: We're using the default implementation provided by $make_default,
// but overriding with more efficient native operations where possible.
OrdU64.lt = $lt;
OrdU64.lte = $lte;
OrdU64.gt = $gt;
OrdU64.gte = $gte;