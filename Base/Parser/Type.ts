import { Error } from '../../Base/Parser/Error';
import { Reply } from '../../Base/Parser/Reply';
import { State } from '../../Base/Parser/State';
import { Result } from '../../Base/Result/Type';

// Represents a parser as a function from State to Result.
// - A: The type of the value to be parsed.
// A parser takes a State and returns a Result which is either:
// - Done: a Reply containing the parsed value and new state.
// - Fail: an Error containing the index and message.
export type Parser<A> = (state: State) => Result<Reply<A>, Error>;