import { IO } from '../../Base/IO/IO';
import { String } from '../../Base/String/String';
import { Bool } from '../../Base/Bool/Bool';
import * as fs from 'fs/promises';

// Checks if the given path is a directory.
// - 1st: The path to check.
// = An IO action that returns True if the path is a directory, False otherwise.
export const $is_directory = (path: String): IO<Bool> => 
  () => fs.stat(path).then(
    stats => stats.isDirectory(),
    () => false
  );

export const is_directory = (path: String) => $is_directory(path);

// NOTE: This implementation uses the native fs/promises module to check if a path is a directory.
// It returns a function that returns a Promise to match the updated IO type definition in TypeScript.