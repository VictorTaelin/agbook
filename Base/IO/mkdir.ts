import { IO } from '../../Base/IO/Type';
import { String } from '../../Base/String/Type';
import { Unit, $unit } from '../../Base/Unit/Type';
import * as fs from 'fs';
import * as util from 'util';

// Creates a directory with the given path.
// - path: The path of the directory to create.
// = A promise that resolves to Unit when the directory is created.
export const $mkdir = (path: String): IO<Unit> => {
  return async () => {
    const mkdir_promise = util.promisify(fs.mkdir);
    try {
      await mkdir_promise(path, { recursive: true });
      return $unit;
    } catch (err) {
      if (err.code !== 'EEXIST') {
        throw err;
      }
      return $unit;
    }
  };
};

export const mkdir = (path: String) => $mkdir(path);

// NOTE: This implementation uses Node.js fs module and util.promisify
// to create a directory asynchronously. It handles the case where
// the directory already exists (EEXIST error) by resolving to Unit.