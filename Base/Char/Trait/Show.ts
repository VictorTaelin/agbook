import { Char } from '../../../Base/Char/Type';
import { $show as $char_show } from '../../../Base/Char/show';
import { Show } from '../../../Base/Trait/Show';

export const show_char: Show<Char> = {
  to_string: $char_show
};

// NOTE: Using snake_case for TypeScript names as per guidelines
// NOTE: Exporting as a constant instead of using 'instance' keyword
