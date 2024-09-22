import { String } from '../../../Base/String/Type';
import { show as string_show } from '../../../Base/String/show';
import { Show } from '../../../Base/Trait/Show';

// Show instance for String
export const show_string: Show<String> = {
  to_string: string_show
};

// NOTE: Using snake_case for TypeScript names as per guidelines
// NOTE: Renamed 'ShowString' to 'show_string' to follow TypeScript conventions