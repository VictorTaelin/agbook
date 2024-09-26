import { IO } from '../../Base/IO/IO';
import { String } from '../../Base/String/String';
import { Unit, $unit } from '../../Base/Unit/Unit';
import * as fs from 'fs/promises';

// Writes content to a file at the specified path.
// - 1st: The path of the file to write.
// - 2nd: The content to write to the file.
// = An IO action that writes the content and returns Unit.
export const $$write_file = (path: String, content: String): IO<Unit> => {
  return async () => {
    await fs.writeFile(path, content);
    return $unit;
  };
};

// NOTE: Using Node.js fs/promises module for file operations.
export const $write_file = (path: String, content: String): IO<Unit> => {
  return async () => {
    await fs.writeFile(path, content);
    return $unit;
  };
};

export const write_file = (path: String) => (content: String) => $write_file(path, content);

// NOTE: The GHC and JS specific COMPILE pragmas are not applicable in TypeScript.
// We've implemented the functionality directly using Node.js APIs.
