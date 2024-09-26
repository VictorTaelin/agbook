import { String } from '../../Base/String/String';

// Converts a string to its string representation.
// This is essentially an identity function for strings.
export const $show = (s: String): String => JSON.stringify(s);
export const  show = (s: String) => $show(s);

// NOTE: Using JSON.stringify to ensure proper escaping of special characters.