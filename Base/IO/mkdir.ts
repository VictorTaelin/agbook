import { IO } from '../../Base/IO/Type';
import { String } from '../../Base/String/Type';
import { Unit, $unit } from '../../Base/Unit/Type';
import * as fs from 'fs/promises';

// Creates a directory with the given name.
// - path: The path of the directory to create.
// = An IO action that creates the directory and returns Unit.
export const $mkdir = (path: String): IO<Unit> => 
  async () => {
    await fs.mkdir(path, { recursive: true });
    return $unit;
  };

export const mkdir = (path: String) => $mkdir(path);

// NOTE: Using Node.js fs.promises API for asynchronous directory creation.
// The 'recursive: true' option is used to create parent directories if they don't exist,
// which is closer to the behavior of most mkdir implementations.
