#pagebreak()
= Future Work and Suggested Improvements

The paper itself proposes three categories of improvement (Section 8 of the original paper), and subsequent practical work has extended these.

+ *Everlasting anonymity.* By restricting each address to a single use and replacing the on-ledger ciphertext with an out-of-band communication channel, the pour transaction becomes statistically hiding rather than only computationally hiding. This neutralises the quantum-adversary threat at the cost of additional infrastructure for sender--recipient communication.

+ *Fast block propagation.* A node can validate the proof-of-work and forward a block immediately, deferring Pour-transaction verification until the block's transactions are actually used downstream. This decouples propagation latency from SNARK verification cost. The trade-off is increased exposure to invalid blocks, mitigated in practice by the cost of forging proof-of-work.

+ *Storage mitigation.* CMList storage can be reduced to a per-block Merkle path of roughly 2 KiB. SNList growth can be mitigated by partitioning the list into sublists indexed by interval Merkle trees, with timestamped coins so that users do not need to maintain authentication paths against the entire history.

+ *Beyond the paper.* Real-world deployment in Zcash addressed the trusted setup risk through multi-party computation ceremonies in which any single honest participant suffices for security. Subsequent zk-SNARK constructions (e.g., Halo, Groth16 in tandem with universal trusted setups, and STARKs) have removed or weakened the trusted-setup assumption entirely, at varying costs in proof size and verification time. Hardware acceleration has also brought prover times down by one to two orders of magnitude since 2014.
