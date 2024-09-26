import { Int } from '../../../Base/Int/Int';
import { $show as $show_int } from '../../../Base/Int/show';
import { Show, $make_show } from '../../../Base/Trait/Show';

// Instance of Show for Int
export const Show_Int: Show<Int> = $make_show($show_int);
