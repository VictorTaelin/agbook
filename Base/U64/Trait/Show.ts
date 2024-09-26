import { U64 } from '../../../Base/U64/U64';
import { $show as u64_show } from '../../../Base/U64/show';
import { Show, $make_show } from '../../../Base/Trait/Show';

// Create a Show instance for U64
export const ShowU64: Show<U64> = $make_show(u64_show);

// NOTE: Using the existing u64_show function to create the Show instance for U64
