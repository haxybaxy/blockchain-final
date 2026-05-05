#pagebreak()
= Introduction

Bitcoin is the first digital currency to see widespread adoption. Unlike e-cash schemes like Cha82 and CHL05, Bitcoin requires no trusted parties. Instead of a bank, Bitcoin uses a ledger known as "Blockchain" to keep record of user transactions. In an attempt to anonymise these records, users often employ many identities or _pseudonyms_; however, research has shown how anyone can _de-anonymize_ transactions by using publicly available information in the blockchain.

Consequently, users motivated enough to maintain their transactions private use _mixes_ to blur their transaction history. The user sends a set of coins to a trusted party (the _mix_), and after a time interval receives the same amount back in different coins. Mixes are however high risk for the following reasons:

+ The delay to reclaim coins must be large to allow enough coins to be mixed in.
+ The mix operator can trace coins.
+ The mix operator may steal coins.

Whilst users with "something to hide" are willing to take these risks, common users who care about their privacy do not. Not only is it in the user's interest to anonymise transactions, it is also in the currency's interest. Anonymising a coin's history helps ensure the coin remains fungible. By tracking a coin's history, an observer could claim it as _tainted_ (used in a crime) and refuse it, or _special_ and claim the value is higher (non-fungible).

These risks drove the development of Zerocoin. Zerocoin, developed by Miers et al., relies on zero-knowledge proofs to provide strong anonymity. Zerocoin acts as a trustless _mixer_ built on top of Bitcoin: coins are authenticated by proving, in zero-knowledge, that they belong to a public list of valid coins stored on the blockchain. Users can regularly "wash" their coins using the Zerocoin protocol and do not rely on a trusted entity.

Research recommends, however, to run day-to-day transactions on Bitcoin. Zerocoin transactions are more expensive and heavy in computation compared to normal Bitcoin transactions. The costs mostly originate from the zero-knowledge approach, which requires heavy computation and network burden. Furthermore, Zerocoin was not designed to be a currency in itself; one user cannot pay another directly in "zerocoins". Finally, Zerocoin makes transactions anonymous by unlinking a coin from its origin only; it does not hide the amount or other metadata about the transaction. Zerocash @zerocash addresses each of these limitations.

== Related Work

Prior to Zerocash, anonymous electronic cash had been studied in centralised settings (Chaum's e-cash, Cha82; Camenisch--Hohenberger--Lysyanskaya, CHL05) and in decentralised settings via Zerocoin (Miers et al., MGGR13). Centralised schemes assume a trusted bank to mint coins and prevent double-spending. Zerocoin removed the bank by leveraging zero-knowledge proofs over a public list of coin commitments stored on the Bitcoin ledger, but its proofs were large (~45 kB) and slow to verify (~450 ms). Concurrent work by Danezis et al. (DFKP13) also explored using zk-SNARKs in Zerocoin, but their construction has cost that grows superlinearly in the number of coins. Zerocash differs in two key respects: it provides a full-fledged anonymous payment system rather than a mixer, and its proof and verification cost are essentially constant in the size of the anonymity set.
