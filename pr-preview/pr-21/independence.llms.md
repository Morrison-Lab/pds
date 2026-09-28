# Independence

Code

Published

Last modified: 2026-09-28 14:21:13 (PDT)

> **NOTE:**
>
> **Definition 1 (Statistical independence)** Random variables \\X_1, \ldots, X_n\\ are **statistically independent** if, for all sets of real numbers \\A_1, \ldots, A_n\\, the [probability](probability-basics.llms.md#def-probability) that every \\X_i\\ falls in its set is the product of the individual probabilities:
>
> \\\Pr(X_1 \in A_1, \ldots, X_n \in A_n) = \prod\_{i=1}^n{\Pr(X_i \in A_i)}\\

We write \\X \perp\\\\\\\perp Y\\ for “\\X\\ and \\Y\\ are independent”. The symbol \\\perp\\\\\\\perp\\ is essentially \\\prod\\ upside-down, which can remind you of the definition.

For discrete random variables, independence is equivalent to the [joint PMF](random-variables.llms.md#def-joint-pmf) factoring, \\\operatorname{P}(X_1=x_1, \ldots, X_n = x_n) = \prod\_{i=1}^n{\operatorname{P}(X_i=x_i)}\\ for all \\x_1, \ldots, x_n\\. For continuous random variables with a [joint density](random-variables.llms.md#def-joint-pdf), it is equivalent to the joint density factoring the same way, and likewise for a [joint density-mass function](random-variables.llms.md#def-joint-density-mass) when one variable is discrete and the other continuous. The PMF form does not work as a definition for continuous random variables: there, both sides are \\0\\ at every point, so it would call every pair of continuous random variables independent.

> **NOTE:**
>
> **Example 1 (Two fair coin flips)** Flip two fair coins, and let \\X_1\\ and \\X_2\\ indicate heads on the first and second flip. Each of the four outcomes has probability \\1/4\\, so for example:
>
> \\\operatorname{P}(X_1 = 1, X_2 = 1) = \tfrac{1}{4} = \tfrac{1}{2} \cdot\tfrac{1}{2} = \operatorname{P}(X_1 = 1)\\\operatorname{P}(X_2 = 1)\\
>
> and the same factorization holds for the other three pairs of values, so \\X_1 \perp\\\\\\\perp X_2\\. In contrast, \\X_1\\ and the total number of heads, \\X_1 + X_2\\, are not independent: \\\operatorname{P}(X_1 = 0, X_1 + X_2 = 2) = 0\\, but \\\operatorname{P}(X_1 = 0)\\\operatorname{P}(X_1 + X_2 = 2) = \tfrac{1}{2} \cdot\tfrac{1}{4} = \tfrac{1}{8}\\.

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

In regression, \\\tilde{X}\\ is usually the full set of covariates \\(X_1, \ldots, X_n)\\, and a model usually also assumes that each \\Y_i\\ depends on the covariates only through its own \\X_i\\: \\\Pr(Y_i \in A_i \mid X_1 = x_1, \ldots, X_n = x_n) = \Pr(Y_i \in A_i \mid X_i = x_i)\\. Together, the two assumptions give the factorization \\\Pr(Y_1 \in A_1, \ldots, Y_n \in A_n \mid X_1 = x_1, \ldots, X_n = x_n) = \prod\_{i=1}^n{\Pr(Y_i \in A_i \mid X_i = x_i)}\\. That second assumption is a separate one, not part of conditional independence.

For continuous \\\tilde{X}\\, each ratio in the density form is the density of the \\Y\\’s under their conditional distribution given \\\tilde{X}= \tilde{x}\\, so both forms say the same thing: given \\\tilde{X}= \tilde{x}\\, the \\Y_i\\’s joint distribution factors.

Conditional independence neither implies nor is implied by independence.

> **NOTE:**
>
> **Example 2 (Two tests of the same patient)** Let \\X\\ indicate whether a patient has a disease, and let \\Y_1\\ and \\Y_2\\ indicate positive results on two tests whose errors are unrelated, so that \\Y_1\\ and \\Y_2\\ are conditionally independent given \\X\\. Suppose \\\Pr(X = 1) = 0.1\\, each test is positive with probability \\0.9\\ if \\X = 1\\ and with probability \\0.1\\ if \\X = 0\\. Then, by the [law of total probability](probability-basics.llms.md#thm-total-prob):
>
> \\ \begin{aligned} \Pr(Y_1 = 1, Y_2 = 1) &= (0.9)(0.9)(0.1) + (0.1)(0.1)(0.9) && \text{(condition on } X \text{; factor given } X \text{)} \\ &= 0.081 + 0.009 && \text{(multiply)} \\ &= 0.09 && \text{(add)} \end{aligned} \\
>
> but \\\Pr(Y_1 = 1) = (0.9)(0.1) + (0.1)(0.9) = 0.18\\, so \\\Pr(Y_1 = 1)\\\Pr(Y_2 = 1) = 0.0324 \ne 0.09\\: the tests are conditionally independent given \\X\\, but not independent.

> **NOTE:**
>
> **Example 3 (Two coins, given their total)** Let \\Y_1\\ and \\Y_2\\ indicate heads on two fair coin flips, which are independent ([Example 1](#exm-indpt)), and let \\X = Y_1 + Y_2\\ be the number of heads. Given \\X = 1\\, which has probability \\1/2\\, exactly one coin is heads, so:
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
> **Definition 3 (Identically distributed)** Random variables \\X_1, \ldots, X_n\\ are **identically distributed** if they all have the same [CDF](random-variables.llms.md#def-cdf):
>
> \\\forall i\in \mathopen{}\left\\1, \ldots, n\right\\\mathclose{}, \forall x \in \mathbb{R}: \Pr(X_i \le x) = \Pr(X_1 \le x)\\

For discrete random variables, this is equivalent to all of them having the same PMF. As with independence, the PMF form would not work as a definition in general: every continuous random variable has \\\Pr(X_i = x) = 0\\ at every \\x\\.

> **NOTE:**
>
> **Example 4 (Identically distributed but not independent)** In [Example 1](#exm-indpt), \\X_1\\ and \\1 - X_1\\ (the indicator of tails on the first flip) both take the values \\0\\ and \\1\\ with probability \\1/2\\ each, so they are identically distributed. They are not independent: knowing one determines the other.

> **NOTE:**
>
> **Definition 4 (Conditionally identically distributed)** Random variables \\Y_1, \ldots, Y_n\\ are **conditionally identically distributed** given random variables \\X_1, \ldots, X_n\\ if the conditional CDF of each \\Y_i\\ given \\X_i = x\\ is one shared function \\G(y \mid x)\\ of \\y\\ and \\x\\: for every \\i \in \mathopen{}\left\\1, \ldots, n\right\\\mathclose{}\\, every \\y\\, and every \\x\\ with \\\Pr(X_i = x) \> 0\\,
>
> \\\Pr(Y_i \le y \mid X_i = x) = G(y \mid x)\\
>
> When \\X_i\\ is continuous, the condition applies at every \\x\\ with \\\operatorname{p}(X_i = x) \> 0\\, with \\\Pr(Y_i \le y \mid X_i = x)\\ computed from densities: the integral of \\\operatorname{p}(X_i = x, Y_i = u) / \operatorname{p}(X_i = x)\\ over \\u \le y\\ (a sum over values \\u \le y\\ when \\Y_i\\ is discrete).

> **NOTE:**
>
> **Example 5 (A shared regression model)** Suppose each \\Y_i\\ is binary, with \\\Pr(Y_i = 1 \mid X_i = x) = \pi(x)\\ for one function \\\pi\\ shared by every \\i\\ (for instance, \\\pi(x) = x / (1 + x)\\ for a dose \\x \ge 0\\). Then \\Y_1, \ldots, Y_n\\ are conditionally identically distributed given \\X_1, \ldots, X_n\\, with \\G(y \mid x) = 1 - \pi(x)\\ for \\0 \le y \< 1\\ (and \\0\\ for \\y \< 0\\, \\1\\ for \\y \ge 1\\). Their marginal distributions can still differ: if participant 1 always receives dose \\0\\ and participant 2 always receives dose \\1\\, then \\\Pr(Y_1 = 1) = 0\\ but \\\Pr(Y_2 = 1) = 1/2\\.

> **NOTE:**
>
> **Definition 5 (Independent and identically distributed)** Random variables \\X_1, \ldots, X_n\\ are **independent and identically distributed** (shorthand: “\\X_i\\ \operatorname{iid}\\”) if they are [statistically independent](#def-indpt) and [identically distributed](#def-ident).

The IID assumption is one of the most common assumptions in introductory statistics: it says a sample \\X_1, \ldots, X_n\\ can be treated as \\n\\ independent draws from a single shared distribution.

> **NOTE:**
>
> **Example 6 (Repeated die rolls)** The results of \\n\\ rolls of the same fair die are IID: the rolls are independent, and each is uniform on \\\mathopen{}\left\\1, \ldots, 6\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 6 (Conditionally independent and identically distributed)** Random variables \\Y_1, \ldots, Y_n\\ are **conditionally independent and identically distributed** given \\X_1, \ldots, X_n\\ (shorthand: “\\Y_i \mid X_i\\ \operatorname{ciid}\\” or just “\\Y_i \mid X_i\\ \operatorname{iid}\\”) if \\Y_1, \ldots, Y_n\\ are [conditionally independent](#def-cind) given \\(X_1, \ldots, X_n)\\, each \\Y_i\\ depends on \\(X_1, \ldots, X_n)\\ only through \\X_i\\, and \\Y_1, \ldots, Y_n\\ are [conditionally identically distributed](#def-cident) given \\X_1, \ldots, X_n\\.

> **NOTE:**
>
> **Example 7 (The usual regression assumption)** In [Example 5](#exm-cident), if the \\Y_i\\ are also conditionally independent given all the doses, and each \\Y_i\\ depends on the doses only through its own \\X_i\\, then \\Y_i \mid X_i\\ \operatorname{ciid}\\, and the joint conditional PMF is \\\prod\_{i=1}^n{\pi(x_i)^{y_i}\mathopen{}\left(1 - \pi(x_i)\right)\mathclose{}^{1 - y_i}}\\: one shared function evaluated at each \\(x_i, y_i)\\.

> **TIP:**
>
> Hutchinson’s [Probability Refresher](https://facultyweb.cs.wwu.edu/~hutchib2/video_lectures/data371/#probability_refresher) (27 min) covers independence ([Hutchinson, n.d.](#ref-hutchinson_wwu_ml_videos)). The login for the video site is posted [on Canvas](https://wwu.instructure.com/courses/1906010/modules#module_3922392).

## References

Hutchinson, Brian. n.d. *DATA 471/571 (Machine Learning) and CSCI 481/581 (Deep Learning) Video Lectures*. Western Washington University. Accessed September 28, 2026. <https://facultyweb.cs.wwu.edu/~hutchib2/video_lectures/data371/>.

Back to top
