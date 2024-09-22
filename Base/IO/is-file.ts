import { IO } from '../../Base/IO/Type';
import { String } from '../../Base/String/Type';
import { Bool } from '../../Base/Bool/Type';
import * as fs from 'fs/promises';

// Checks if a file exists at the given path.
// - path: The path to check.
// = An IO that resolves to true if the file exists, false otherwise.
export const $is_file = (path: String): IO<Bool> => 
  () => fs.stat(path)
    .then(stats => stats.isFile())
    .catch(() => false);

export const is_file = (path: String) => $is_file(path);
