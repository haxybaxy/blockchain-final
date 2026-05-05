#pagebreak()
= Introduction

Bitcoin is the first digital currency to see widespread adoption. Unlike earlier e-cash schemes @chaum82 @chl05, Bitcoin requires no trusted parties. Instead of a bank, Bitcoin uses a ledger known as "Blockchain" to keep record of user transactions. In an attempt to anonymise these records, users often employ many identities or _pseudonyms_; however, research has shown how anyone can _de-anonymize_ transactions by using publicly available information in the blockchain.

Consequently, users motivated enough to maintain their transactions private use _mixes_ to blur their transaction history. The user sends a set of coins to a trusted party (the _mix_), and after a time interval receives the same amount back in different coins. Mixes are however high risk for the following reasons:

+ The delay to reclaim coins must be large to allow enough coins to be mixed in.
+ The mix operator can trace coins.
+ The mix operator may steal coins.

Whilst users with "something to hide" are willing to take these risks, common users who care about their privacy do not. Not only is it in the user's interest to anonymise transactions, it is also in the currency's interest. Anonymising a coin's history helps ensure the coin remains fungible. By tracking a coin's history, an observer could claim it as _tainted_ (used in a crime) and refuse it, or _special_ and claim the value is higher (non-fungible).

These risks drove the development of Zerocoin @mggr13. Zerocoin relies on zero-knowledge proofs to provide strong anonymity. Zerocoin acts as a trustless _mixer_ built on top of Bitcoin: coins are authenticated by proving, in zero-knowledge, that they belong to a public list of valid coins stored on the blockchain. Users can regularly "wash" their coins using the Zerocoin protocol and do not rely on a trusted entity.

Research recommends, however, to run day-to-day transactions on Bitcoin. Zerocoin transactions are more expensive and heavy in computation compared to normal Bitcoin transactions. The costs mostly originate from the zero-knowledge approach, which requires heavy computation and network burden. Furthermore, Zerocoin was not designed to be a currency in itself; one user cannot pay another directly in "zerocoins". Finally, Zerocoin makes transactions anonymous by unlinking a coin from its origin only; it does not hide the amount or other metadata about the transaction. Zerocash @zerocash addresses each of these limitations.

== Related Work

A vast amount of research has been done on anonymous e-cash. Bitcoin represented a new direction toward decentralised digital currency. Instead of relying on a single trusted bank, Bitcoin uses a decentralised ledger called the Blockchain. The Blockchain allows for peer-to-peer transactions without needing a trusted bank. Even though Bitcoin introduced many innovations toward decentralised digital currency, it did not achieve strong privacy. Due to this limitation, researchers began developing privacy-enhanced methods within the Bitcoin ecosystem.

While mixing services do enhance user privacy, as previously mentioned, they have several disadvantages. Decentralised alternatives to mixing services include CoinJoin. CoinJoin attempts to eliminate the need for a third party by coordinating transactions between multiple users. Unfortunately, CoinJoin suffers from scalability problems, high overhead for coordination, and is vulnerable to denial-of-service attacks.

Zerocoin @mggr13 represents a significant enhancement over existing solutions because it introduces a cryptographic protocol that serves as a decentralised mixer. Zerocoin is built as an extension to Bitcoin and allows users to transform bitcoins into anonymous coins and then redeem them at a future time without any relation to how the original transaction occurred. However, Zerocoin has its own limitations. Transaction processing is computationally intensive, requiring large proofs that must be verified and retained by the network. Furthermore, Zerocoin utilises fixed denominations, does not allow users to directly pay each other, and does not conceal either the transaction value or its metadata.

To address the above-mentioned limitations, recent research has focused on increasing both the performance and the functionality of anonymous cryptocurrencies. Zerocash @zerocash builds on the concepts of Zerocoin by employing advanced cryptographic primitives known as zk-SNARKs (Zero-Knowledge Succinct Non-Interactive Arguments of Knowledge). zk-SNARKs enable the creation of dramatically smaller proofs and significantly speed up the process of verifying them, thereby providing better performance characteristics than anonymous transactions had previously experienced. Importantly, Zerocash enables fully private transactions where neither the source nor the destination of funds are revealed, along with concealing the transaction value.

In comparison to previous solutions, Zerocash addresses the usability concerns associated with Zerocoin. It allows for direct payments between users and supports variable transaction values, addressing two of the most significant usability shortfalls of its predecessor. Similar to previous solutions, Zerocash operates on a public ledger without requiring the presence of a trusted entity, except for an initial setup phase. However, Zerocash achieves this improvement at the cost of additional computational intensity during proof generation.
