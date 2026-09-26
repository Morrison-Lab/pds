# Probability prerequisites

Code

Published

Last modified: 2026-09-25 19:51:20 (PDT)

> Probability theory is the branch of mathematics concerned with formalizing and quantifying uncertainty. It is the foundation on which statistical inference is built: before we can reason about what data tell us about the world, we need a precise language for describing random phenomena.

These lecture notes use:

- probability axioms and conditional probability
- Bayes’ theorem
- random variables and their distributions (PMF, PDF, CDF)
- expectation and the Law of the Unconscious Statistician (LOTUS)
- variance and covariance
- independence and IID random variables

Some key results are listed here. Most of this material should be review from an introductory probability or mathematical statistics course (e.g., UC Davis’s Epi 202, WWU’s [previous course offerings](https://morrison-lab.github.io/mln/)). This page adapts its core results from the Morrison Lab’s [Probability chapter](https://morrison-lab.github.io/rme/chapters/probability.html), which also covers material outside this page’s scope (see [Additional resources](#sec-additional-resources)).

# 1 Notation

This page follows the notation used throughout the [Morrison Lab’s course materials](https://morrison-lab.github.io/rme/), summarized here.

- **Random variables** are denoted with uppercase letters (\\X\\, \\Y\\, \\Z\\), and their realized (observed) values with the matching lowercase letters (\\x\\, \\y\\, \\z\\). Some sources instead use uppercase/lowercase pairs from different alphabets, or reserve uppercase entirely for matrices — always check a new source’s own notation section before assuming ours.
- **Probability** is denoted \\\Pr()\\ or \\\operatorname{P}()\\ for a discrete event or a probability mass function, and \\\operatorname{p}()\\ for a continuous density. Some sources use \\P()\\ (unstylized) throughout for both, or reserve \\f()\\ for densities and mass functions and use \\P()\\ only for event probabilities.
- **Expectation** is denoted \\\operatorname{E}\mathopen{}\left\[\cdot\right\]\mathclose{}\\. Some sources write \\\operatorname{E}\[\cdot\]\\ or \\\mathbb{E}\[\cdot\]\\ with square brackets instead of our braces-with-shorthand notation; the meaning is the same.
- **Independence** is denoted \\\perp\\\\\\\perp\\ (read “\\X \perp\\\\\\\perp Y\\” as “\\X\\ is independent of \\Y\\”). Some sources instead write \\X \perp Y\\ (a single \\\perp\\) or state independence only in prose.
- We write \\\stackrel{\text{def}}{=}\\ for an equality that holds **by definition**, to distinguish it from an equality that follows from other facts — most sources do not make this distinction typographically and use a bare \\=\\ for both.
- The full macro list, with more notational variants, is in [`latex-macros`](https://github.com/d-morrison/macros).

# 2 Probability axioms and conditional probability

> **NOTE:**
>
> **Definition 1 (Probability measure)** A **probability measure**, often denoted \\\Pr()\\ or \\\operatorname{P}()\\, is a function whose domain is a [\\\sigma\\-algebra](https://en.wikipedia.org/wiki/%CE%A3-algebra) of possible outcomes, \\\mathscr{S}\\, and which satisfies:
>
> 1.  For any event \\A \in \mathscr{S}\\, \\\Pr(A) \ge 0\\.
> 2.  The probability of the union of all outcomes (\\\Omega \stackrel{\text{def}}{=}\cup \mathscr{S}\\) is 1: \\\Pr(\Omega) = 1\\
> 3.  For countably many mutually disjoint events \\A_1, A_2, \ldots\\ (where \\A_i \cap A_j = \emptyset\\ for all \\i \neq j\\), the probability of their union is the sum of their probabilities (*countable additivity*): \\\Pr\\\left(\bigcup\_{i=1}^{\infty} A_i\right) = \sum\_{i=1}^{\infty} \Pr(A_i)\\

A full treatment of \\\sigma\\-algebras and measure-theoretic probability is beyond the scope of this prerequisites page; see rme’s [Probability chapter](https://morrison-lab.github.io/rme/chapters/probability.html) for the definitions this page’s results build on (conditional expectations against joint densities, Fubini-Tonelli, and so on).

> **NOTE:**
>
> **Definition 2 (Conditional probability)** For two events \\A\\ and \\B\\ with \\\Pr(B) \> 0\\, the **conditional probability** of \\A\\ given \\B\\, denoted \\\Pr(A \mid B)\\, is:
>
> \\\Pr(A \mid B) \stackrel{\text{def}}{=}\frac{\Pr(A \cap B)}{\Pr(B)}\\

> **NOTE:**
>
> **Theorem 1 (Law of conditional probability)** For any two events \\A\\ and \\B\\ with \\\Pr(B) \> 0\\:
>
> \\\Pr(A \cap B) = \Pr(A \mid B) \cdot\Pr(B)\\

> **NOTE:**
>
> *Proof*. Rearranging [Definition 2](#def-conditional-prob):
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ \Pr(A \cap B) &= \Pr(A \mid B) \cdot\Pr(B) && \text{(multiply both sides by } \Pr(B) \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 1 (Applying the law of conditional probability)** Suppose 30% of adults exercise regularly (\\\Pr(E) = 0.30\\), and among adults who exercise regularly, 60% have low blood pressure (\\\Pr(L \mid E) = 0.60\\).
>
> Then the probability that a randomly selected adult both exercises regularly and has low blood pressure is:
>
> \\ \begin{aligned} \Pr(L \cap E) &= \Pr(L \mid E) \cdot\Pr(E) && \text{(law of conditional probability, @thm-law-conditional-prob)} \\ &= 0.60 \cdot 0.30 && \text{(substitute the given values)} \\ &= 0.18 && \text{(multiply)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 2 (Law of total probability)** If \\B_1, B_2, \ldots\\ is a countable partition of the sample space (countably many mutually exclusive events whose union is the entire sample space), then for any event \\A\\:
>
> \\\Pr(A) = \sum\_{i=1}^{\infty} \Pr(A \mid B_i) \cdot\Pr(B_i)\\

> **NOTE:**
>
> *Proof*. Since \\B_1, B_2, \ldots\\ partition the sample space, the events \\A \cap B_1, A \cap B_2, \ldots\\ are mutually exclusive and their union is \\A\\. By countable additivity ([Definition 1](#def-probability)), and then by [Theorem 1](#thm-law-conditional-prob):
>
> \\ \begin{aligned} \Pr(A) &= \sum\_{i=1}^{\infty} \Pr(A \cap B_i) && \text{(countable additivity for partition of } A \text{)} \\&= \sum\_{i=1}^{\infty} \Pr(A \mid B_i) \cdot\Pr(B_i) && \text{(law of conditional probability)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 3 (Bayes’ theorem)** For any two events \\A\\ and \\B\\ with \\\Pr(A) \> 0\\ and \\\Pr(B) \> 0\\:
>
> \\\Pr(A \mid B) = \frac{\Pr(B \mid A) \cdot\Pr(A)}{\Pr(B)}\\

> **NOTE:**
>
> *Proof*. \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability, @def-conditional-prob)} \\ &= \frac{\Pr(B \cap A)}{\Pr(B)} && \text{(intersection is commutative: } A \cap B = B \cap A \text{)} \\ &= \frac{\Pr(B \mid A) \cdot\Pr(A)}{\Pr(B)} && \text{(@thm-law-conditional-prob applied to } \Pr(B \cap A) \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 2 (Positive predictive value of a medical test)** Suppose a disease test has 99% sensitivity and 99% specificity, and the prevalence of the disease in the population is 7%.
>
> Let \\D\\ be the event “person has the disease” and \\+\\ be the event “test is positive”. Then:
>
> - \\\Pr(+ \mid D) = 0.99\\ (sensitivity)
> - \\\Pr(\neg + \mid \neg D) = 0.99\\ (specificity), so the false positive rate is \\\Pr(+ \mid \neg D) = 1 - 0.99 = 0.01\\
> - \\\Pr(D) = 0.07\\ (prevalence)
>
> \\ \begin{aligned} \Pr(D \mid +) &= \frac{\Pr(+ \mid D) \cdot\Pr(D)}{\Pr(+)} && \text{(Bayes' theorem, @thm-bayes)} \\ &= \frac{\Pr(+ \mid D) \cdot\Pr(D)}{\Pr(+ \mid D) \cdot\Pr(D) + \Pr(+ \mid \neg D) \cdot\Pr(\neg D)} && \text{(law of total probability, @thm-total-prob)} \\ &= \frac{0.99 \cdot 0.07}{0.99 \cdot 0.07 + 0.01 \cdot 0.93} && \text{(substitute the given values)} \\ &= \frac{0.0693}{0.0693 + 0.0093} && \text{(multiply each term in the numerator and denominator)} \\ &= \frac{0.0693}{0.0786} && \text{(add the denominator's two terms)} \\ &\approx 0.88 && \text{(divide)} \end{aligned} \\
>
> Even with a highly accurate test (99% sensitive and 99% specific), only about 88% of people who test positive actually have the disease, because the disease prevalence is relatively low (7%).

# 3 Random variables and distributions

> **NOTE:**
>
> **Definition 3 (Random variable)** A **random variable** is a variable whose value is a numerical outcome of a random phenomenon. Formally, it is a function from a sample space \\\Omega\\ (the set of all possible outcomes of an experiment) to the real numbers \\\mathbb{R}\\.
>
> We use uppercase letters (\\X\\, \\Y\\, \\Z\\, …) for random variables, and lowercase letters (\\x\\, \\y\\, \\z\\, …) for their realized (observed) values. The **range** of a random variable \\X\\, denoted \\\mathcal{R}(X)\\, is the set of values \\X\\ can take.

A random variable is **discrete** if its range \\\mathcal{R}(X)\\ is finite or countably infinite (e.g., a coin flip, a count), and **continuous** if its range is an interval of real numbers (e.g., a height, a waiting time). This distinction determines whether a [probability mass function](#def-pmf) (discrete) or [probability density function](#def-pdf) (continuous) describes \\X\\’s distribution.

See also: <https://en.wikipedia.org/wiki/Random_variable>

> **NOTE:**
>
> **Definition 4 (Probability mass function (PMF))** If \\X\\ is a discrete [random variable](#def-random-variable), the **probability mass function** of \\X\\ at value \\x\\, denoted \\f(x)\\, \\f_X(x)\\, \\\operatorname{P}(x)\\, \\\operatorname{P}\_X(x)\\, or \\\operatorname{P}(X=x)\\, is the probability that \\X\\ takes exactly the value \\x\\:
>
> \\\operatorname{P}(X=x) \stackrel{\text{def}}{=}\Pr(\\X=x\\)\\

See also <https://en.wikipedia.org/wiki/Probability_mass_function>

> **NOTE:**
>
> **Definition 5 (Probability density function (PDF))** If \\X\\ is a continuous [random variable](#def-random-variable), the **probability density** of \\X\\ at value \\x\\, denoted \\f(x)\\, \\f_X(x)\\, \\\operatorname{p}(x)\\, \\\operatorname{p}\_X(x)\\, or \\\operatorname{p}(X=x)\\, is the limit of the [probability](#def-probability) that \\X\\ falls in an interval around \\x\\, divided by the width of that interval, as that width shrinks to 0:
>
> \\ \begin{aligned} f(x) &\stackrel{\text{def}}{=}\lim\_{\Delta \rightarrow 0} \frac{\operatorname{P}(X \in \[x, x + \Delta\])}{\Delta} \end{aligned} \\

See also <https://en.wikipedia.org/wiki/Probability_density_function#Formal_definition>

> **NOTE:**
>
> **Definition 6 (Cumulative distribution function (CDF))** For a random variable \\X\\ (discrete or continuous), its **cumulative distribution function** is:
>
> \\F(t) \stackrel{\text{def}}{=}\Pr(X\le t), \quad t\in\mathbb{R}.\\

The CDF is always defined, whether \\X\\ is discrete or continuous, and it fully characterizes \\X\\’s distribution. For a continuous \\X\\ with density \\f\\, \\F(t) = \int\_{-\infty}^t f(x)\\dx\\ and, wherever \\F\\ is differentiable, \\f(t) = \frac{\partial}{\partial t}F(t)\\.

See also <https://en.wikipedia.org/wiki/Cumulative_distribution_function>

# 4 Expectation

> **NOTE:**
>
> **Definition 7 (Expectation, expected value, population mean)** The **expectation**, **expected value**, or **population mean** of a *continuous* random variable \\X\\, denoted \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\\, \\\mu(X)\\, or \\\mu_X\\, is the weighted mean of \\X\\’s possible values, weighted by the [probability density function](#def-pdf) of those values:
>
> \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} \stackrel{\text{def}}{=}\int\_{x\in \mathcal{R}(X)} x \cdot \operatorname{p}(X=x)\\dx\\
>
> The **expectation**, **expected value**, or **population mean** of a *discrete* random variable \\X\\, denoted \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\\, \\\mu(X)\\, or \\\mu_X\\, is the mean of \\X\\’s possible values, weighted by the [probability mass function](#def-pmf) of those values:
>
> \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} \stackrel{\text{def}}{=}\sum\_{x \in \mathcal{R}(X)} x \cdot \operatorname{P}(X=x)\\

See also <https://en.wikipedia.org/wiki/Expected_value>

> **NOTE:**
>
> **Example 3 (Expectation of a Bernoulli random variable)** Let \\X \sim \operatorname{Ber}(\pi)\\, so \\\mathcal{R}(X) = \\0,1\\\\ with \\\operatorname{P}(X=1) = \pi\\ and \\\operatorname{P}(X=0) = 1-\pi\\. By [Definition 7](#def-expectation):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} &= \sum\_{x\in \mathopen{}\left\\0,1\right\\\mathclose{}} x \cdot\operatorname{P}(X=x) && \text{(definition of expectation for discrete r.v.)} \\&= \mathopen{}\left(0 \cdot\operatorname{P}(X=0)\right)\mathclose{} + \mathopen{}\left(1 \cdot\operatorname{P}(X=1)\right)\mathclose{} && \text{(expand sum over } x = 0 \text{ and } x = 1 \text{)} \\&= \mathopen{}\left(0 \cdot(1-\pi)\right)\mathclose{} + \mathopen{}\left(1 \cdot\pi\right)\mathclose{} && \text{(substitute Bernoulli PMF values)} \\&= 0 + \pi && \text{(simplify each term)} \\&= \pi \end{aligned} \\

> **NOTE:**
>
> **Theorem 4 (Law of the Unconscious Statistician (LOTUS))** **Discrete case.** For any function \\g\\ of a *discrete* random variable \\X\\:
>
> \\\operatorname{E}\mathopen{}\left\[g(X)\right\]\mathclose{} = \sum\_{x \in \mathcal{R}(X)} g(x) \cdot\operatorname{P}(X=x)\\
>
> **Continuous case.** For any function \\g\\ of a *continuous* random variable \\X\\ with density \\\operatorname{p}(X=x)\\:
>
> \\\operatorname{E}\mathopen{}\left\[g(X)\right\]\mathclose{} = \int\_{x \in \mathcal{R}(X)} g(x) \cdot\operatorname{p}(X=x)\\ dx\\

> **NOTE:**
>
> *Proof*. We prove the discrete case.
>
> Let \\Y = g(X)\\. By [Definition 7](#def-expectation) applied to \\Y\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[g(X)\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(substitution } Y = g(X) \text{)} \\&= \sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y=y) && \text{(definition of expectation for discrete r.v.)} \\&= \sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(g(X)=y) && \text{(substitute } Y = g(X) \text{ in probability expression)} \\&= \sum\_{y \in \mathcal{R}(Y)} y \cdot\sum\_{\substack{x \in \mathcal{R}(X) \\ g(x) = y}} \operatorname{P}(X=x) && \text{(law of total probability over } \\x : g(x) = y\\ \text{)} \\&= \sum\_{x \in \mathcal{R}(X)} g(x) \cdot\operatorname{P}(X=x) && \text{(rearrange double sum grouping by } g(x) \text{)} \end{aligned} \\
>
> where the last equality follows by rearranging the double sum, grouping each term \\x\\ by its image \\y = g(x)\\.

LOTUS says that to compute \\\operatorname{E}\mathopen{}\left\[g(X)\right\]\mathclose{}\\, we do not need to first find the distribution of \\g(X)\\; we can compute the expectation directly using the distribution of \\X\\. The continuous case is the density-weighted analogue of this argument; see rme’s [Probability chapter](https://morrison-lab.github.io/rme/chapters/probability.html#thm-lotus) for the fully rigorous continuous-case proof, which relies on a change-of-variables theorem beyond this page’s scope.

> **NOTE:**
>
> **Example 4 (Expected value of \\X^2\\ for a Bernoulli variable)** Let \\X \sim \operatorname{Ber}(\pi)\\. By LOTUS ([Theorem 4](#thm-lotus), discrete case):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} &= \sum\_{x \in \mathopen{}\left\\0,1\right\\\mathclose{}} x^2 \cdot\operatorname{P}(X=x) && \text{(LOTUS, discrete case)} \\ &= 0^2 \cdot\operatorname{P}(X=0) + 1^2 \cdot\operatorname{P}(X=1) && \text{(expand sum over } x = 0 \text{ and } x = 1 \text{)} \\ &= 0^2 \cdot(1-\pi) + 1^2 \cdot\pi && \text{(substitute Bernoulli PMF values)} \\ &= 0 + \pi && \text{(simplify each term)} \\ &= \pi \end{aligned} \\

> **NOTE:**
>
> **Example 5 (Expected value of \\X^2\\ for a Uniform(0,1) variable)** Let \\X \sim \text{Uniform}(0,1)\\, so \\\operatorname{p}(X=x) = 1\\ for \\x \in \[0,1\]\\. By LOTUS ([Theorem 4](#thm-lotus), continuous case):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} &= \int_0^1 x^2 \cdot\operatorname{p}(X=x)\\dx && \text{(LOTUS, continuous case)} \\&= \int_0^1 x^2 \cdot 1\\dx && \text{(}\operatorname{p}(X=x) = 1\text{ on } \[0,1\]\text{)} \\&= \mathopen{}\left\[\frac{x^3}{3}\right\]\mathclose{}\_0^1 && \text{(antiderivative of } x^2\text{)} \\&= \frac{1}{3}. && \text{(evaluate at the bounds)} \end{aligned} \\

# 5 Variance and covariance

> **NOTE:**
>
> **Definition 8 (Variance)** The **variance** of a random variable \\X\\ is the expected squared deviation of \\X\\ from its own mean:
>
> \\\operatorname{Var}\mathopen{}\left(X\right)\mathclose{} \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[(X - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})^2\right\]\mathclose{}\\

> **NOTE:**
>
> **Theorem 5 (Simplified expression for variance)** \\\operatorname{Var}\mathopen{}\left(X\right)\mathclose{}=\operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} - \mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{}\\

> **NOTE:**
>
> *Proof*. By linearity of expectation:
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(X\right)\mathclose{} &\stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})^2\right\]\mathclose{} && \text{(definition of variance)} \\ &=\operatorname{E}\mathopen{}\left\[X^2 - 2X\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{}\right\]\mathclose{} && \text{(expand binomial square)} \\ &=\operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[2X\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[\mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{}\right\]\mathclose{} && \text{(linearity of expectation)} \\ &=\operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} - 2\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{} && \text{(constants factor out of expectation)} \\ &=\operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} - \mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{} && \text{(algebraic simplification)} \end{aligned} \\

> **NOTE:**
>
> **Definition 9 (Standard deviation)** The **standard deviation** of a random variable \\X\\ is the square root of the [variance](#def-variance) of \\X\\:
>
> \\\operatorname{SD}\mathopen{}\left(X\right)\mathclose{} \stackrel{\text{def}}{=}\sqrt{\operatorname{Var}\mathopen{}\left(X\right)\mathclose{}}\\

The standard deviation is on the same scale as \\X\\ itself (unlike the variance, which is on the scale of \\X\\’s square), which is why it is often the preferred measure of spread when reporting results.

> **NOTE:**
>
> **Definition 10 (Covariance)** For any two random variables \\X, Y\\:
>
> \\\operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{} \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[(X - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})(Y - \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})\right\]\mathclose{}\\

> **NOTE:**
>
> **Theorem 6 (Alternative formula for covariance)** \\\operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{}= \operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\\

> **NOTE:**
>
> *Proof*. By linearity of expectation, analogous to [Theorem 5](#thm-variance)’s proof:
>
> \\ \begin{aligned} \operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{} &\stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})\right\]\mathclose{} && \text{(definition of covariance)} \\ &= \operatorname{E}\mathopen{}\left\[XY - X\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} - Y\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\right\]\mathclose{} && \text{(expand the product)} \\ &= \operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[X\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[Y\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\right\]\mathclose{} && \text{(linearity of expectation)} \\ &= \operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(constants factor out of expectation)} \\ &= \operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(algebraic simplification)} \end{aligned} \\

> **NOTE:**
>
> **Lemma 1 (The covariance of a variable with itself is its variance)** For any random variable \\X\\:
>
> \\\operatorname{Cov}\mathopen{}\left(X,X\right)\mathclose{} = \operatorname{Var}\mathopen{}\left(X\right)\mathclose{}\\

> **NOTE:**
>
> *Proof*. By the [alternative formula for covariance](#thm-alt-cov):
>
> \\ \begin{aligned} \operatorname{Cov}\mathopen{}\left(X,X\right)\mathclose{} &= \operatorname{E}\mathopen{}\left\[XX\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} \\&= \operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} - \mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{} \end{aligned} \\
>
> which is exactly the [simplified expression for variance](#thm-variance).

> **NOTE:**
>
> **Corollary 1 (Variance of a sum of two random variables)** For any two random variables \\X\\ and \\Y\\ and scalars \\a\\ and \\b\\:
>
> \\\operatorname{Var}\mathopen{}\left(aX + bY\right)\mathclose{} = a^2 \operatorname{Var}\mathopen{}\left(X\right)\mathclose{} + b^2 \operatorname{Var}\mathopen{}\left(Y\right)\mathclose{} + 2(a \cdot b) \operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{}\\

> **NOTE:**
>
> *Proof*. \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(aX+bY\right)\mathclose{} &\stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[\mathopen{}\left(aX+bY - \operatorname{E}\mathopen{}\left\[aX+bY\right\]\mathclose{}\right)\mathclose{}^2\right\]\mathclose{} && \text{(definition of variance, @def-variance)} \\ &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left(a(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}) + b(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})\right)\mathclose{}^2\right\]\mathclose{} && \text{(linearity of expectation)} \\ &= \operatorname{E}\mathopen{}\left\[a^2(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})^2 + 2(a \cdot b)(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}) + b^2(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})^2\right\]\mathclose{} && \text{(expand the square)} \\ &= a^2\operatorname{E}\mathopen{}\left\[(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})^2\right\]\mathclose{} + 2(a \cdot b)\operatorname{E}\mathopen{}\left\[(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})\right\]\mathclose{} + b^2\operatorname{E}\mathopen{}\left\[(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})^2\right\]\mathclose{} && \text{(linearity of expectation)} \\ &= a^2 \operatorname{Var}\mathopen{}\left(X\right)\mathclose{} + 2(a \cdot b) \operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{} + b^2 \operatorname{Var}\mathopen{}\left(Y\right)\mathclose{} && \text{(definitions of variance, @def-variance, and covariance, @def-cov)} \end{aligned} \\

This corollary is why two variables’ covariance matters for combining them: if \\X\\ and \\Y\\ are [independent](#def-indpt), \\\operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{}=0\\ and the variance of their sum is just the sum of their variances. See rme’s [Probability chapter](https://morrison-lab.github.io/rme/chapters/probability.html#thm-var-lincom) for the general \\n\\-variable version and the vector/matrix forms of variance and covariance.

# 6 Independence

> **NOTE:**
>
> **Definition 11 (Statistical independence)** A set of random variables \\X_1, \ldots, X_n\\ are **statistically independent** if their joint [probability](#def-probability) is equal to the product of their marginal [probabilities](#def-probability):
>
> \\\Pr(X_1=x_1, \ldots, X_n = x_n) = \prod\_{i=1}^n{\Pr(X_i=x_i)}\\

> **TIP:**
>
> The symbol for independence, \\\perp\\\\\\\perp\\, is essentially just \\\prod\\ upside-down. So the symbol can remind you of its definition.

> **NOTE:**
>
> **Definition 12 (Identically distributed)** A set of random variables \\X_1, \ldots, X_n\\ are **identically distributed** if they have the same range \\\mathcal{R}(X)\\ and if their marginal distributions \\\operatorname{P}(X_1=x_1), ..., \operatorname{P}(X_n=x_n)\\ are all equal to some shared distribution \\\operatorname{P}(X=x)\\:
>
> \\ \forall i\in \mathopen{}\left\\1:n\right\\\mathclose{}, \forall x \in \mathcal{R}(X): \operatorname{P}(X_i=x) = \operatorname{P}(X=x) \\

> **NOTE:**
>
> **Definition 13 (Independent and identically distributed)** A set of random variables \\X_1, \ldots, X_n\\ are **independent and identically distributed** (shorthand: “\\X_i\\ \operatorname{iid}\\”) if they are [statistically independent](#def-indpt) and [identically distributed](#def-ident).

The IID assumption is one of the most common assumptions in introductory statistics: it says a sample \\X_1, \ldots, X_n\\ can be treated as \\n\\ independent draws from a single shared distribution. See rme’s [Probability chapter](https://morrison-lab.github.io/rme/chapters/probability.html#def-cind) for the conditional versions of these definitions (conditional independence, conditional identical distribution), which relax IID to hold only given a set of covariates — the assumption underlying most regression models.

# 7 Additional resources

- Miller ([2017](#ref-problifesaver))
- Morrison Lab’s [Probability chapter](https://morrison-lab.github.io/rme/chapters/probability.html) (fuller treatment: joint densities, conditional expectations, Fubini-Tonelli, and a catalog of named distributions)

# References

Miller, Steven J. 2017. *The Probability Lifesaver: All the Tools You Need to Understand Chance*. A Princeton Lifesaver Study Guide. Princeton University Press. <https://doi.org/10.1515/9781400885381>.

Back to top
