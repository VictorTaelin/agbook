import { IO } from '../../../Base/IO/Type';
import { Monad } from '../../../Base/Trait/Monad';
import { $bind } from '../../../Base/IO/Monad/bind';
import { $pure } from '../../../Base/IO/Monad/pure';

// IO Monad instance
export const io_monad: Monad<IO<any>> = {
  bind: $bind,
  pure: $pure
};

// NOTE: We're using the already defined $bind and $pure functions from their respective modules.
// This ensures consistency with the individual IO operations defined earlier.
// The 'any' type is used here to match the Monad interface definition, but in practice,
// the types will be correctly inferred when using these functions.
