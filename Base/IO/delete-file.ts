import { IO } from '../../Base/IO/Type';
import { String } from '../../Base/String/Type';
import { Unit, $unit } from '../../Base/Unit/Type';
import * as fs from 'fs/promises';

// Deletes a file at the given path.
// - path: The path of the file to delete.
// = IO action that deletes the file.
export const $delete_file = (path: String): IO<Unit> => 
  () => fs.unlink(path).then(() => $unit);

export const delete_file = (path: String) => $delete_file(path);

// NOTE: Using Node.js fs/promises module for file operations.
// This provides a Promise-based API which aligns well with our IO type.