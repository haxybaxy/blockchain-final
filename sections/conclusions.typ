#pagebreak()
= Conclusion

Compared to Bitcoin and Zerocoin, Zerocash is far more privacy-enabling, allowing a high degree of privacy in a decentralised payment system. While Bitcoin exposes the details of transactions in a public ledger, and Zerocoin only partially addressed anonymity, Zerocash proposes a Decentralized Anonymous Payment scheme that hides sender, recipient, and amount using zk-SNARKs.

One of the strong points of the paper is that formal cryptographic definitions are combined with a practical construction. Mint and pour transactions, combined with zero-knowledge proofs, allow verifying transactions without disclosing sensitive information. Experimental findings also demonstrate significant improvements in efficiency compared to Zerocoin, with small proof sizes and quick verification, making the system viable at scale.

Zerocash still has its limitations, such as the requirement for a trusted setup, high proving costs, and exposure to network-level privacy leaks; but overall, the paper demonstrates that fully private decentralised payments are achievable and lays the foundation for future privacy-focused blockchain systems.

Beyond its immediate technical contribution, Zerocash showed that succinct zero-knowledge proofs can be made practical for general use, a result whose influence now extends far beyond anonymous payments. The same cryptographic machinery underpins modern blockchain scaling efforts such as zk-Rollups, powers programmable-privacy networks under active development, and continues to shape the conversation between researchers, regulators, and industry on how privacy and accountability can coexist on public ledgers. The paper therefore stands not merely as the foundation of a single cryptocurrency but as a turning point in how the field thinks about verifiable computation at scale.
