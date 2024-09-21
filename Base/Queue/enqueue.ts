import { Queue, $MkQueue } from '../../Base/Queue/Type';
import { List, $Cons } from '../../Base/List/Type';

export const $enqueue = <A>(queue: Queue<A>, a: A): Queue<A> => {
  return $MkQueue(queue.front, $Cons(a, queue.back));
};

export const enqueue = <A>(queue: Queue<A>) => (a: A) => $enqueue(queue, a);