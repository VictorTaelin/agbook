import { $show as $float_show } from '../../Base/F64/show';
import { String } from '../../Base/String/String';
import { $append } from '../../Base/String/append';
import { V2 } from '../../Base/V2/V2';

export const $show = (v: V2): String => {
  return $append(
    $append(
      $append(
        $append(
          "(",
          $float_show(v.x)
        ),
        ", "
      ),
      $float_show(v.y)
    ),
    ")"
  );
};

export const show = (v: V2) => $show(v);

// NOTE: Using string template literals for efficiency in the actual implementation
export const $$show = (v: V2): String => {
  return `(${v.x}, ${v.y})`;
};
