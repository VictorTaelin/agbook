import { Equal } from '../../Base/Equal/Equal';

// Erases the equality proof, returning a new equality proof.
// This is a no-op in TypeScript since we don't have actual proof objects.
export const $erase = <A>(_proof: Equal<A>): Equal<A> => null;
export const  erase = <A>(_proof: Equal<A>) => null;

// NOTE: In TypeScript, Equal is represented as null, so erasing has no effect.
