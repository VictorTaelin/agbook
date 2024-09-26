import { Bool } from '../../../Base/Bool/Bool';
import { $show as bool_show } from '../../../Base/Bool/show';
import { Show } from '../../../Base/Trait/Show';

export const show_bool: Show<Bool> = {
  to_string: bool_show
};

// NOTE: Using snake_case for TypeScript names as per guidelines
// NOTE: Imported 'show' as 'bool_show' to avoid naming conflicts
