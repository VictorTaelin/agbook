import { Bool, $True, $False } from '../../Base/Bool/Bool';
import { String } from '../../Base/String/String';

export const $$show = (b: Bool): String => {
  if (b) {
    return "true";
  } else {
    return "false";
  }
};

// NOTE: Using native boolean to string conversion for efficiency.
export const $show = (b: Bool): String => b ? "true" : "false";
export const  show = (b: Bool) => $show(b);
