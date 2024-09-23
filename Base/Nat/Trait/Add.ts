import { Nat } from '../../../Base/Nat/Type';
import { Add, $make_add } from '../../../Base/Trait/Add';
import { $add as nat_add } from '../../../Base/Nat/add';

// Instance of Add trait for Nat
export const AddNat: Add<Nat> = $make_add(nat_add);

// NOTE: In TypeScript, we don't have a direct equivalent to Agda's 'instance' keyword.
// Instead, we export the Add instance for Nat as a constant that can be imported and used as needed.