#pagebreak()
= Results

== zk-SNARK Performance

The zk-SNARK is the cryptographic engine of Zerocash. It is invoked once per spend transaction (a Pour) and verified by every node on the network. Performance across the two test machines and two threading configurations is summarised in Table 1.

#figure(
  table(
    columns: 5,
    align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),

    // Header row 1: machine specs
    table.cell(rowspan: 2)[],
    table.cell(rowspan: 2)[],
    [Intel \
    Core i7-2620M \
    \@ 2.70 GHz \
    12 GB of RAM],
    table.cell(colspan: 2)[Intel \
    Core i7-4770 \
    \@ 3.40 GHz \
    16 GB of RAM],

    // Header row 2: thread counts
    [1 thread],
    [1 thread],
    [4 threads],

    // KeyGen group
    table.cell(rowspan: 3)[KeyGen],
    [Time], [7 min 48 s], [5 min 11 s], [1 min 47 s],
    [Proving key], table.cell(colspan: 3)[896 MiB],
    [Verification key], table.cell(colspan: 3)[749 B],

    // Prove group
    table.cell(rowspan: 2)[Prove],
    [Time], [2 min 55 s], [1 min 59 s], [46 s],
    [Proof], table.cell(colspan: 3)[288 B],

    // Verify group
    [Verify],
    [Time], [8.5 ms], table.cell(colspan: 2)[5.4 ms],
  ),
  caption: [Performance of our zk-SNARK for the NP statement POUR ($N = 10$, $sigma <= 2.5\%$).],
)

Two structural results stand out. First, every Zerocash proof has a *constant size of 288 bytes*, regardless of how many coins exist in the system or how complex the underlying statement is. Second, *verification time is essentially constant in milliseconds*, which is the property that determines whether the scheme is deployable, since every node verifies every transaction. Key generation is the most expensive operation but is performed exactly once at system setup, producing an 896 MiB proving key and a 749 B verification key.

== DAP Scheme Performance

The end-to-end Zerocash protocol exposes six algorithms. Their measured costs on the desktop machine (Intel Core i7-4770, 16 GB RAM, single thread) are:

- *Setup*: ~5 minutes (one-time, dominated by key generation).
- *CreateAddress*: 326 ms.
- *Mint*: 23 µs, producing a coin of 463 B and a mint transaction of 72 B.
- *Pour*: ~2 minutes, producing a pour transaction of 996 B + |info|.
- *VerifyTransaction*: 8.3 µs for a mint, 5.7 ms for a pour.
- *Receive*: 1.6 ms per pour transaction scanned.

The asymmetry between Pour ($~$2 minutes) and VerifyTransaction (5.7 ms) is intentional, since the cost is borne by the transacting party, not by the network. Because the proof size is constant and verification is fast, network nodes see Zerocash transactions as roughly equivalent in cost to plain Bitcoin transactions.

== Large-Scale Network Simulation

To test whether the per-transaction costs translate to a viable network, the authors ran a 1,000-node Bitcoin testnet on 200 Amazon EC2 instances, with 150 s block times and varying the proportion $epsilon$ of Zerocash transactions from 0% to 100%. They measured three metrics:

- *Transaction latency* (creation to inclusion in a block): ~95 s at low Zerocash density, rising to ~190 s at 100% Zerocash traffic.
- *Block propagation time*: between 2 and 4.5 s depending on traffic mix; the relationship to $epsilon$ is not strictly monotonic.
- *Block verification time*: under 80 ms in the worst case, far below the theoretical maximum of 1,500 ms predicted by the per-transaction cost.

The fact that block verification time stayed two orders of magnitude below the worst-case prediction is explained by Bitcoin's verification caching: a transaction that has already been seen propagating through the network does not need to be re-verified when it appears in a block. Caching turns out to be effective even when 100% of network traffic is Zerocash.

== Comparison with Zerocoin

Relative to the prior state of the art (Zerocoin, Miers et al. 2013), Zerocash reports:

- *Transaction size*: from ~45 kB down to under 1 kB, a reduction of over 97.7%.
- *Verification time*: from ~450 ms down to under 6 ms, a reduction of over 98.6%.

It also adds capabilities Zerocoin lacked: variable-amount transactions, hidden transaction values, hidden coin balances, and direct user-to-user payments without a Bitcoin fallback.
