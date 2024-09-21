import { List } from '../../Base/List/Type';

// A queue that stores a list of elements to be dequeued
// and a list of elements that have been enqueued.
//
// When dequeueing, if `front` is empty then `back` is reversed
// and replaces `front`.
export type Queue<A> = {
  $: 'MkQueue',
  front: List<A>,
  back: List<A>
};

export const $MkQueue = <A>(front: List<A>, back: List<A>): Queue<A> => ({
  $: 'MkQueue',
  front,
  back
});

export const MkQueue = <A>(front: List<A>) => (back: List<A>) => $MkQueue(front, back);
