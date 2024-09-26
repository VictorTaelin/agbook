import { Queue, $MkQueue } from '../../Base/Queue/Queue';
import { List, $Cons, $Nil } from '../../Base/List/List';
import { Maybe, $Some, $None } from '../../Base/Maybe/Maybe';
import { Pair, $Pair } from '../../Base/Pair/Pair';
import { $reverse } from '../../Base/List/reverse';

export const $dequeue = <A>(queue: Queue<A>): Maybe<Pair<A, Queue<A>>> => {
  switch (queue.front.$) {
    case '[]':
      switch (queue.back.$) {
        case '[]':
          return $None;
        default:
          var reversed = $reverse(queue.back);
          switch (reversed.$) {
            case '[]':
              return $None;
            case '::':
              return $Some($Pair(reversed.head, $MkQueue(reversed.tail, $Nil)));
          }
      }
    case '::':
      return $Some($Pair(queue.front.head, $MkQueue(queue.front.tail, queue.back)));
  }
};

export const dequeue = <A>(queue: Queue<A>) => $dequeue(queue);
