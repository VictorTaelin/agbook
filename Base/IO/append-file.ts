import { String } from '../../Base/String/Type';
import { IO } from '../../Base/IO/Type';
import { Unit, $unit } from '../../Base/Unit/Type';
import * as fs from 'fs/promises';

// Appends content to a file.
// - path: The path to the file.
// - content: The content to append.
// = An IO action that appends the content and returns Unit.
export const $append_file = (path: String, content: String): IO<Unit> => async () => {
  await fs.appendFile(path, content);
  return $unit;
};

export const append_file = (path: String) => (content: String) => $append_file(path, content);

// NOTE: Using Node.js fs/promises module for file operations.
// This provides a Promise-based API which aligns well with our IO type.
