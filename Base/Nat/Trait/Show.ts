import { Nat } from '../../../Base/Nat/Type';
import { Show } from '../../../Base/Trait/Show';
import { $show as nat_show } from '../../../Base/Nat/show';

// Show instance for Nat
export const show_nat: Show<Nat> = {
  to_string: nat_show
};

// NOTE: Using snake_case for TypeScript names as per guidelines
// NOTE: Imported 'show' as 'nat_show' to avoid naming conflicts
