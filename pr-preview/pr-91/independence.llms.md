# Independence

Code

Published

Last modified: 2026-10-09 09:59:48 (PDT)

> **NOTE:**
>
> **Definition 1 (Statistical independence)** Random variables \\X_1, \ldots, X_n\\ are **statistically independent** if, for all sets of real numbers \\A_1, \ldots, A_n\\, the [probability](probability-basics.llms.md#def-probability) that every \\X_i\\ falls in its set is the product of the individual probabilities:
>
> \\\Pr(X_1 \in A_1, \ldots, X_n \in A_n) = \prod\_{i=1}^n{\Pr(X_i \in A_i)}\\

> **NOTE:**
>
> *Remark*. We write \\X \perp\\\\\\\perp Y\\ for “\\X\\ and \\Y\\ are independent”. The symbol \\\perp\\\\\\\perp\\ is essentially \\\prod\\ upside-down, which can remind you of the definition.

> **NOTE:**
>
> **Theorem 1 (Independence of discrete random variables: the joint PMF factors)** Discrete random variables \\X_1, \ldots, X_n\\ are [statistically independent](#def-indpt) if and only if their [joint PMF](random-variables.llms.md#def-joint-pmf) factors into the product of their PMFs: for all real numbers \\x_1, \ldots, x_n\\,
>
> \\\operatorname{P}(X_1=x_1, \ldots, X_n = x_n) = \prod\_{i=1}^n{\operatorname{P}(X_i=x_i)}\\

> **NOTE:**
>
> *Proof*. **Only if.** Take \\A_i = \mathopen{}\left\\x_i\right\\\mathclose{}\\ for each \\i\\ in [Definition 1](#def-indpt).
>
> **If.** Let \\A_1, \ldots, A_n\\ be sets of real numbers, and let \\C\\ be the set of tuples \\(x_1, \ldots, x_n)\\ with each \\x_i \in A_i \cap \mathcal{R}(X_i)\\. Each [range](random-variables.llms.md#def-range) \\\mathcal{R}(X_i)\\ is countable, so \\C\\ is countable. Each \\X_i\\ takes its values in \\\mathcal{R}(X_i)\\, so the event \\\mathopen{}\left\\X_1 \in A_1, \ldots, X_n \in A_n\right\\\mathclose{}\\ is the disjoint union of the events \\\mathopen{}\left\\X_1=x_1, \ldots, X_n = x_n\right\\\mathclose{}\\ over \\(x_1, \ldots, x_n) \in C\\:
>
> \\ \begin{aligned} \Pr(X_1 \in A_1, \ldots, X_n \in A_n) &= \sum\_{(x_1, \ldots, x_n) \in C} \operatorname{P}(X_1=x_1, \ldots, X_n = x_n) && \text{(countable additivity over the disjoint events } \mathopen{}\left\\X_1=x_1, \ldots, X_n = x_n\right\\\mathclose{} \text{)} \\ &= \sum\_{(x_1, \ldots, x_n) \in C} \prod\_{i=1}^n{\operatorname{P}(X_i = x_i)} && \text{(the joint PMF factors)} \\ &= \prod\_{i=1}^n{\sum\_{x_i \in A_i \cap \mathcal{R}(X_i)} \operatorname{P}(X_i = x_i)} && \text{(a sum over the product set } C \text{ of non-negative products factors)} \\ &= \prod\_{i=1}^n{\Pr(X_i \in A_i)} && \text{(countable additivity over the disjoint events } \mathopen{}\left\\X_i = x_i\right\\\mathclose{} \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 1 (Two fair coin flips)** Flip two fair coins, and let \\X_1\\ and \\X_2\\ indicate heads on the first and second flip. Each of the four outcomes has probability \\1/4\\, so for example:
>
> \\ \begin{aligned} \operatorname{P}(X_1 = 1, X_2 = 1) &= \tfrac{1}{4} \\ &= \tfrac{1}{2} \cdot\tfrac{1}{2} \\ &= \operatorname{P}(X_1 = 1)\\\operatorname{P}(X_2 = 1) \end{aligned} \\
>
> and the same factorization holds for the other three pairs of values, so \\X_1 \perp\\\\\\\perp X_2\\ by [Theorem 1](#thm-indpt-pmf). In contrast, \\X_1\\ and the total number of heads, \\X_1 + X_2\\, are not independent: \\\operatorname{P}(X_1 = 0, X_1 + X_2 = 2) = 0\\, but
>
> \\ \begin{aligned} \operatorname{P}(X_1 = 0)\\\operatorname{P}(X_1 + X_2 = 2) &= \tfrac{1}{2} \cdot\tfrac{1}{4} \\ &= \tfrac{1}{8}. \end{aligned} \\

> **NOTE:**
>
> **Theorem 2 (Independence with densities: the joint density factors)** **Continuous case.** Continuous random variables \\X\\ and \\Y\\ with [densities](random-variables.llms.md#def-pdf) \\\operatorname{p}(X = x)\\ and \\\operatorname{p}(Y = y)\\ are [statistically independent](#def-indpt) if and only if the product \\\operatorname{p}(X = x)\\\operatorname{p}(Y = y)\\ is a [joint density](random-variables.llms.md#def-joint-pdf) of \\X\\ and \\Y\\.
>
> **Mixed case.** A discrete random variable \\X\\ and a continuous random variable \\Y\\ with density \\\operatorname{p}(Y = y)\\ are statistically independent if and only if the product \\\operatorname{P}(X = x)\\\operatorname{p}(Y = y)\\ is a [joint density-mass function](random-variables.llms.md#def-joint-density-mass) of \\X\\ and \\Y\\.

> **NOTE:**
>
> *Remark*. The proof is beyond these notes’ scope: it needs measure theory that the notes do not develop, to extend a density’s integrals from intervals to general sets and to exchange the order of integration ([Casella and Berger 2002](#ref-CaseBerg01); [Billingsley 1995](#ref-billingsley1995probability)). The continuous case extends to \\n\\ random variables with a joint density of all \\n\\. The statement says “a joint density” rather than “the joint density” because a density is not unique: changing it on a set of zero area (zero length, in the mixed case) changes none of its integrals.

> **NOTE:**
>
> **Example 2 (The PMF form fails for continuous random variables)** The factorization in [Theorem 1](#thm-indpt-pmf) does not work as a definition of independence for continuous random variables: there, both sides are \\0\\ at every point, so it would call every pair of continuous random variables independent. For instance, let \\X \sim \text{Uniform}(0, 1)\\ ([uniform distribution](random-variables.llms.md#def-uniform)), whose density is \\1\\ on \\\[0, 1\]\\, and let \\Y = X\\. For all real numbers \\x\\ and \\y\\, the event \\\mathopen{}\left\\X = x,\\ Y = y\right\\\mathclose{}\\ is \\\mathopen{}\left\\X = x\right\\\mathclose{}\\ if \\y = x\\ and empty otherwise, so it has probability \\0\\, because \\\Pr(X = x) = 0\\ for the [continuous](random-variables.llms.md#def-continuous-rv) \\X\\. Likewise
>
> \\ \begin{aligned} \Pr(X = x)\\\Pr(Y = y) &= 0 \cdot 0 \\ &= 0, \end{aligned} \\
>
> so the PMF form holds. But \\X\\ and \\Y\\ are not independent:
>
> \\ \begin{aligned} \Pr(X \in \[0, \tfrac{1}{2}\],\\ Y \in \[0, \tfrac{1}{2}\]) &= \Pr(X \in \[0, \tfrac{1}{2}\]) && \text{(} Y = X \text{)} \\ &= \int_0^{1/2} 1\\dx && \text{(the density of } X \text{ is } 1 \text{ on } \[0, 1\] \text{)} \\ &= \tfrac{1}{2} && \text{(integrate)} \end{aligned} \\
>
> while
>
> \\ \begin{aligned} \Pr(X \in \[0, \tfrac{1}{2}\])\\\Pr(Y \in \[0, \tfrac{1}{2}\]) &= \tfrac{1}{2} \cdot\tfrac{1}{2} \\ &= \tfrac{1}{4}. \end{aligned} \\

> **NOTE:**
>
> **Definition 2 (Conditional independence)** Random variables \\Y_1, \ldots, Y_n\\ are **conditionally independent** given a discrete random variable (or vector) \\\tilde{X}\\ if, for every value \\\tilde{x}\\ with \\\Pr(\tilde{X}= \tilde{x}) \> 0\\ and all sets of real numbers \\A_1, \ldots, A_n\\, the conditional probability that every \\Y_i\\ falls in its set is the product of the individual conditional probabilities:
>
> \\\Pr(Y_1 \in A_1, \ldots, Y_n \in A_n \mid \tilde{X}= \tilde{x}) = \prod\_{i=1}^n{\Pr(Y_i \in A_i \mid \tilde{X}= \tilde{x})}\\
>
> When \\\tilde{X}\\ is continuous, every event \\\\\tilde{X}= \tilde{x}\\\\ has probability 0, so the condition is stated with densities instead: for every \\\tilde{x}\\ with \\\operatorname{p}(\tilde{X}= \tilde{x}) \> 0\\ and all \\y_1, \ldots, y_n\\,
>
> \\\frac{\operatorname{p}(\tilde{X}= \tilde{x}, Y_1 = y_1, \ldots, Y_n = y_n)}{\operatorname{p}(\tilde{X}= \tilde{x})} = \prod\_{i=1}^n{\frac{\operatorname{p}(\tilde{X}= \tilde{x}, Y_i = y_i)}{\operatorname{p}(\tilde{X}= \tilde{x})}}\\
>
> where each \\\operatorname{p}(\cdot)\\ is a [joint density](random-variables.llms.md#def-joint-pdf) (with probability masses in place of densities for any discrete \\Y_i\\, as in a [joint density-mass function](random-variables.llms.md#def-joint-density-mass)).

> **NOTE:**
>
> *Remark*. For continuous \\\tilde{X}\\, each ratio in the density form is the density of the \\Y\\’s under their conditional distribution given \\\tilde{X}= \tilde{x}\\, so both forms say the same thing: given \\\tilde{X}= \tilde{x}\\, the \\Y_i\\’s joint distribution factors.

> **NOTE:**
>
> **Example 3 (Two tests of the same patient)** Let \\X\\ indicate whether a patient has a disease, and let \\Y_1\\ and \\Y_2\\ indicate positive results on two tests whose errors are unrelated, so that \\Y_1\\ and \\Y_2\\ are conditionally independent given \\X\\. Suppose \\\Pr(X = 1) = 0.1\\, each test is positive with probability \\0.9\\ if \\X = 1\\ and with probability \\0.1\\ if \\X = 0\\. Then, by the [law of total probability](probability-basics.llms.md#thm-total-prob):
>
> \\ \begin{aligned} \Pr(Y_1 = 1, Y_2 = 1) &= (0.9)(0.9)(0.1) + (0.1)(0.1)(0.9) && \text{(condition on } X \text{; factor given } X \text{)} \\ &= 0.081 + 0.009 && \text{(multiply)} \\ &= 0.09 && \text{(add)} \end{aligned} \\
>
> but
>
> \\ \begin{aligned} \Pr(Y_1 = 1) &= (0.9)(0.1) + (0.1)(0.9) \\ &= 0.18, \end{aligned} \\
>
> so \\\Pr(Y_1 = 1)\\\Pr(Y_2 = 1) = 0.0324 \ne 0.09\\: the tests are conditionally independent given \\X\\, but not independent.

> **NOTE:**
>
> **Example 4 (Two coins, given their total)** Let \\Y_1\\ and \\Y_2\\ indicate heads on two fair coin flips, which are independent ([Example 1](#exm-indpt)), and let \\X = Y_1 + Y_2\\ be the number of heads. Given \\X = 1\\, which has probability \\1/2\\, exactly one coin is heads, so:
>
> \\ \begin{aligned} \Pr(Y_1 = 1, Y_2 = 1 \mid X = 1) &= \frac{\Pr(Y_1 = 1, Y_2 = 1, X = 1)}{\Pr(X = 1)} && \text{(definition of conditional probability)} \\ &= \frac{0}{1/2} && \text{(two heads make } X = 2 \text{, not } 1 \text{)} \\ &= 0 && \text{(divide)} \end{aligned} \\
>
> but
>
> \\ \begin{aligned} \Pr(Y_1 = 1 \mid X = 1) &= \frac{\Pr(Y_1 = 1, X = 1)}{\Pr(X = 1)} && \text{(definition of conditional probability)} \\ &= \frac{\Pr(Y_1 = 1, Y_2 = 0)}{\Pr(X = 1)} && \text{(} Y_1 = 1 \text{ and } X = 1 \text{ means } Y_2 = 0 \text{)} \\ &= \frac{1/4}{1/2} && \text{(substitute)} \\ &= \tfrac{1}{2} && \text{(divide)} \end{aligned} \\
>
> and likewise \\\Pr(Y_2 = 1 \mid X = 1) = 1/2\\, so the product of the conditional probabilities is \\1/4 \ne 0\\: \\Y_1\\ and \\Y_2\\ are independent, but not conditionally independent given \\X\\.

> **NOTE:**
>
> **Proposition 1 (Neither independence nor conditional independence implies the other)** There are random variables \\Y_1\\, \\Y_2\\, and \\X\\ such that \\Y_1\\ and \\Y_2\\ are [conditionally independent](#def-cind) given \\X\\ but not [independent](#def-indpt), and there are random variables \\Y_1\\, \\Y_2\\, and \\X\\ such that \\Y_1\\ and \\Y_2\\ are independent but not conditionally independent given \\X\\.

> **NOTE:**
>
> *Proof*. [Example 3](#exm-cind) gives the first case, and [Example 4](#exm-indpt-not-cind) gives the second.

> **NOTE:**
>
> **Example 5 (Wet roads, umbrellas, and rain)** Consider Brian Hutchinson’s intuitive illustration of conditional independence ([Hutchinson 2024](#ref-hutchinson2024data471)):
>
> Let \\w\\ denote wet roads, \\u\\ denote people carrying umbrellas, and \\r\\ denote rain.
>
> - **Marginally, wet roads and umbrellas are not independent (\\w \not\perp u\\).** If you look out a window and see people holding open umbrellas, that increases the probability that the pavement outside is wet.
> - **Conditionally on rain, they are independent (\\w \perp u \mid r\\).** Once you know with certainty whether it is currently raining, learning whether pedestrians are carrying umbrellas tells you nothing more about the state of the roads:
>
> \\\Pr(w, u \mid r) = \Pr(w \mid r)\\\Pr(u \mid r), \qquad \Pr(w \mid u, r) = \Pr(w \mid r)\\

> **NOTE:**
>
> **Proposition 2 (Conditional independence when each \\Y_i\\ depends only on its own \\X_i\\)** Let \\\tilde{X}= (X_1, \ldots, X_n)\\ be a discrete random vector, and let \\Y_1, \ldots, Y_n\\ be [conditionally independent](#def-cind) given \\\tilde{X}\\. Suppose also that each \\Y_i\\ depends on \\\tilde{X}\\ only through \\X_i\\: for every \\\tilde{x}= (x_1, \ldots, x_n)\\ with \\\Pr(\tilde{X}= \tilde{x}) \> 0\\ and every set of real numbers \\A_i\\,
>
> \\\Pr(Y_i \in A_i \mid \tilde{X}= \tilde{x}) = \Pr(Y_i \in A_i \mid X_i = x_i)\\
>
> Then, for every such \\\tilde{x}\\ and all sets of real numbers \\A_1, \ldots, A_n\\:
>
> \\\Pr(Y_1 \in A_1, \ldots, Y_n \in A_n \mid \tilde{X}= \tilde{x}) = \prod\_{i=1}^n{\Pr(Y_i \in A_i \mid X_i = x_i)}\\

> **NOTE:**
>
> *Proof*. Each conditional probability given \\X_i = x_i\\ is defined, because \\\Pr(X_i = x_i) \ge \Pr(\tilde{X}= \tilde{x}) \> 0\\. So:
>
> \\ \begin{aligned} \Pr(Y_1 \in A_1, \ldots, Y_n \in A_n \mid \tilde{X}= \tilde{x}) &= \prod\_{i=1}^n{\Pr(Y_i \in A_i \mid \tilde{X}= \tilde{x})} && \text{(conditional independence given } \tilde{X}\text{)} \\ &= \prod\_{i=1}^n{\Pr(Y_i \in A_i \mid X_i = x_i)} && \text{(each } Y_i \text{ depends on } \tilde{X}\text{ only through } X_i \text{)} \end{aligned} \\

> **NOTE:**
>
> *Remark*. In regression, \\\tilde{X}\\ is usually the full set of covariates \\(X_1, \ldots, X_n)\\, and a model usually also assumes, as [Proposition 2](#prp-cind-own-covariate) does, that each \\Y_i\\ depends on the covariates only through its own \\X_i\\. That second assumption is a separate one, not part of conditional independence.

> **NOTE:**
>
> **Definition 3 (Identically distributed)** Random variables \\X_1, \ldots, X_n\\ are **identically distributed** if they all have the same [CDF](random-variables.llms.md#def-cdf):
>
> \\\forall i\in \mathopen{}\left\\1, \ldots, n\right\\\mathclose{}, \forall x \in \mathbb{R}: \Pr(X_i \le x) = \Pr(X_1 \le x)\\

> **NOTE:**
>
> **Theorem 3 (Identically distributed discrete random variables have the same PMF)** Discrete random variables \\X_1, \ldots, X_n\\ are [identically distributed](#def-ident) if and only if they all have the same [PMF](random-variables.llms.md#def-pmf): for every \\i \in \mathopen{}\left\\1, \ldots, n\right\\\mathclose{}\\ and every real number \\x\\,
>
> \\\operatorname{P}(X_i = x) = \operatorname{P}(X_1 = x)\\

> **NOTE:**
>
> *Proof*. Write \\F_i(t) \stackrel{\text{def}}{=}\Pr(X_i \le t)\\ for the CDF of \\X_i\\.
>
> **Only if: the CDF determines the PMF through its jumps.** Fix \\i\\ and \\x\\. Every number below \\x\\ lies in exactly one of the intervals \\(-\infty, x - 1\]\\, \\(x - 1, x - \tfrac{1}{2}\]\\, \\(x - \tfrac{1}{2}, x - \tfrac{1}{3}\]\\, \\\ldots\\, so the event \\\mathopen{}\left\\X_i \< x\right\\\mathclose{}\\ is the disjoint union of the events \\B_1 \stackrel{\text{def}}{=}\mathopen{}\left\\X_i \le x - 1\right\\\mathclose{}\\ and \\B_k \stackrel{\text{def}}{=}\mathopen{}\left\\x - \tfrac{1}{k - 1} \< X_i \le x - \tfrac{1}{k}\right\\\mathclose{}\\ for \\k \ge 2\\, and for each \\K\\, the events \\B_1, \ldots, B_K\\ have union \\\mathopen{}\left\\X_i \le x - \tfrac{1}{K}\right\\\mathclose{}\\:
>
> \\ \begin{aligned} \Pr(X_i \< x) &= \sum\_{k=1}^{\infty} \Pr(B_k) && \text{(countable additivity)} \\ &= \lim\_{K \to \infty} \sum\_{k=1}^{K} \Pr(B_k) && \text{(definition of an infinite series)} \\ &= \lim\_{K \to \infty} \Pr(X_i \le x - \tfrac{1}{K}) && \text{(finite additivity)} \\ &= \lim\_{K \to \infty} F_i(x - \tfrac{1}{K}) && \text{(definition of the CDF)} \end{aligned} \\
>
> The event \\\mathopen{}\left\\X_i \le x\right\\\mathclose{}\\ is the disjoint union of \\\mathopen{}\left\\X_i \< x\right\\\mathclose{}\\ and \\\mathopen{}\left\\X_i = x\right\\\mathclose{}\\, so:
>
> \\ \begin{aligned} \operatorname{P}(X_i = x) &= \Pr(X_i \le x) - \Pr(X_i \< x) && \text{(finite additivity)} \\ &= F_i(x) - \Pr(X_i \< x) && \text{(definition of the CDF)} \\ &= F_i(x) - \lim\_{K \to \infty} F_i(x - \tfrac{1}{K}) && \text{(the display above)} \\ &= F_1(x) - \lim\_{K \to \infty} F_1(x - \tfrac{1}{K}) && \text{(} F_i = F_1 \text{)} \\ &= \operatorname{P}(X_1 = x) && \text{(the same two steps, for } X_1 \text{)} \end{aligned} \\
>
> **If: the PMF determines the CDF through sums.** Let \\S\\ be the set of values \\u\\ with \\\operatorname{P}(X_1 = u) \> 0\\. Since the PMFs are equal, \\S\\ is also the set of \\u\\ with \\\operatorname{P}(X_i = u) \> 0\\, so \\S \subseteq \mathcal{R}(X_i)\\ and \\S \subseteq \mathcal{R}(X_1)\\. For every real \\t\\, the event \\\mathopen{}\left\\X_i \le t\right\\\mathclose{}\\ is the disjoint union of the events \\\mathopen{}\left\\X_i = u\right\\\mathclose{}\\ over the countably many \\u \in \mathcal{R}(X_i)\\ with \\u \le t\\, so:
>
> \\ \begin{aligned} F_i(t) &= \sum\_{u \in \mathcal{R}(X_i),\\ u \le t} \operatorname{P}(X_i = u) && \text{(countable additivity)} \\ &= \sum\_{u \in S,\\ u \le t} \operatorname{P}(X_i = u) && \text{(drop the terms that are } 0 \text{)} \\ &= \sum\_{u \in S,\\ u \le t} \operatorname{P}(X_1 = u) && \text{(the PMFs are equal)} \\ &= \sum\_{u \in \mathcal{R}(X_1),\\ u \le t} \operatorname{P}(X_1 = u) && \text{(restore the terms that are } 0 \text{)} \\ &= F_1(t) && \text{(countable additivity)} \end{aligned} \\

> **NOTE:**
>
> *Remark*. As with independence ([Example 2](#exm-indpt-pmf-fails)), the PMF form would not work as a definition in general: every continuous random variable has \\\Pr(X_i = x) = 0\\ at every \\x\\.

> **NOTE:**
>
> **Example 6 (Identically distributed but not independent)** In [Example 1](#exm-indpt), \\X_1\\ and \\1 - X_1\\ (the indicator of tails on the first flip) both take the values \\0\\ and \\1\\ with probability \\1/2\\ each, so they are identically distributed ([Theorem 3](#thm-ident-pmf)). They are not independent: knowing one determines the other.

> **NOTE:**
>
> **Definition 4 (Conditionally identically distributed)** Random variables \\Y_1, \ldots, Y_n\\ are **conditionally identically distributed** given random variables \\X_1, \ldots, X_n\\ if the conditional CDF of each \\Y_i\\ given \\X_i = x\\ is one shared function \\G(y \mid x)\\ of \\y\\ and \\x\\: for every \\i \in \mathopen{}\left\\1, \ldots, n\right\\\mathclose{}\\, every \\y\\, and every \\x\\ with \\\Pr(X_i = x) \> 0\\,
>
> \\\Pr(Y_i \le y \mid X_i = x) = G(y \mid x)\\
>
> When \\X_i\\ is continuous, the condition applies at every \\x\\ with \\\operatorname{p}(X_i = x) \> 0\\, with \\\Pr(Y_i \le y \mid X_i = x)\\ computed from densities: the integral of \\\operatorname{p}(X_i = x, Y_i = u) / \operatorname{p}(X_i = x)\\ over \\u \le y\\ (a sum over values \\u \le y\\ when \\Y_i\\ is discrete).

> **NOTE:**
>
> **Example 7 (A shared regression model)** Suppose each \\Y_i\\ is binary, with \\\Pr(Y_i = 1 \mid X_i = x) = \pi(x)\\ for one function \\\pi\\ shared by every \\i\\ (for instance, \\\pi(x) = x / (1 + x)\\ for a dose \\x \ge 0\\). Then \\Y_1, \ldots, Y_n\\ are conditionally identically distributed given \\X_1, \ldots, X_n\\, with \\G(y \mid x) = 1 - \pi(x)\\ for \\0 \le y \< 1\\ (and \\0\\ for \\y \< 0\\, \\1\\ for \\y \ge 1\\). Their marginal distributions can still differ: if participant 1 always receives dose \\0\\ and participant 2 always receives dose \\1\\, then \\\Pr(Y_1 = 1) = 0\\ but \\\Pr(Y_2 = 1) = 1/2\\.

> **NOTE:**
>
> **Definition 5 (Independent and identically distributed)** Random variables \\X_1, \ldots, X_n\\ are **independent and identically distributed** (shorthand: “\\X_i\\ \operatorname{iid}\\”) if they are:
>
> - [statistically independent](#def-indpt), and
> - [identically distributed](#def-ident).

> **NOTE:**
>
> *Remark*. The IID assumption is one of the most common assumptions in introductory statistics: it says a sample \\X_1, \ldots, X_n\\ can be treated as \\n\\ independent draws from a single shared distribution.

> **NOTE:**
>
> **Example 8 (Repeated die rolls)** The results of \\n\\ rolls of the same fair die are IID: the rolls are independent, and each is uniform on \\\mathopen{}\left\\1, \ldots, 6\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 6 (Conditionally independent and identically distributed)** Random variables \\Y_1, \ldots, Y_n\\ are **conditionally independent and identically distributed** given \\X_1, \ldots, X_n\\ (shorthand: “\\Y_i \mid X_i\\ \operatorname{ciid}\\” or just “\\Y_i \mid X_i\\ \operatorname{iid}\\”) if:
>
> - \\Y_1, \ldots, Y_n\\ are [conditionally independent](#def-cind) given \\(X_1, \ldots, X_n)\\,
> - each \\Y_i\\ depends on \\(X_1, \ldots, X_n)\\ only through \\X_i\\, and
> - \\Y_1, \ldots, Y_n\\ are [conditionally identically distributed](#def-cident) given \\X_1, \ldots, X_n\\.

> **NOTE:**
>
> **Example 9 (The usual regression assumption)** In [Example 7](#exm-cident), if the \\Y_i\\ are also conditionally independent given all the doses, and each \\Y_i\\ depends on the doses only through its own \\X_i\\, then \\Y_i \mid X_i\\ \operatorname{ciid}\\, and the joint conditional PMF is \\\prod\_{i=1}^n{\pi(x_i)^{y_i}\mathopen{}\left(1 - \pi(x_i)\right)\mathclose{}^{1 - y_i}}\\: one shared function evaluated at each \\(x_i, y_i)\\.

> **TIP:**
>
> Hutchinson’s [Probability Refresher](https://facultyweb.cs.wwu.edu/~hutchib2/video_lectures/data371/#probability_refresher) (27 min) covers independence ([Hutchinson, n.d.](#ref-hutchinson_wwu_ml_videos)). The login for the video site is posted [on Canvas](https://wwu.instructure.com/courses/1906010/modules#module_3922392).

## References

Billingsley, Patrick. 1995. *Probability and Measure*. 3rd ed. Wiley Series in Probability and Mathematical Statistics. Wiley.

Casella, George, and Roger Berger. 2002. *Statistical Inference*. 2nd ed. Cengage Learning. <https://www.cengage.com/c/statistical-inference-2e-casella-berger/9780534243128/>.

Hutchinson, Brian. 2024. *DATA 471/571: Machine Learning*. Western Washington University.

Hutchinson, Brian. n.d. *DATA 471/571 (Machine Learning) and CSCI 481/581 (Deep Learning) Video Lectures*. Western Washington University. Accessed September 28, 2026. <https://facultyweb.cs.wwu.edu/~hutchib2/video_lectures/data371/>.

Back to top
