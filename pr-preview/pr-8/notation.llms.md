# Notation

Code

Published

Last modified: 2026-09-28 01:48:19 (PDT)

This page follows the notation used throughout the [Morrison Lab’s course materials](https://morrison-lab.github.io/rme/), summarized here.

- **Random variables** are denoted with uppercase letters (\\X\\, \\Y\\, \\Z\\), and their realized (observed) values with the matching lowercase letters (\\x\\, \\y\\, \\z\\). Some sources instead use uppercase/lowercase pairs from different alphabets, or reserve uppercase entirely for matrices — always check a new source’s own notation section before assuming ours.
- **Probability** is denoted \\\Pr()\\ or \\\operatorname{P}()\\ for the probability of an event, or for a probability mass function (PMF), and \\\operatorname{p}()\\ for a density. Some sources use \\P()\\ (unstylized) throughout for both, or reserve \\f()\\ for densities and mass functions and use \\P()\\ only for event probabilities.
- **Expectation** is denoted \\\operatorname{E}\mathopen{}\left\[\cdot\right\]\mathclose{}\\, with square brackets. Some sources write \\\mathbb{E}\[\cdot\]\\ (blackboard bold), or use parentheses, \\E(\cdot)\\; the meaning is the same.
- **Independence** is denoted \\\perp\\\\\\\perp\\ (read “\\X \perp\\\\\\\perp Y\\” as “\\X\\ is independent of \\Y\\”). Some sources instead write \\X \perp Y\\ (a single \\\perp\\) or state independence only in prose.
- **Complements** of events are denoted \\\neg A\\ (“not \\A\\”). Some sources write \\A^c\\ or \\\bar{A}\\.
- We write \\\stackrel{\text{def}}{=}\\ for an equality that holds **by definition**, to distinguish it from an equality that follows from other facts — most sources do not make this distinction typographically and use a bare \\=\\ for both.
- The full macro list, with more notational variants, is in [`latex-macros`](https://github.com/d-morrison/macros).

## 1 Stochastic vs. probabilistic vs. random

The terms “stochastic”, “probabilistic”, and “random” are frequently used in statistics and probability theory, often interchangeably in everyday conversation, but they carry nuanced technical distinctions.

### 1.1 Key distinction: modeling approach vs. phenomena

As noted in [Wikipedia](https://en.wikipedia.org/wiki/Stochastic):

> *Stochasticity* and *randomness* are technically distinct concepts: the former refers to a modeling approach, while the latter describes phenomena; in everyday conversation these terms are often used interchangeably.

### 1.2 Definitions

**Random** describes something that occurs by chance, without a deterministic pattern. It is the most general term, used to describe variables or occurrences whose outcome cannot be predicted precisely, only probabilistically. For example, we speak of “random variables” and “random events”.

> **NOTE:**
>
> The term “random” is sometimes used as shorthand for a uniform distribution (especially the discrete uniform distribution), but it can refer to any probability distribution.

**Stochastic** comes from the Greek \\\sigma\tau\acute{o}\chi o\varsigma\\ (*stókhos*), meaning “aim” or “guess” (see [etymology](https://www.etymonline.com/search?q=stochastic)). In mathematics, a **stochastic process** is formally defined as a collection of random variables indexed by a set, most often a set of times or locations. The term is almost always used in the context of processes or systems evolving in time or space under uncertain rules. Note that in probability theory, “stochastic process” and “random process” are synonyms ([Adler and Taylor 2009](#ref-Adler2009random); [Stirzaker 2005](#ref-Stirzaker2005probability); [Kallenberg 2002](#ref-Kallenberg2002foundations)).

**Probabilistic** refers to any model, reasoning, or method that explicitly involves probability theory. Probabilistic models assign probabilities to events or outcomes; they focus on quantifying and reasoning about uncertainty based on known or estimated distributions. While all stochastic models are probabilistic (since they use probabilities), not all probabilistic models need to describe processes evolving in time.

### 1.3 Summary of usage

| Term | What it describes | Typical use | Example |
|----|----|----|----|
| Random | Single variable or event | Random variable, random outcome | Coin toss, die roll |
| Stochastic | System or process in time/space | Stochastic process | Stock price evolution, Markov chain |
| Probabilistic | Approach/model using probability | Probabilistic model/reasoning | Bayesian inference, regression |

Table 1: Comparison of “random”, “stochastic”, and “probabilistic”

While some sources treat “stochastic” and “random” as practically synonymous, a common convention is to use “random” for variables and events, and “stochastic” for processes, especially to highlight temporal or spatial structure in the modeling.

### 1.4 Additional resources

- [Wikipedia: Stochastic](https://en.wikipedia.org/wiki/Stochastic)
- [Wikipedia: Stochastic process](https://en.wikipedia.org/wiki/Stochastic_process)
- [Mathematics Stack Exchange: What’s the difference between stochastic and random?](https://math.stackexchange.com/questions/114373/whats-the-difference-between-stochastic-and-random)
- [Cross Validated: Probability model vs statistical model vs stochastic model](https://stats.stackexchange.com/questions/421462/probability-model-vs-statistical-model-vs-stochastic-model)

## References

Adler, Robert J., and Jonathan E. Taylor. 2009. *Random Fields and Geometry*. Springer. <https://doi.org/10.1007/978-0-387-48116-6>.

Kallenberg, Olav. 2002. *Foundations of Modern Probability*. 2nd ed. Springer. <https://doi.org/10.1007/978-1-4757-4015-8>.

Stirzaker, David. 2005. *Stochastic Processes and Models*. Oxford University Press. <https://global.oup.com/academic/product/stochastic-processes-and-models-9780198568131>.

Back to top
