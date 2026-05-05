#pagebreak()

#set heading(numbering: none)
#show heading: set align(center)
= Abstract

This report reviews "Zerocash: Decentralized Anonymous Payments from Bitcoin" by Ben-Sasson et al. (2014), the paper that introduced the first practical fully anonymous decentralized payment scheme. The paper formalizes the notion of a Decentralized Anonymous Payment (DAP) scheme and instantiates it as Zerocash, a system that hides the origin, destination, and amount of every transaction using zero-knowledge Succinct Non-interactive Arguments of Knowledge (zk-SNARKs). We summarize the paper's technical contribution, its construction methodology, the integration strategy with existing ledger-based currencies, and the experimental evaluation. We then critically examine the empirical results, the practical interpretation of those results, the limitations of the construction, the improvements proposed by the authors and by subsequent work, and the lasting impact of the paper on blockchain research and industry.

#show heading: it => {
  block(
    it,
    below: 1em,
  )
}
#set heading(numbering: "1.a)")
