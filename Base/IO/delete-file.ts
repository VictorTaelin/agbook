import { IO } from '../../Base/IO/IO';
import { String } from '../../Base/String/String';
import { Unit, $unit } from '../../Base/Unit/Unit';
import * as fs from 'fs/promises';

// Deletes a file at the given path.
// - 1st: The path of the file to delete.
// = An IO action that deletes the file.
export const $delete_file = (path: String): IO<Unit> => 
  () => fs.unlink(path).then(() => $unit);

export const delete_file = (path: String) => $delete_file(path);

// NOTE: Using Node.js fs/promises module for file operations.
// This provides a Promise-based API which aligns well with our IO type.
