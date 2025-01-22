### Semantics
* prepare, commit, or rollback operations

### Notes
1. Single-partition transactions involve the pessimistic (lock-based or
   tracking) or optimistic (try and validate) concurrency control schemes that
   we discussed in Chapter 5.
2. To ensure atomicity, transactions should be recoverable. In other words, if
   the transaction cannot complete, is aborted, or times out, its results have to
   be rolled back completely.
3. Making Operations Appear Atomic
   * To make multiple operations appear atomic, especially if some of them are
      remote, we need to use a class of algorithms called atomic commitment.
   * Another important
     implication of this fact is that atomic commitment algorithms do not work
     in the presence of Byzantine failures: when the process lies about its state
     or decides on an arbitrary value, since it contradicts unanimity
4. In databases, distributed transactions are executed by the component
   commonly known as a transaction manager
5. Inability of the coordinator to proceed with a commit or abort leaves the
   cluster in an undecided state. This means that cohorts will not be able to
   learn about the final decision in case of a permanent coordinator failure.
6. Because of this property, we say that 2PC is a blocking atomic
   commitment algorithm.
7. Traditional database systems execute transactions using two-phase locking
   or optimistic concurrency control and have no deterministic transaction
   order. This means that nodes have to be coordinated to preserve order.
   Deterministic transaction order removes coordination overhead during the
   execution phase and, since all replicas get the same inputs, they also
   produce equivalent outputs. This approach is commonly known as Calvin,
   a fast distributed transaction protocol
8. Calvin is often contrasted with another approach for distributed transaction
   management called Spanner
   * To achieve consistency and impose transaction order, Spanner uses
     TrueTime: a high-precision wall-clock API that also exposes an
     uncertainty bound, allowing local operations to introduce artificial
     slowdowns to wait for the uncertainty bound to pass.