# Notation

Code

Published

Last modified: 2026-10-29 15:10:38 (PDT)

This page follows the notation used throughout the [Morrison Lab’s course materials](https://morrison-lab.github.io/rme/), summarized here.

- **Random variables** are denoted with uppercase letters (\\X\\, \\Y\\, \\Z\\), and their realized (observed) values with the matching lowercase letters (\\x\\, \\y\\, \\z\\).
- **Probability** is denoted \\\Pr()\\ or \\\mathbb{P}()\\ for the probability of an event, or for a probability mass function (PMF), and \\\operatorname{p}()\\ for a density.
- **Expectation** is denoted \\{\mathbb{E}\mathopen{}\left\[\cdot\right\]\mathclose{}}\\, with square brackets.
- **Independence** is denoted \\\perp\\\\\\\perp\\ (read “\\X \perp\\\\\\\perp Y\\” as “\\X\\ is independent of \\Y\\”).
- **Complements** of events are denoted \\\neg A\\ (“not \\A\\”).
- We write \\\stackrel{\text{def}}{=}\\ for an equality that holds **by definition**, to distinguish it from an equality that follows from other facts.
- Other sources often use other symbols for these. The [notation choices page](https://morrison-lab.github.io/macros/notation-choices.html#sec-probability-notation) lists the alternatives; always check a new source’s own notation section before assuming ours.
- The full macro list, with more notational variants, is in [`latex-macros`](https://github.com/Morrison-Lab/macros).

## 1 Stochastic vs. probabilistic vs. random

> **NOTE:**
>
> *Remark*. The terms “stochastic”, “probabilistic”, and “random” are frequently used in statistics and probability theory, often interchangeably in everyday conversation, but they carry nuanced technical distinctions.

### 1.1 Key distinction: modeling approach vs. phenomena

> **NOTE:**
>
> *Remark*. As noted in [Wikipedia](https://en.wikipedia.org/wiki/Stochastic):
>
> > *Stochasticity* and *randomness* are technically distinct concepts: the former refers to a modeling approach, while the latter describes phenomena; in everyday conversation these terms are often used interchangeably.

> **NOTE:**
>
> **Definition 1 (Random)** Something is **random** when it occurs by chance, without a deterministic pattern: its outcome cannot be predicted precisely, only probabilistically. It is the most general of the three terms, used to describe variables or occurrences rather than whole processes or modeling approaches.

> **NOTE:**
>
> *Remark*. The term “random” is sometimes used as shorthand for a uniform distribution (especially the discrete uniform distribution), but it can refer to any probability distribution.

> **NOTE:**
>
> **Example 1 (A random variable)** The result of a single die roll is random: it cannot be predicted with certainty, only described by the probability \\1/6\\ for each face. We speak of a “random variable” and a “random event” for exactly this kind of single outcome.

> **NOTE:**
>
> **Definition 2 (Stochastic process (random process))** A **stochastic process** is a collection of random variables indexed by a set, most often a set of times or locations. In probability theory, “stochastic process” and “**random process**” are synonyms [\[1\]](#ref-Adler2009random), [\[2\]](#ref-Stirzaker2005probability), [\[3\]](#ref-Kallenberg2002foundations).

> **NOTE:**
>
> *Remark 1* (The word “stochastic”). The word “stochastic” comes from the Greek \\\sigma\tau\acute{o}\chi o\varsigma\\ (*stókhos*), meaning “aim” or “guess” (see [etymology](https://www.etymonline.com/search?q=stochastic)). The term is almost always used for processes or systems evolving in time or space under uncertain rules, rather than for a single variable or event.

> **NOTE:**
>
> **Example 2 (Stock price evolution)** The sequence of a stock’s daily closing prices is a stochastic process: a random variable (the price) indexed by a set (the trading days).

> **NOTE:**
>
> **Definition 3 (Probabilistic)** A model, method, or line of reasoning is **probabilistic** when it explicitly involves probability theory: it assigns probabilities to events or outcomes, and focuses on quantifying and reasoning about uncertainty based on known or estimated distributions. While every stochastic model is probabilistic (since it uses probabilities), not every probabilistic model needs to describe a process evolving in time.

> **NOTE:**
>
> **Example 3 (A linear regression model)** A linear regression model with Gaussian errors, \\Y = \beta\_{0} + \beta\_{1} x + \varepsilon\\ with \\\varepsilon\sim {\operatorname{N}\mathopen{}\left(0, \sigma^2\right)\mathclose{}}\\, is probabilistic: for each value of the covariate \\x\\, it assigns a probability distribution to the outcome \\Y\\. It is not a stochastic process, because it describes the outcome at a given covariate value rather than a process evolving in time.

> **NOTE:**
>
> *Remark*. The model is probabilistic because of its error distribution, not because of the method used to fit it. The same model is probabilistic whether its parameters are estimated by maximum likelihood or by Bayesian inference. Bayesian inference additionally assigns a probability distribution to the parameters themselves, which makes the inference method probabilistic too.

### 1.2 Summary of usage

> **NOTE:**
>
> | Term | What it describes | Typical use | Example |
> |----|----|----|----|
> | Random | Single variable or event | Random variable, random outcome | Coin toss, die roll |
> | Stochastic | System or process in time/space | Stochastic process | Stock price evolution, Markov chain |
> | Probabilistic | Approach/model using probability | Probabilistic model/reasoning | Regression model, Bayesian inference |
>
> Table 1: Comparison of “random”, “stochastic”, and “probabilistic”

> **NOTE:**
>
> *Remark*. While some sources treat “stochastic” and “random” as practically synonymous, a common convention is to use “random” for variables and events, and “stochastic” for processes, especially to highlight temporal or spatial structure in the modeling.

### 1.3 Additional resources

> **NOTE:**
>
> *Remark*.
>
> - [Wikipedia: Stochastic](https://en.wikipedia.org/wiki/Stochastic)
> - [Wikipedia: Stochastic process](https://en.wikipedia.org/wiki/Stochastic_process)
> - [Mathematics Stack Exchange: What’s the difference between stochastic and random?](https://math.stackexchange.com/questions/114373/whats-the-difference-between-stochastic-and-random)
> - [Cross Validated: Probability model vs statistical model vs stochastic model](https://stats.stackexchange.com/questions/421462/probability-model-vs-statistical-model-vs-stochastic-model)

## References

\[1\]

R. J. Adler and J. E. Taylor, *Random fields and geometry*. New York: Springer, 2009. doi: [10.1007/978-0-387-48116-6](https://doi.org/10.1007/978-0-387-48116-6).

\[2\]

D. Stirzaker, *Stochastic processes and models*. Oxford: Oxford University Press, 2005. Available: <https://global.oup.com/academic/product/stochastic-processes-and-models-9780198568131>

\[3\]

O. Kallenberg, *Foundations of modern probability*, 2nd ed. New York: Springer, 2002. doi: [10.1007/978-1-4757-4015-8](https://doi.org/10.1007/978-1-4757-4015-8).

Back to top
