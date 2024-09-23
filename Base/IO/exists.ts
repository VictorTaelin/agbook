import { IO } from '../../Base/IO/Type';
import { String } from '../../Base/String/Type';
import { Bool } from '../../Base/Bool/Type';
import { $is_file } from '../../Base/IO/is-file';
import { $is_directory } from '../../Base/IO/is-directory';

// Checks if a file or directory exists at the given path.
// - path: The path to check.
// = True if either a file or directory exists at the given path, False otherwise.
export const $exists = (path: String): IO<Bool> => () => 
  $is_file(path)().then(file_exists => 
    file_exists ? true : $is_directory(path)()
  );

export const exists = (path: String) => $exists(path);

// NOTE: This implementation uses the updated IO type (() => Promise<A>)
// and maintains the lazy evaluation nature of IO actions.