# Expectation

Code

- [Show All Code](javascript:void(0))

- [Hide All Code](javascript:void(0))

- 

  ------------------------------------------------------------------------

- [View Source](javascript:void(0))

Published

Last modified: 2026-10-06 17:45:53 (PDT)

> **NOTE:**
>
> **Definition 1 (Expectation, expected value, population mean)** The **expectation**, **expected value**, or **population mean** of a *discrete* random variable \\X\\, denoted \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\\, \\\mu(X)\\, or \\\mu_X\\, is the mean of \\X\\’s possible values, weighted by the [probability mass function](random-variables.llms.md#def-pmf) of those values:
>
> \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} \stackrel{\text{def}}{=}\sum\_{x \in \mathcal{R}(X)} x \cdot \operatorname{P}(X=x)\\
>
> The **expectation** of a *continuous* random variable \\X\\ with [probability density function](random-variables.llms.md#def-pdf) \\\operatorname{p}(X=x)\\ is the mean of \\X\\’s possible values, weighted by that density:
>
> \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} \stackrel{\text{def}}{=}\int\_{x\in \mathcal{R}(X)} x \cdot \operatorname{p}(X=x)\\dx\\
>
> In both cases, the expectation is defined only when the sum or integral converges absolutely, that is, when it is finite with \\\mathopen{}\left\|x\right\|\mathclose{}\\ in place of \\x\\.

> **NOTE:**
>
> *Remark*. See also <https://en.wikipedia.org/wiki/Expected_value>

> **NOTE:**
>
> **Example 1 (The standard Cauchy distribution has no expectation)** A random variable whose expectation is not defined is not exotic. Let \\X\\ have the standard Cauchy distribution, with density \\\operatorname{p}(X=x) = \frac{1}{\pi(1 + x^2)}\\ for every real \\x\\. For \\x \ge 0\\, \\\frac{1}{2\pi}\log(1 + x^2)\\ is an antiderivative of \\\mathopen{}\left\|x\right\|\mathclose{} \cdot\frac{1}{\pi(1 + x^2)} = \frac{x}{\pi(1 + x^2)}\\, and for \\x \le 0\\, \\-\frac{1}{2\pi}\log(1 + x^2)\\ is an antiderivative of \\\mathopen{}\left\|x\right\|\mathclose{} \cdot\frac{1}{\pi(1 + x^2)} = \frac{-x}{\pi(1 + x^2)}\\. So, integrating over each half-line:
>
> \\ \begin{aligned} \int\_{0}^{\infty} \mathopen{}\left\|x\right\|\mathclose{} \cdot\frac{1}{\pi(1 + x^2)}\\dx &= \lim\_{b \to \infty} \mathopen{}\left\[\frac{1}{2\pi}\log(1 + x^2)\right\]\mathclose{}\_{0}^{b} && \text{(antiderivative on } \[0, \infty) \text{)} \\ &= \lim\_{b \to \infty} \frac{1}{2\pi}\log(1 + b^2) && \text{(evaluate at the bounds; } \log 1 = 0 \text{)} \\ &= \infty && \text{(} \log(1 + b^2) \to \infty \text{ as } b \to \infty \text{)} \end{aligned} \\
>
> \\ \begin{aligned} \int\_{-\infty}^{0} \mathopen{}\left\|x\right\|\mathclose{} \cdot\frac{1}{\pi(1 + x^2)}\\dx &= \lim\_{a \to -\infty} \mathopen{}\left\[-\frac{1}{2\pi}\log(1 + x^2)\right\]\mathclose{}\_{a}^{0} && \text{(antiderivative on } (-\infty, 0\] \text{)} \\ &= \lim\_{a \to -\infty} \frac{1}{2\pi}\log(1 + a^2) && \text{(evaluate at the bounds; } \log 1 = 0 \text{)} \\ &= \infty && \text{(} \log(1 + a^2) \to \infty \text{ as } a \to -\infty \text{)} \end{aligned} \\
>
> Both halves diverge, so \\\int\_{-\infty}^{\infty} \mathopen{}\left\|x\right\|\mathclose{} \cdot\frac{1}{\pi(1 + x^2)}\\dx\\ diverges, and by [Definition 1](#def-expectation), \\X\\ has no expectation.

> **NOTE:**
>
> **Theorem 1 (Expectation of the Bernoulli distribution)** If \\X \sim \operatorname{Ber}(\pi)\\ ([Bernoulli distribution](random-variables.llms.md#def-bernoulli)), that is, \\\operatorname{P}(X = 1) = \pi\\ and \\\operatorname{P}(X = 0) = 1 - \pi\\, then:
>
> \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} = \pi\\

> **NOTE:**
>
> *Proof*. \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} &= \sum\_{x\in \mathcal{R}(X)} x \cdot\operatorname{P}(X=x) && \text{(definition of expectation for discrete r.v.)} \\&= \sum\_{x\in \mathopen{}\left\\0,1\right\\\mathclose{}} x \cdot\operatorname{P}(X=x) && \text{(range of Bernoulli r.v. is } \\0, 1\\ \text{)} \\&= \mathopen{}\left(0 \cdot\operatorname{P}(X=0)\right)\mathclose{} + \mathopen{}\left(1 \cdot\operatorname{P}(X=1)\right)\mathclose{} && \text{(expand sum over } x = 0 \text{ and } x = 1 \text{)} \\&= \mathopen{}\left(0 \cdot(1-\pi)\right)\mathclose{} + \mathopen{}\left(1 \cdot\pi\right)\mathclose{} && \text{(substitute Bernoulli PMF values)} \\&= 0 + \pi && \text{(multiplication by 0 and 1)} \\&= \pi && \text{(addition of 0)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 2 (Expectation of time-to-event variables)** If \\T\\ is a non-negative random variable with [survival function](random-variables.llms.md#def-surv-fn) \\\operatorname{S}(t)\\ and a defined expectation, then:
>
> \\\operatorname{E}\mathopen{}\left\[T\right\]\mathclose{} = \int\_{t=0}^{\infty} \operatorname{S}(t)\\dt\\

> **NOTE:**
>
> *Proof*. We prove the continuous case, in which \\T\\ has a density \\\operatorname{f}\\. The integrand \\\operatorname{f}(u) \cdot\mathbb{1}\mathopen{}\left(0 \le t \le u\right)\mathclose{}\\ is non-negative on \\\[0, \infty) \times \[0, \infty)\\, so Tonelli’s theorem (the non-negative case of the [Fubini–Tonelli theorem](https://morrison-lab.github.io/mds/calculus.html#thm-fubini-tonelli); Billingsley ([1995](#ref-billingsley1995probability)), Theorem 18.3) lets us exchange the order of integration:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[T\right\]\mathclose{} &= \int\_{u=0}^{\infty} u\\\operatorname{f}(u)\\du && \text{(definition of expectation; } T \ge 0 \text{)}\\ &= \int\_{u=0}^{\infty}\mathopen{}\left(\int\_{t=0}^{u} 1\\dt\right)\mathclose{}\operatorname{f}(u)\\du && \text{(} u = \textstyle\int_0^u 1\\dt \text{)}\\ &= \int\_{u=0}^{\infty}\int\_{t=0}^{u} \operatorname{f}(u)\\dt\\du && \text{(move } \operatorname{f}(u) \text{ inside the inner integral)}\\ &= \int\_{t=0}^{\infty}\int\_{u=t}^{\infty} \operatorname{f}(u)\\du\\dt && \text{(Tonelli: exchange the order over } 0 \le t \le u \text{)}\\ &= \int\_{t=0}^{\infty}\Pr(T\>t)\\dt && \text{(integrate the density over } (t, \infty) \text{)}\\ &= \int\_{t=0}^{\infty}\operatorname{S}(t)\\dt && \text{(definition of the survival function)} \end{aligned} \\
>
> Every step also holds when \\\int\_{u=0}^{\infty} u\\\operatorname{f}(u)\\du\\ is infinite, because Tonelli’s theorem needs only a non-negative integrand; so \\\int\_{t=0}^{\infty} \operatorname{S}(t)\\dt\\ is finite exactly when \\\operatorname{E}\mathopen{}\left\[T\right\]\mathclose{}\\ is defined.
>
> See ([Soch 2020](#ref-statproofbook:mean-nnrvar)) for an alternative presentation of this proof.

> **NOTE:**
>
> **Example 2 (Mean of an exponential random variable via survival function)** Let \\T\\ be [exponential](random-variables.llms.md#def-exponential) with rate \\\lambda \> 0\\, so \\\operatorname{S}(t) = \text{e}^{-\lambda t}\\ for \\t \ge 0\\, as computed on the [random variables page](random-variables.llms.md#exm-exp-survfn). By [Theorem 2](#thm-surv-mean):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[T\right\]\mathclose{} &= \int_0^\infty \operatorname{S}(t)\\dt && \text{(expectation via the survival function)}\\ &= \int_0^\infty \text{e}^{-\lambda t}\\dt && \text{(substitute the survival function)}\\ &= \mathopen{}\left\[-\frac{1}{\lambda}\text{e}^{-\lambda t}\right\]\mathclose{}\_0^\infty && \text{(antiderivative)}\\ &= 0 - \mathopen{}\left(-\frac{1}{\lambda}\right)\mathclose{} && \text{(evaluate at the bounds)}\\ &= \frac{1}{\lambda} && \text{(simplify)} \end{aligned} \\

> **NOTE:**
>
> **Definition 2 (Expectation of a random matrix)** For a random matrix \\\mathbf{A}\\ of size \\m \times n\\ with \\(i,j)\\-th element \\A\_{ij}\\, the **expectation** \\\operatorname{E}\mathbf{A}\\ is the \\m \times n\\ matrix whose \\(i,j)\\-th element is \\\operatorname{E}\mathopen{}\left\[A\_{ij}\right\]\mathclose{}\\:
>
> \\ \operatorname{E}\mathbf{A} \stackrel{\text{def}}{=}\begin{pmatrix} \operatorname{E}\mathopen{}\left\[A\_{11}\right\]\mathclose{} & \operatorname{E}\mathopen{}\left\[A\_{12}\right\]\mathclose{} & \cdots & \operatorname{E}\mathopen{}\left\[A\_{1n}\right\]\mathclose{} \\ \operatorname{E}\mathopen{}\left\[A\_{21}\right\]\mathclose{} & \operatorname{E}\mathopen{}\left\[A\_{22}\right\]\mathclose{} & \cdots & \operatorname{E}\mathopen{}\left\[A\_{2n}\right\]\mathclose{} \\ \vdots & \vdots & \ddots & \vdots \\ \operatorname{E}\mathopen{}\left\[A\_{m1}\right\]\mathclose{} & \operatorname{E}\mathopen{}\left\[A\_{m2}\right\]\mathclose{} & \cdots & \operatorname{E}\mathopen{}\left\[A\_{mn}\right\]\mathclose{} \end{pmatrix} \\

> **NOTE:**
>
> *Remark*. In other words, expectation is applied **element-wise** to a random matrix.

> **NOTE:**
>
> **Example 3 (Expectation of a random vector of coin flips)** For the two fair coin flips in [the independence page’s example](independence.llms.md#exm-indpt), the random vector \\\tilde{X}= {(X_1, X_2)}^{\top}\\ is a \\2 \times 1\\ random matrix, and:
>
> \\\operatorname{E}\tilde{X}= \begin{pmatrix}\operatorname{E}\mathopen{}\left\[X_1\right\]\mathclose{} \\ \operatorname{E}\mathopen{}\left\[X_2\right\]\mathclose{}\end{pmatrix} = \begin{pmatrix}1/2 \\ 1/2\end{pmatrix}\\
>
> since each \\X_i\\ is Bernoulli with \\\pi = 1/2\\ ([Theorem 1](#thm-bernoulli-mean)).

> **NOTE:**
>
> **Theorem 3 (Law of the Unconscious Statistician (LOTUS))** **Discrete case.** For any function \\g\\ of a *discrete* random variable \\X\\:
>
> \\\operatorname{E}\mathopen{}\left\[g(X)\right\]\mathclose{} = \sum\_{x \in \mathcal{R}(X)} g(x) \cdot\operatorname{P}(X=x)\\
>
> **Continuous case.** For any function \\g\\ of a *continuous* random variable \\X\\ with density \\\operatorname{p}(X=x)\\:
>
> \\\operatorname{E}\mathopen{}\left\[g(X)\right\]\mathclose{} = \int\_{x \in \mathcal{R}(X)} g(x) \cdot\operatorname{p}(X=x)\\ dx\\

> **NOTE:**
>
> *Proof*. We prove the discrete case. Let \\Y = g(X)\\. For each \\y \in \mathcal{R}(Y)\\, the event \\\\Y = y\\\\ is the disjoint union of the events \\\\X = x\\\\ over the values \\x\\ with \\g(x) = y\\, and each \\x \in \mathcal{R}(X)\\ belongs to exactly one such group.
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[g(X)\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(substitution } Y = g(X) \text{)} \\&= \sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y=y) && \text{(definition of expectation for discrete r.v.)} \\&= \sum\_{y \in \mathcal{R}(Y)} y \cdot\sum\_{\substack{x \in \mathcal{R}(X) \\ g(x) = y}} \operatorname{P}(X=x) && \text{(countable additivity over the disjoint events } \\X = x\\ \text{)} \\&= \sum\_{y \in \mathcal{R}(Y)} \sum\_{\substack{x \in \mathcal{R}(X) \\ g(x) = y}} y \cdot\operatorname{P}(X=x) && \text{(distribute } y \text{ into the inner sum)} \\&= \sum\_{y \in \mathcal{R}(Y)} \sum\_{\substack{x \in \mathcal{R}(X) \\ g(x) = y}} g(x) \cdot\operatorname{P}(X=x) && \text{(} y = g(x) \text{ for every term of the inner sum)} \\&= \sum\_{x \in \mathcal{R}(X)} g(x) \cdot\operatorname{P}(X=x) && \text{(the groups partition } \mathcal{R}(X) \text{)} \end{aligned} \\
>
> The last step regroups a possibly infinite sum, which is valid because \\\operatorname{E}\mathopen{}\left\[g(X)\right\]\mathclose{}\\ is defined only when the sum converges absolutely.

> **NOTE:**
>
> *Remark*. LOTUS says that to compute \\\operatorname{E}\mathopen{}\left\[g(X)\right\]\mathclose{}\\, we do not need to first find the distribution of \\g(X)\\; we can compute the expectation directly using the distribution of \\X\\. The continuous case is the density-weighted analogue of this argument, but a fully rigorous proof needs the general change-of-variables theorem for integrals against a pushforward measure — approximating \\g\\ by simple functions and passing to the limit — which is beyond this page’s scope ([Billingsley 1995](#ref-billingsley1995probability); [Gut 2013](#ref-gut2013); [Casella and Berger 2002](#ref-CaseBerg01); [Wikipedia contributors 2026](#ref-wp:lotus)).

> **NOTE:**
>
> **Example 4 (Expected value of \\X^2\\ for a Bernoulli variable)** Let \\X \sim \operatorname{Ber}(\pi)\\. By LOTUS ([Theorem 3](#thm-lotus), discrete case):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} &= \sum\_{x \in \mathopen{}\left\\0,1\right\\\mathclose{}} x^2 \cdot\operatorname{P}(X=x) && \text{(LOTUS, discrete case)} \\ &= 0^2 \cdot\operatorname{P}(X=0) + 1^2 \cdot\operatorname{P}(X=1) && \text{(expand sum over } x = 0 \text{ and } x = 1 \text{)} \\ &= 0^2 \cdot(1-\pi) + 1^2 \cdot\pi && \text{(substitute Bernoulli PMF values)} \\ &= 0 + \pi && \text{(simplify each term)} \\ &= \pi && \text{(add)} \end{aligned} \\

> **NOTE:**
>
> **Example 5 (Expected value of \\X^2\\ for a Uniform(0,1) variable)** Let \\X \sim \text{Uniform}(0,1)\\ ([uniform distribution](random-variables.llms.md#def-uniform)), so \\\operatorname{p}(X=x) = 1\\ for \\x \in \[0,1\]\\. By LOTUS ([Theorem 3](#thm-lotus), continuous case):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} &= \int_0^1 x^2 \cdot\operatorname{p}(X=x)\\dx && \text{(LOTUS, continuous case)} \\&= \int_0^1 x^2 \cdot 1\\dx && \text{(}\operatorname{p}(X=x) = 1\text{ on } \[0,1\]\text{)} \\&= \mathopen{}\left\[\frac{x^3}{3}\right\]\mathclose{}\_0^1 && \text{(antiderivative of } x^2\text{)} \\&= \frac{1}{3}. && \text{(evaluate at the bounds)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 4 (Linearity of expectation)** For random variables \\X\\ and \\Y\\ with defined expectations, and constants \\a\\, \\b\\, and \\c\\:
>
> \\\operatorname{E}\mathopen{}\left\[aX + bY + c\right\]\mathclose{} = a\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + b\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} + c\\

> **NOTE:**
>
> *Proof*. We prove the discrete case, applying [Theorem 3](#thm-lotus) to the pair \\(X, Y)\\, which is a single discrete random object with values \\(x, y)\\, and \\g(x, y) = ax + by + c\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[aX + bY + c\right\]\mathclose{} &= \sum\_{x \in \mathcal{R}(X)}\sum\_{y \in \mathcal{R}(Y)} (ax + by + c) \cdot\operatorname{P}(X=x, Y=y) && \text{(LOTUS for the pair } (X, Y) \text{)}\\ &= a\sum\_{x \in \mathcal{R}(X)}\sum\_{y \in \mathcal{R}(Y)} x \cdot\operatorname{P}(X=x, Y=y) + b\sum\_{x \in \mathcal{R}(X)}\sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(X=x, Y=y) + c\sum\_{x \in \mathcal{R}(X)}\sum\_{y \in \mathcal{R}(Y)} \operatorname{P}(X=x, Y=y) && \text{(split the sum; constants factor out)}\\ &= a\sum\_{x \in \mathcal{R}(X)}\sum\_{y \in \mathcal{R}(Y)} x \cdot\operatorname{P}(X=x, Y=y) + b\sum\_{y \in \mathcal{R}(Y)}\sum\_{x \in \mathcal{R}(X)} y \cdot\operatorname{P}(X=x, Y=y) + c\sum\_{x \in \mathcal{R}(X)}\sum\_{y \in \mathcal{R}(Y)} \operatorname{P}(X=x, Y=y) && \text{(exchange the order of summation in the second term)}\\ &= a\sum\_{x \in \mathcal{R}(X)} x \sum\_{y \in \mathcal{R}(Y)} \operatorname{P}(X=x, Y=y) + b\sum\_{y \in \mathcal{R}(Y)} y \sum\_{x \in \mathcal{R}(X)} \operatorname{P}(X=x, Y=y) + c \cdot 1 && \text{(factor } x \text{ and } y \text{ out of the inner sums; total probability is 1)}\\ &= a\sum\_{x \in \mathcal{R}(X)} x \cdot\operatorname{P}(X=x) + b\sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y=y) + c && \text{(marginalize: countable additivity)}\\ &= a\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + b\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} + c && \text{(definition of expectation)} \end{aligned} \\
>
> Splitting and exchanging the sums is valid because the sums converge absolutely, since \\\mathopen{}\left\|ax + by + c\right\|\mathclose{} \le \mathopen{}\left\|a\right\|\mathclose{}\mathopen{}\left\|x\right\|\mathclose{} + \mathopen{}\left\|b\right\|\mathclose{}\mathopen{}\left\|y\right\|\mathclose{} + \mathopen{}\left\|c\right\|\mathclose{}\\ and \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\\ and \\\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\\ are defined.
>
> Beyond the discrete case, this proof does not carry over by replacing sums with integrals. That replacement would need a joint density for \\(X, Y)\\, and some pairs have none: if \\X\\ is continuous, the pair \\(X, X)\\ has no joint density. In general, expectation is an integral against the probability measure, and the theorem is the linearity of that (Lebesgue) integral ([Billingsley 1995](#ref-billingsley1995probability)), which is beyond these notes’ scope.

> **NOTE:**
>
> **Example 6 (Expected total of two dice)** Let \\X\\ and \\Y\\ be the results of two six-sided die rolls. Each has expectation \\\sum\_{x=1}^{6} x \cdot\tfrac{1}{6} = \tfrac{21}{6} = 3.5\\, so:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X + Y\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(linearity of expectation with } a = b = 1, c = 0 \text{)}\\ &= 3.5 + 3.5 && \text{(substitute)}\\ &= 7 && \text{(add)} \end{aligned} \\
>
> This calculation does not need the rolls to be independent.

> **NOTE:**
>
> **Corollary 1 (Expectation of a linear function of one random variable)** For a random variable \\X\\ with a defined expectation, and constants \\a\\ and \\c\\:
>
> \\\operatorname{E}\mathopen{}\left\[aX + c\right\]\mathclose{} = a\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + c\\

> **NOTE:**
>
> *Proof*. For discrete \\X\\, this identity is [Theorem 4](#thm-linearity-expectation) with \\b = 0\\. For continuous \\X\\ with density \\\operatorname{p}(X=x)\\, apply [Theorem 3](#thm-lotus) with \\g(x) = ax + c\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[aX + c\right\]\mathclose{} &= \int\_{x \in \mathcal{R}(X)} (ax + c) \cdot\operatorname{p}(X=x)\\dx && \text{(LOTUS, continuous case)} \\ &= a\int\_{x \in \mathcal{R}(X)} x \cdot\operatorname{p}(X=x)\\dx + c\int\_{x \in \mathcal{R}(X)} \operatorname{p}(X=x)\\dx && \text{(linearity of the integral)} \\ &= a\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + c\int\_{x \in \mathcal{R}(X)} \operatorname{p}(X=x)\\dx && \text{(definition of expectation)} \\ &= a\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + c \cdot 1 && \text{(a density integrates to 1)} \\ &= a\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + c && \text{(simplify)} \end{aligned} \\
>
> Splitting the integral is valid because both pieces converge absolutely: the first because \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\\ is defined, and the second because its integrand is a non-negative density.

> **NOTE:**
>
> **Example 7 (Expectation of a rescaled uniform variable)** Let \\X \sim \text{Uniform}(0,1)\\, so \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} = \int_0^1 x\\dx = \tfrac{1}{2}\\. By [Corollary 1](#cor-linearity-affine) with \\a = 2\\ and \\c = 1\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[2X + 1\right\]\mathclose{} &= 2\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + 1 && \text{(expectation of a linear function)} \\ &= 2 \cdot\tfrac{1}{2} + 1 && \text{(substitute } \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} = \tfrac{1}{2} \text{)} \\ &= 2 && \text{(evaluate)} \end{aligned} \\

> **NOTE:**
>
> **Exercise 1 (Why the average of a sample is a random variable)** Let \\X_1, \dots, X_n\\ be independent draws from the same distribution, each with mean \\\mu\\ and variance \\\sigma^2\\, and let \\\bar X = \frac{1}{n}\sum\_{i=1}^{n} X_i\\ be their average.
>
> Use [Theorem 4](#thm-linearity-expectation) to show that \\\mathbb{E}\[\bar X\] = \mu\\, and say in one sentence what that does *not* tell us.

> **NOTE:**
>
> *Solution 1*. Pull the constant \\1/n\\ out and split the sum, both by [Theorem 4](#thm-linearity-expectation):
>
> \\\mathbb{E}\[\bar X\] = \mathbb{E}\\\left\[\frac{1}{n}\sum\_{i=1}^{n} X_i\right\] = \frac{1}{n}\sum\_{i=1}^{n} \mathbb{E}\[X_i\] = \frac{1}{n}\\(n\mu) = \mu\\
>
> So the sample average is right *on average*. Independence was never used: [Theorem 4](#thm-linearity-expectation) holds regardless, so this much would be true even for draws that influence one another.
>
> What it does not tell us is how far any *particular* sample average falls from \\\mu\\ — that is a statement about variance, not expectation, and it is where independence does the work. The distinction matters because an estimator or fitted model is a function of one particular sample. Knowing that the procedure is right on average says nothing about the estimate actually in front of you, and separating those two statements is foundational to understanding bias and variance.

## 1 Conditional distributions and expectations

> **NOTE:**
>
> **Definition 3 (Conditional probability mass function)** Let \\X\\ and \\Y\\ be [jointly distributed](random-variables.llms.md#def-jointly-distributed) discrete random variables. The **conditional probability mass function** of \\Y\\ given \\X = x\\ (for values of \\x\\ with \\\operatorname{P}(X = x) \> 0\\) is:
>
> \\\operatorname{P}(Y = y \mid X = x) \stackrel{\text{def}}{=}\frac{\operatorname{P}(X = x,\\ Y = y)}{\operatorname{P}(X = x)}\\

> **NOTE:**
>
> **Example 8 (Conditional PMF from a vaccine trial)** The `vaccine` dataset in the `dobson` package (Dobson and Barnett ([2018](#ref-dobson4e)), Table 9.6) records the responses in a flu vaccine trial: \\X\\ is treatment group (placebo or vaccine) and \\Y\\ is the level of response to treatment (small, moderate, or large).
>
> Show code
>
> ``` r
> response_levels <- c("small", "moderate", "large")
> vaccine_tab <-
>   dobson::vaccine |>
>   dplyr::mutate(response = factor(response, levels = response_levels)) |>
>   xtabs(frequency ~ treatment + response, data = _)
> pander::pander(as.data.frame.matrix(vaccine_tab))
> ```
>
> |             | small | moderate | large |
> |:-----------:|:-----:|:--------:|:-----:|
> | **placebo** |  25   |    8     |   5   |
> | **vaccine** |   6   |    18    |  11   |
>
> Show code
>
> ``` r
> n_vaccine <- sum(vaccine_tab)
> n_placebo <- vaccine_tab["placebo", ]
> ```
>
> The [joint PMF](random-variables.llms.md#def-joint-pmf) of \\(X, Y)\\ is the table of frequencies divided by the total \\n = 73\\ trial participants. By the [marginal PMF theorem](random-variables.llms.md#thm-marginal-pmf), the [marginal](random-variables.llms.md#def-marginal) probability \\\operatorname{P}(X = \text{placebo})\\ is:
>
> \\ \begin{aligned} \operatorname{P}(X = \text{placebo}) &= \operatorname{P}(X = \text{placebo},\\ Y = \text{small}) + \operatorname{P}(X = \text{placebo},\\ Y = \text{moderate}) + \operatorname{P}(X = \text{placebo},\\ Y = \text{large}) && \text{(marginal PMF from the joint PMF)} \\&= \tfrac{25}{73} + \tfrac{8}{73} + \tfrac{5}{73} && \text{(read the table)} \\&= \tfrac{38}{73} && \text{(add)} \end{aligned} \\
>
> By [Definition 3](#def-cond-pmf), the conditional PMF of \\Y\\ given \\X = \text{placebo}\\ is:
>
> \\ \begin{aligned} \operatorname{P}(Y = \text{small} \mid X = \text{placebo}) &= \frac{\operatorname{P}(X = \text{placebo},\\ Y = \text{small})}{\operatorname{P}(X = \text{placebo})} && \text{(definition of conditional PMF)} \\&= \frac{25/73}{38/73} && \text{(substitute)} \\&= \frac{25}{38} && \text{(cancel } 73 \text{)} \end{aligned} \\

> **NOTE:**
>
> **Definition 4 (Conditional probability density function)** Let \\X\\ and \\Y\\ be jointly distributed continuous random variables with [joint density](random-variables.llms.md#def-joint-pdf) \\\operatorname{p}(X = x,\\ Y = y)\\ and [marginal density](random-variables.llms.md#thm-marginal-density) \\\operatorname{p}(X = x)\\. The **conditional probability density function** of \\Y\\ given \\X = x\\ (for values of \\x\\ with \\\operatorname{p}(X = x) \> 0\\) is:
>
> \\\operatorname{p}(Y = y \mid X = x) \stackrel{\text{def}}{=}\frac{\operatorname{p}(X = x,\\ Y = y)}{\operatorname{p}(X = x)}\\

> **NOTE:**
>
> **Example 9 (Conditional PDF from a bivariate normal model of birthweight data)** The `birthweight` dataset in the `dobson` package (Dobson and Barnett ([2018](#ref-dobson4e)), Table 2.3) records gestational age (weeks) and birthweight (grams) for 12 boys and 12 girls. Let \\X\\ be gestational age and \\Y\\ be birthweight, pooling both sexes into \\n = 24\\ observations.
>
> Show code
>
> ``` r
> birthweight <- dobson::birthweight
> ga <- c(
>   birthweight[["boys gestational age"]],
>   birthweight[["girls gestational age"]]
> )
> wt <- c(birthweight[["boys weight"]], birthweight[["girls weight"]])
> mu_x <- mean(ga)
> sigma_x <- sd(ga)
> mu_y <- mean(wt)
> sigma_y <- sd(wt)
> rho <- cor(ga, wt)
> beta <- cov(ga, wt) / var(ga)
> intercept <- mu_y - beta * mu_x
> x0 <- 40
> marg_dens_x0 <- dnorm(x0, mean = mu_x, sd = sigma_x)
> cond_mean <- intercept + beta * x0
> cond_sd <- sigma_y * sqrt(1 - rho^2)
> pander::pander(data.frame(
>   parameter = c("mu_x", "sigma_x", "mu_y", "sigma_y", "rho"),
>   estimate = round(c(mu_x, sigma_x, mu_y, sigma_y, rho), 4)
> ))
> ```
>
> | parameter | estimate |
> |:---------:|:--------:|
> |   mu_x    |  38.54   |
> |  sigma_x  |  1.817   |
> |   mu_y    |   2968   |
> |  sigma_y  |  282.1   |
> |    rho    |  0.7443  |
>
> Modeling \\(X, Y)\\ as bivariate normal with parameters set equal to these sample moments, the joint density is (a standard result; e.g. Casella and Berger ([2002](#ref-CaseBerg01))):
>
> \\ \operatorname{p}(X=x,\\Y=y) = \frac{1}{2\pi\sigma_X\sigma_Y\sqrt{1-\rho^2}} \text{e}^{-\frac{1}{2(1-\rho^2)} \mathopen{}\left\[\frac{(x-\mu_X)^2}{\sigma_X^2} - \frac{2\rho(x-\mu_X)(y-\mu_Y)}{\sigma_X\sigma_Y} + \frac{(y-\mu_Y)^2}{\sigma_Y^2}\right\]\mathclose{}} \\
>
> A further standard fact about the bivariate normal (Casella and Berger ([2002](#ref-CaseBerg01))) is that the marginal distribution of \\X\\ is [normal](random-variables.llms.md#def-normal), \\X \sim \operatorname{N}\mathopen{}\left(\mu_X, \sigma_X^2\right)\mathclose{}\\. At \\x = 40\\ weeks (a full-term pregnancy), \\\mu_X = 38.5417\\ and \\\sigma_X = 1.8173\\, so:
>
> \\ \begin{aligned} \operatorname{p}(X=40) &= \frac{1}{\sigma_X\sqrt{2\pi}} \text{e}^{-\frac{(40-\mu_X)^2}{2\sigma_X^2}} && \text{(normal density at } x = 40 \text{)} \\&= \frac{1}{1.8173\sqrt{2\pi}} \text{e}^{-\frac{(40-38.5417)^2}{2(1.8173)^2}} && \text{(substitute } \mu_X \text{ and } \sigma_X \text{)} \\&\approx 0.1591 && \text{(evaluate)} \end{aligned} \\
>
> By [Definition 4](#def-cond-pdf), dividing the joint density by this marginal density and simplifying the exponent (completing the square in \\y\\; Casella and Berger ([2002](#ref-CaseBerg01))) gives the conditional PDF of \\Y\\ given \\X = 40\\, which is itself normal with mean shifted along the regression line and variance reduced by a factor of \\1-\rho^2\\:
>
> \\ \begin{aligned} \operatorname{p}(Y=y \mid X=40) &= \frac{\operatorname{p}(X=40,\\Y=y)}{\operatorname{p}(X=40)} && \text{(definition of the conditional PDF)} \\&= \frac{1}{\sigma_Y\sqrt{2\pi(1-\rho^2)}} \text{e}^{-\frac{1}{2(1-\rho^2)}\mathopen{}\left\[\frac{(40-\mu_X)^2}{\sigma_X^2} - \frac{2\rho(40-\mu_X)(y-\mu_Y)}{\sigma_X\sigma_Y} + \frac{(y-\mu_Y)^2}{\sigma_Y^2}\right\]\mathclose{} + \frac{(40-\mu_X)^2}{2\sigma_X^2}} && \text{(substitute both densities; combine prefactors and exponents)} \\&= \frac{1}{\sigma_Y\sqrt{2\pi(1-\rho^2)}} \text{e}^{-\frac{\rho^2(40-\mu_X)^2}{2\sigma_X^2(1-\rho^2)} + \frac{\rho(40-\mu_X)(y-\mu_Y)}{\sigma_X\sigma_Y(1-\rho^2)} - \frac{(y-\mu_Y)^2}{2\sigma_Y^2(1-\rho^2)}} && \text{(combine the } (40-\mu_X)^2 \text{ terms: } 1 - \tfrac{1}{1-\rho^2} = \tfrac{-\rho^2}{1-\rho^2} \text{)} \\&= \frac{1}{\sigma_Y\sqrt{2\pi(1-\rho^2)}} \text{e}^{-\frac{1}{2\sigma_Y^2(1-\rho^2)} \mathopen{}\left\[\rho^2\frac{\sigma_Y^2}{\sigma_X^2}(40-\mu_X)^2 - 2\rho\frac{\sigma_Y}{\sigma_X}(40-\mu_X)(y-\mu_Y) + (y-\mu_Y)^2\right\]\mathclose{}} && \text{(factor } -\tfrac{1}{2\sigma_Y^2(1-\rho^2)} \text{ out of the exponent)} \\&= \frac{1}{\sigma_Y\sqrt{2\pi(1-\rho^2)}} \text{e}^{-\frac{\mathopen{}\left(y - \mathopen{}\left\[\mu_Y + \rho\frac{\sigma_Y}{\sigma_X}(40-\mu_X)\right\]\mathclose{}\right)\mathclose{}^2}{2\sigma_Y^2(1-\rho^2)}} && \text{(the bracket is a perfect square in } y \text{)} \end{aligned} \\
>
> Multiplying out each of the last two exponents reproduces the one before it.
>
> So \\Y \mid X = 40 \sim \operatorname{N}\mathopen{}\left(3136.15,\\ 188.37^2\right)\mathclose{}\\: the conditional mean, 3136.15 g, is exactly the fitted regression line’s prediction at \\x=40\\ (\\-1484.9846 + 115.5283 \times 40 = 3136.15\\), matching `R`’s `lm(wt ~ ga)` fit directly:
>
> Show code
>
> ``` r
> pander::pander(coef(lm(wt ~ ga)))
> ```
>
> | (Intercept) |  ga   |
> |:-----------:|:-----:|
> |    -1485    | 115.5 |

> **NOTE:**
>
> **Definition 5 (Conditional expectation)** **Discrete case.** Let \\X\\ and \\Y\\ be jointly distributed discrete random variables. The **conditional expectation** of \\Y\\ given \\X = x\\, using [Definition 3](#def-cond-pmf), is:
>
> \\\operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{} \stackrel{\text{def}}{=}\sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y = y \mid X = x)\\
>
> **Continuous case.** Let \\X\\ and \\Y\\ be jointly distributed continuous random variables. The **conditional expectation** of \\Y\\ given \\X = x\\, using [Definition 4](#def-cond-pdf), is:
>
> \\\operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{} \stackrel{\text{def}}{=}\int\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{p}(Y = y \mid X = x)\\ dy\\

> **NOTE:**
>
> **Example 10 (Conditional expectation from real trial and birthweight data)** **Discrete case.** Continuing [Example 8](#exm-cond-pmf), score the vaccine trial’s response levels \\\text{small} = 1\\, \\\text{moderate} = 2\\, \\\text{large} = 3\\. The conditional PMF of \\Y\\ given \\X = \text{placebo}\\ (from [Example 8](#exm-cond-pmf)) is:
>
> \\ \begin{aligned} \operatorname{P}(Y = \text{small} \mid X = \text{placebo}) &= \tfrac{25}{38} \\ \operatorname{P}(Y = \text{moderate} \mid X = \text{placebo}) &= \tfrac{8}{38} \\ \operatorname{P}(Y = \text{large} \mid X = \text{placebo}) &= \tfrac{5}{38} \end{aligned} \\
>
> so:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[Y \mid X = \text{placebo}\right\]\mathclose{} &= 1 \cdot\tfrac{25}{38} + 2 \cdot\tfrac{8}{38} + 3 \cdot\tfrac{5}{38} && \text{(definition of conditional expectation)} \\&= \frac{56}{38} && \text{(common denominator)} \\&\approx 1.47 && \text{(divide)} \end{aligned} \\
>
> **Continuous case.** Continuing [Example 9](#exm-cond-pdf), \\Y \mid X = 40 \sim \operatorname{N}\mathopen{}\left(3136.15,\\ 188.37^2\right)\mathclose{}\\. The mean of a normal distribution is its location parameter (Casella and Berger ([2002](#ref-CaseBerg01))), so integrating \\y\\ against this conditional density gives:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[Y \mid X = 40\right\]\mathclose{} &= \int\_{-\infty}^{\infty} y \cdot\operatorname{p}(Y=y \mid X=40)\\dy && \text{(definition of conditional expectation)} \\&= 3136.15 \text{ g} && \text{(the mean of a normal distribution is its location parameter)} \end{aligned} \\
>
> matching the fitted regression line’s prediction at \\x=40\\ weeks exactly, as expected since the conditional mean of a bivariate normal *is* the linear regression of \\Y\\ on \\X\\.

> **NOTE:**
>
> **Definition 6 (Conditional expectation: mixed case)** Suppose exactly one of \\X, Y\\ is discrete and the other is continuous, with [joint density-mass function](random-variables.llms.md#def-joint-density-mass) \\\operatorname{p}(X = x,\\ Y = y)\\.
>
> **\\X\\ discrete, \\Y\\ continuous.** Here \\\operatorname{p}(X=x,\\Y=y)\\ is, for each fixed \\x\\, a probability density in \\y\\, with \\\int\_{y \in \mathcal{R}(Y)} \operatorname{p}(X=x,\\Y=y)\\dy = \operatorname{P}(X=x)\\. The conditional PDF of \\Y\\ given \\X = x\\ (for values of \\x\\ with \\\operatorname{P}(X = x) \> 0\\) is:
>
> \\\operatorname{p}(Y = y \mid X = x) \stackrel{\text{def}}{=}\frac{\operatorname{p}(X = x,\\ Y = y)}{\operatorname{P}(X = x)}\\
>
> and the conditional expectation of \\Y\\ given \\X = x\\ is:
>
> \\\operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{} \stackrel{\text{def}}{=}\int\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{p}(Y = y \mid X = x)\\ dy\\
>
> **\\X\\ continuous, \\Y\\ discrete.** Here \\\operatorname{p}(X=x,\\Y=y)\\ is, for each fixed \\y\\, a probability density in \\x\\, and \\\sum\_{y \in \mathcal{R}(Y)} \operatorname{p}(X=x,\\Y=y) = \operatorname{p}(X=x)\\ is a density of \\X\\. The conditional PMF of \\Y\\ given \\X = x\\ (for values of \\x\\ with \\\operatorname{p}(X = x) \> 0\\) is:
>
> \\\operatorname{P}(Y = y \mid X = x) \stackrel{\text{def}}{=}\frac{\operatorname{p}(X = x,\\ Y = y)}{\operatorname{p}(X = x)}\\
>
> and the conditional expectation of \\Y\\ given \\X = x\\ is:
>
> \\\operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{} \stackrel{\text{def}}{=}\sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y = y \mid X = x)\\

> **NOTE:**
>
> **Example 11 (Conditional expectation, one discrete variable and one continuous variable)** **\\X\\ discrete, \\Y\\ continuous.** The `plasma` dataset in the `dobson` package (Dobson and Barnett ([2018](#ref-dobson4e)), Table 6.25) records plasma inorganic phosphate levels (mg/dL) one hour after a glucose tolerance test, for hyperinsulinemic obese (`H-O`) and control (`C`) participants. Let \\X\\ be group and \\Y\\ be phosphate level.
>
> Show code
>
> ``` r
> plasma_summary <-
>   dobson::plasma |>
>   dplyr::filter(Group %in% c("H-O", "C")) |>
>   dplyr::summarise(
>     .by = Group,
>     n = dplyr::n(),
>     mean = mean(phosphate),
>     sd = sd(phosphate)
>   )
> group_stat <- function(group, stat) {
>   plasma_summary[[stat]][plasma_summary[["Group"]] == group]
> }
> n_ho <- group_stat("H-O", "n")
> n_c <- group_stat("C", "n")
> mean_ho <- group_stat("H-O", "mean")
> sd_ho <- group_stat("H-O", "sd")
> mean_c <- group_stat("C", "mean")
> sd_c <- group_stat("C", "sd")
> pander::pander(plasma_summary)
> ```
>
> | Group |  n  | mean  |   sd   |
> |:-----:|:---:|:-----:|:------:|
> |  H-O  | 11  | 3.945 | 0.7776 |
> |   C   | 12  | 2.783 | 0.4086 |
>
> Modeling phosphate as approximately normal within each group, with parameters set equal to each group’s sample mean and SD, and \\\operatorname{P}(X = \text{H-O}) = 11/23\\:
>
> \\Y \mid X = \text{H-O} \sim \operatorname{N}\mathopen{}\left(3.95,\\ 0.78^2\right)\mathclose{}\\ \\Y \mid X = \text{C} \sim \operatorname{N}\mathopen{}\left(2.78,\\ 0.41^2\right)\mathclose{}\\
>
> By [Definition 6](#def-cond-mixed), since the mean of a normal distribution is its location parameter:
>
> \\\operatorname{E}\mathopen{}\left\[Y \mid X = \text{H-O}\right\]\mathclose{} = 3.95 \text{ mg/dL}, \qquad \operatorname{E}\mathopen{}\left\[Y \mid X = \text{C}\right\]\mathclose{} = 2.78 \text{ mg/dL}\\
>
> **\\X\\ continuous, \\Y\\ discrete.** The `senility` dataset in the `dobson` package (Dobson and Barnett ([2018](#ref-dobson4e)), Table 7.8) records, for 54 elderly people, a WAIS (Wechsler Adult Intelligence Scale) score and whether symptoms of senility were present. Let \\X\\ be WAIS score and \\Y\\ indicate senility symptoms.
>
> Show code
>
> ``` r
> senility_fit <- glm(s ~ x, data = dobson::senility, family = binomial)
> b0 <- coef(senility_fit)[["(Intercept)"]]
> b1 <- coef(senility_fit)[["x"]]
> pander::pander(coef(senility_fit))
> ```
>
> | (Intercept) |    x    |
> |:-----------:|:-------:|
> |    2.404    | -0.3235 |
>
> Modeling \\\operatorname{P}(Y = 1 \mid X = x)\\ with the fitted logistic regression:
>
> \\\operatorname{logit}\operatorname{P}(Y = 1 \mid X = x) = 2.4040 - 0.3235\\ x\\
>
> By [Definition 6](#def-cond-mixed), since \\Y \mid X=x\\ is Bernoulli:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{} &= 0 \cdot\operatorname{P}(Y=0 \mid X=x) + 1 \cdot\operatorname{P}(Y=1 \mid X=x) && \text{(definition of conditional expectation, mixed case)} \\&= \operatorname{P}(Y=1 \mid X=x) && \text{(simplify)} \\&= \frac{1}{1 + \text{e}^{-(2.4040 - 0.3235\\ x)}} && \text{(invert the logit)} \end{aligned} \\
>
> Show code
>
> ``` r
> senility_p10 <- predict(
>   senility_fit,
>   newdata = data.frame(x = 10),
>   type = "response"
> )
> senility_p15 <- predict(
>   senility_fit,
>   newdata = data.frame(x = 15),
>   type = "response"
> )
> ```
>
> At \\x = 10\\: \\\operatorname{E}\mathopen{}\left\[Y \mid X=10\right\]\mathclose{} = 0.3\\. At \\x = 15\\: \\\operatorname{E}\mathopen{}\left\[Y \mid X=15\right\]\mathclose{} = 0.08\\ — a lower WAIS score is associated with higher predicted probability of senility symptoms.

> **NOTE:**
>
> **Definition 7 (Conditional expectation function)** The **conditional expectation function** \\\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\\ is the function (and hence random variable) of \\X\\ obtained by evaluating \\\operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{}\\ at \\X\\; specifically, \\\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{} = g(X)\\ where \\g(x) \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{}\\.

> **NOTE:**
>
> **Example 12 (The conditional expectation function of the birthweight model)** Continuing [Example 9](#exm-cond-pdf) and [Example 10](#exm-cond-expectation), \\(X, Y)\\ (gestational age, birthweight) is modeled as bivariate normal. The general form of the conditional mean derived in [Example 9](#exm-cond-pdf), evaluated at an arbitrary \\x\\ instead of just \\x=40\\, gives the conditional expectation function directly:
>
> \\ \begin{aligned} g(x) &= \mu_Y + \rho\frac{\sigma_Y}{\sigma_X}(x-\mu_X) \\&= -1484.9846 + 115.5283\\ x \end{aligned} \\
>
> which is exactly the fitted regression line (the general algebraic identity \\\mu_Y + \rho\frac{\sigma_Y}{\sigma_X}(x-\mu_X) = \mathopen{}\left(\mu_Y - \rho\frac{\sigma_Y}{\sigma_X}\mu_X\right)\mathclose{} + \rho\frac{\sigma_Y}{\sigma_X}x\\ is what makes the bivariate-normal conditional mean linear in \\x\\). As a check, evaluating at \\x = 40\\ recovers [Example 10](#exm-cond-expectation)’s result:
>
> \\g(40) = -1484.9846 + 115.5283 \times 40 = 3136.15 \text{ g}\\

> **NOTE:**
>
> **Definition 8 (Conditional expectation of a function of \\X\\ and \\Y\\)** Let \\X\\ and \\Y\\ be jointly distributed random variables, \\h\\ a function of two arguments, and \\x\\ a value at which the conditional PMF or PDF of \\Y\\ given \\X = x\\ is defined ([Definition 3](#def-cond-pmf), [Definition 4](#def-cond-pdf), or [Definition 6](#def-cond-mixed)). The **conditional expectation** of \\h(X, Y)\\ given \\X = x\\ is, for discrete \\Y\\:
>
> \\\operatorname{E}\mathopen{}\left\[h(X, Y) \mid X = x\right\]\mathclose{} \stackrel{\text{def}}{=}\sum\_{y \in \mathcal{R}(Y)} h(x, y) \cdot\operatorname{P}(Y = y \mid X = x)\\
>
> and for continuous \\Y\\:
>
> \\\operatorname{E}\mathopen{}\left\[h(X, Y) \mid X = x\right\]\mathclose{} \stackrel{\text{def}}{=}\int\_{y \in \mathcal{R}(Y)} h(x, y) \cdot\operatorname{p}(Y = y \mid X = x)\\dy\\
>
> when the sum or integral converges absolutely. Evaluating this function of \\x\\ at \\X\\ gives the random variable \\\operatorname{E}\mathopen{}\left\[h(X, Y) \mid X\right\]\mathclose{}\\.

> **NOTE:**
>
> **Example 13 (The second flip, given the first)** In the [joint PMF of two coin flips](random-variables.llms.md#exm-joint-pmf), write \\X\\ for the first flip and \\Y\\ for the total number of heads. Given \\X = 1\\, \\Y\\ is \\1\\ or \\2\\ with conditional probability \\1/2\\ each, and \\Y - X\\ is the second flip. With \\h(x, y) = (y - x)^2\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[(Y - X)^2 \mid X = 1\right\]\mathclose{} &= (1 - 1)^2 \cdot\tfrac{1}{2} + (2 - 1)^2 \cdot\tfrac{1}{2} && \text{(definition, with } x = 1 \text{)} \\ &= 0 + \tfrac{1}{2} && \text{(evaluate each term)} \\ &= \tfrac{1}{2} && \text{(add)} \end{aligned} \\

> **NOTE:**
>
> **Corollary 2 (With \\h(x, y) = y\\, the general definition gives \\{\operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{}}\\)** For jointly distributed \\X\\ and \\Y\\ and \\h(x, y) = y\\, [Definition 8](#def-cond-expectation-general) gives the conditional expectation of \\Y\\ given \\X = x\\ from [Definition 5](#def-cond-expectation) (when \\X\\ and \\Y\\ are both discrete or both continuous) or from [Definition 6](#def-cond-mixed) (when one is discrete and the other continuous):
>
> \\\operatorname{E}\mathopen{}\left\[h(X, Y) \mid X = x\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{}\\

> **NOTE:**
>
> *Proof*. For discrete \\Y\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[h(X, Y) \mid X = x\right\]\mathclose{} &= \sum\_{y \in \mathcal{R}(Y)} h(x, y) \cdot\operatorname{P}(Y = y \mid X = x) && \text{(conditional expectation of a function, discrete } Y \text{)} \\ &= \sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y = y \mid X = x) && \text{(} h(x, y) = y \text{)} \\ &= \operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{} && \text{(conditional expectation, discrete } Y \text{)} \end{aligned} \\
>
> The last step is [Definition 5](#def-cond-expectation) when \\X\\ is discrete and [Definition 6](#def-cond-mixed) when \\X\\ is continuous. For continuous \\Y\\, the same steps hold with integrals over \\y\\ in place of the sums and \\\operatorname{p}(Y = y \mid X = x)\\ in place of \\\operatorname{P}(Y = y \mid X = x)\\.

> **NOTE:**
>
> **Theorem 5 (Conditional LOTUS, discrete case)** Let \\X\\ and \\Y\\ be jointly distributed discrete random variables, \\h\\ a function of two arguments, \\W \stackrel{\text{def}}{=}h(X, Y)\\, and \\x\\ a value with \\\operatorname{P}(X = x) \> 0\\. Then \\W\\ is discrete, and \\\operatorname{E}\mathopen{}\left\[h(X, Y) \mid X = x\right\]\mathclose{}\\ from [Definition 8](#def-cond-expectation-general) equals \\\operatorname{E}\mathopen{}\left\[W \mid X = x\right\]\mathclose{}\\ from [Definition 5](#def-cond-expectation), with one sum converging absolutely exactly when the other does.

> **NOTE:**
>
> *Proof*. \\W\\ is discrete because its range is contained in \\\mathopen{}\left\\h(u, y) : u \in \mathcal{R}(X),\\ y \in \mathcal{R}(Y)\right\\\mathclose{}\\, which is countable. For each \\w \in \mathcal{R}(W)\\, the event \\\mathopen{}\left\\X = x,\\ W = w\right\\\mathclose{}\\ is the disjoint union of the events \\\mathopen{}\left\\X = x,\\ Y = y\right\\\mathclose{}\\ over the values \\y \in \mathcal{R}(Y)\\ with \\h(x, y) = w\\, so:
>
> \\ \begin{aligned} \operatorname{P}(W = w \mid X = x) &= \frac{\operatorname{P}(X = x,\\ W = w)}{\operatorname{P}(X = x)} && \text{(conditional PMF of } W \text{)} \\ &= \frac{1}{\operatorname{P}(X = x)} \sum\_{\substack{y \in \mathcal{R}(Y) \\ h(x, y) = w}} \operatorname{P}(X = x,\\ Y = y) && \text{(countable additivity over the disjoint events } \mathopen{}\left\\X = x,\\ Y = y\right\\\mathclose{} \text{)} \\ &= \sum\_{\substack{y \in \mathcal{R}(Y) \\ h(x, y) = w}} \operatorname{P}(Y = y \mid X = x) && \text{(divide each term; conditional PMF of } Y \text{)} \end{aligned} \\
>
> Every \\y \in \mathcal{R}(Y)\\ with \\\operatorname{P}(Y = y \mid X = x) \> 0\\ has \\h(x, y) \in \mathcal{R}(W)\\, because some outcome has \\X = x\\ and \\Y = y\\, and \\W = h(x, y)\\ there; the other values of \\y\\ contribute terms equal to \\0\\. So the groups \\\mathopen{}\left\\y \in \mathcal{R}(Y) : h(x, y) = w\right\\\mathclose{}\\, over \\w \in \mathcal{R}(W)\\, contain every \\y\\ with a non-zero term, each exactly once:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[W \mid X = x\right\]\mathclose{} &= \sum\_{w \in \mathcal{R}(W)} w \cdot\operatorname{P}(W = w \mid X = x) && \text{(conditional expectation of } W \text{)} \\ &= \sum\_{w \in \mathcal{R}(W)} w \cdot\sum\_{\substack{y \in \mathcal{R}(Y) \\ h(x, y) = w}} \operatorname{P}(Y = y \mid X = x) && \text{(the display above)} \\ &= \sum\_{w \in \mathcal{R}(W)} \sum\_{\substack{y \in \mathcal{R}(Y) \\ h(x, y) = w}} w \cdot\operatorname{P}(Y = y \mid X = x) && \text{(distribute } w \text{ into the inner sum)} \\ &= \sum\_{w \in \mathcal{R}(W)} \sum\_{\substack{y \in \mathcal{R}(Y) \\ h(x, y) = w}} h(x, y) \cdot\operatorname{P}(Y = y \mid X = x) && \text{(} w = h(x, y) \text{ for every term of the inner sum)} \\ &= \sum\_{y \in \mathcal{R}(Y)} h(x, y) \cdot\operatorname{P}(Y = y \mid X = x) && \text{(the groups contain every non-zero term once)} \\ &= \operatorname{E}\mathopen{}\left\[h(X, Y) \mid X = x\right\]\mathclose{} && \text{(conditional expectation of a function of } X \text{ and } Y \text{)} \end{aligned} \\
>
> The same steps with \\\mathopen{}\left\|w\right\|\mathclose{}\\ and \\\mathopen{}\left\|h(x, y)\right\|\mathclose{}\\ in place of \\w\\ and \\h(x, y)\\ regroup a sum of non-negative terms, which is valid whether or not it converges, so one sum converges absolutely exactly when the other does, and then the regrouping above is valid too.

> **NOTE:**
>
> *Remark*. [Definition 8](#def-cond-expectation-general) is the conditional version of [LOTUS](#thm-lotus): for discrete \\X\\, it is LOTUS applied under the probability measure \\\Pr(\cdot \mid X = x)\\, and by [Theorem 5](#thm-cond-lotus), results about \\\operatorname{E}\mathopen{}\left\[W \mid X\right\]\mathclose{}\\ apply to it. \\Y\\ can also be a pair \\(Y, Z)\\, with the sum or integral taken over both.

> **NOTE:**
>
> **Theorem 6 (Linearity of conditional expectation)** For jointly distributed \\X\\ and \\Y\\, functions \\h_1\\ and \\h_2\\ whose conditional expectations given \\X = x\\ are defined, and constants \\a\\ and \\b\\:
>
> \\\operatorname{E}\mathopen{}\left\[a h_1(X, Y) + b h_2(X, Y) \mid X = x\right\]\mathclose{} = a\operatorname{E}\mathopen{}\left\[h_1(X, Y) \mid X = x\right\]\mathclose{} + b\operatorname{E}\mathopen{}\left\[h_2(X, Y) \mid X = x\right\]\mathclose{}\\
>
> Evaluating both sides at \\X\\ gives \\\operatorname{E}\mathopen{}\left\[a h_1(X, Y) + b h_2(X, Y) \mid X\right\]\mathclose{} = a\operatorname{E}\mathopen{}\left\[h_1(X, Y) \mid X\right\]\mathclose{} + b\operatorname{E}\mathopen{}\left\[h_2(X, Y) \mid X\right\]\mathclose{}\\.

> **NOTE:**
>
> *Proof*. For discrete \\Y\\:
>
> \\ \begin{aligned} &\operatorname{E}\mathopen{}\left\[a h_1(X, Y) + b h_2(X, Y) \mid X = x\right\]\mathclose{} \\&= \sum\_{y \in \mathcal{R}(Y)} \mathopen{}\left(a h_1(x, y) + b h_2(x, y)\right)\mathclose{} \cdot\operatorname{P}(Y = y \mid X = x) && \text{(definition of conditional expectation)} \\ &= a \sum\_{y \in \mathcal{R}(Y)} h_1(x, y) \cdot\operatorname{P}(Y = y \mid X = x) + b \sum\_{y \in \mathcal{R}(Y)} h_2(x, y) \cdot\operatorname{P}(Y = y \mid X = x) && \text{(split the sum; factor out the constants)} \\ &= a\operatorname{E}\mathopen{}\left\[h_1(X, Y) \mid X = x\right\]\mathclose{} + b\operatorname{E}\mathopen{}\left\[h_2(X, Y) \mid X = x\right\]\mathclose{} && \text{(definition of conditional expectation)} \end{aligned} \\
>
> Splitting the sum is valid because both sums converge absolutely. For continuous \\Y\\, the same steps hold with integrals over \\y\\ in place of the sums, by linearity of the integral: unlike [Theorem 4](#thm-linearity-expectation), only one variable, \\y\\, is integrated, against one conditional density.

> **NOTE:**
>
> **Example 14 (Linearity, given the first flip)** Continuing [Example 13](#exm-cond-expectation-general), given \\X = 1\\, \\Y\\ is \\1\\ or \\2\\ with probability \\1/2\\ each, so \\\operatorname{E}\mathopen{}\left\[Y \mid X = 1\right\]\mathclose{} = 3/2\\ and \\\operatorname{E}\mathopen{}\left\[Y^2 \mid X = 1\right\]\mathclose{} = (1 + 4)/2 = 5/2\\. By [Theorem 6](#thm-cond-linearity) with \\a = b = 1\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[Y + Y^2 \mid X = 1\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[Y \mid X = 1\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[Y^2 \mid X = 1\right\]\mathclose{} && \text{(linearity of conditional expectation)} \\ &= \tfrac{3}{2} + \tfrac{5}{2} && \text{(substitute)} \\ &= 4 && \text{(add)} \end{aligned} \\
>
> As a check, directly: \\(1 + 1) \cdot\tfrac{1}{2} + (2 + 4) \cdot\tfrac{1}{2} = 1 + 3 = 4\\.

> **NOTE:**
>
> **Theorem 7 (A function of \\X\\ factors out of a conditional expectation given \\X\\)** For jointly distributed \\X\\ and \\Y\\, a function \\g\\ of one argument, and a function \\h\\ of two arguments whose conditional expectation given \\X = x\\ is defined:
>
> \\\operatorname{E}\mathopen{}\left\[g(X)\\h(X, Y) \mid X = x\right\]\mathclose{} = g(x) \cdot\operatorname{E}\mathopen{}\left\[h(X, Y) \mid X = x\right\]\mathclose{}\\
>
> Evaluating both sides at \\X\\ gives \\\operatorname{E}\mathopen{}\left\[g(X)\\h(X, Y) \mid X\right\]\mathclose{} = g(X) \cdot\operatorname{E}\mathopen{}\left\[h(X, Y) \mid X\right\]\mathclose{}\\. In particular, taking \\h = 1\\ gives \\\operatorname{E}\mathopen{}\left\[g(X) \mid X\right\]\mathclose{} = g(X)\\.

> **NOTE:**
>
> *Proof*. For discrete \\Y\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[g(X)\\h(X, Y) \mid X = x\right\]\mathclose{} &= \sum\_{y \in \mathcal{R}(Y)} g(x)\\h(x, y) \cdot\operatorname{P}(Y = y \mid X = x) && \text{(definition of conditional expectation)} \\ &= g(x) \sum\_{y \in \mathcal{R}(Y)} h(x, y) \cdot\operatorname{P}(Y = y \mid X = x) && \text{(} g(x) \text{ does not depend on } y \text{)} \\ &= g(x) \cdot\operatorname{E}\mathopen{}\left\[h(X, Y) \mid X = x\right\]\mathclose{} && \text{(definition of conditional expectation)} \end{aligned} \\
>
> For \\h = 1\\, the remaining sum is \\\sum\_{y \in \mathcal{R}(Y)} \operatorname{P}(Y = y \mid X = x) = 1\\:
>
> \\ \begin{aligned} \sum\_{y \in \mathcal{R}(Y)} \operatorname{P}(Y = y \mid X = x) &= \sum\_{y \in \mathcal{R}(Y)} \frac{\operatorname{P}(X = x,\\ Y = y)}{\operatorname{P}(X = x)} && \text{(definition of the conditional PMF)} \\ &= \frac{\operatorname{P}(X = x)}{\operatorname{P}(X = x)} && \text{(marginal PMF from a joint PMF)} \\ &= 1 && \text{(divide)} \end{aligned} \\
>
> For continuous \\Y\\, the same steps hold with integrals over \\y\\ in place of the sums; the conditional density integrates to 1 by [the marginal density theorem](random-variables.llms.md#thm-marginal-density) (or, in the mixed case, by [the joint density-mass function’s](random-variables.llms.md#def-joint-density-mass) marginal identity).

> **NOTE:**
>
> *Remark*. This result is often summarized as “taking out what is known” (e.g., Ross ([2022](#ref-ross-probsim)), Section 5.6.4): given \\X = x\\, any function of \\X\\ is the known constant \\g(x)\\.

> **NOTE:**
>
> **Example 15 (Taking out the first flip)** Continuing [Example 14](#exm-cond-linearity), with \\g(x) = x\\ and \\h(x, y) = y\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[XY \mid X = 1\right\]\mathclose{} &= 1 \cdot\operatorname{E}\mathopen{}\left\[Y \mid X = 1\right\]\mathclose{} && \text{(a function of } X \text{ factors out)} \\ &= \tfrac{3}{2} && \text{(substitute } \operatorname{E}\mathopen{}\left\[Y \mid X = 1\right\]\mathclose{} = \tfrac{3}{2} \text{)} \end{aligned} \\
>
> and \\\operatorname{E}\mathopen{}\left\[XY \mid X = 0\right\]\mathclose{} = 0 \cdot\operatorname{E}\mathopen{}\left\[Y \mid X = 0\right\]\mathclose{} = 0\\. As a check, given \\X = 1\\ the product \\XY\\ equals \\Y\\, which is \\1\\ or \\2\\ with probability \\1/2\\ each.

> **NOTE:**
>
> **Exercise 2 (Expectation of a sum, given a joint PMF)** Let \\(X, Y)\\ be discrete with joint probability mass function:
>
> |           | \\Y = 0\\ | \\Y = 1\\ |
> |:---------:|:---------:|:---------:|
> | \\X = 0\\ |  \\0.2\\  |  \\0.3\\  |
> | \\X = 1\\ |  \\0.1\\  |  \\0.4\\  |
>
> Compute \\\operatorname{E}\mathopen{}\left\[X + Y\right\]\mathclose{}\\.

> **NOTE:**
>
> *Solution*. Treating \\(X, Y)\\ as a single discrete random object taking one of the four values \\(0,0)\\, \\(0,1)\\, \\(1,0)\\, \\(1,1)\\, LOTUS ([Theorem 3](#thm-lotus)) applied to \\g(x, y) = x + y\\ gives directly:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X + Y\right\]\mathclose{} &= \sum\_{x \in \\0,1\\} \sum\_{y \in \\0,1\\} (x + y)\\\operatorname{P}(X = x,\\ Y = y) && \text{(LOTUS)} \\ &= (0{+}0)(0.2) + (0{+}1)(0.3) + (1{+}0)(0.1) + (1{+}1)(0.4) && \text{(expand the four terms)} \\ &= 0 + 0.3 + 0.1 + 0.8 && \text{(multiply)} \\ &= 1.2 && \text{(add)} \end{aligned} \\
>
> As a check: \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} = 0(0.5) + 1(0.5) = 0.5\\ and \\\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = 0(0.3) + 1(0.7) = 0.7\\, so \\\operatorname{E}\mathopen{}\left\[X + Y\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = 1.2\\ by [linearity of expectation](#thm-linearity-expectation).
>
> Show code
>
> ``` r
> x_labs <- c("X=0", "X=0", "X=1", "X=1")
> y_labs <- c("Y=0", "Y=1", "Y=0", "Y=1")
> probs <- c(0.2, 0.3, 0.1, 0.4)
>
> plotly::plot_ly(
>   x = ~y_labs, y = ~probs, color = ~x_labs,
>   colors = c("steelblue", "tomato"),
>   type = "bar"
> ) |>
>   plotly::layout(
>     barmode = "group",
>     xaxis = list(title = "Y"),
>     yaxis = list(title = "P(X = x, Y = y)", range = c(0, 0.5)),
>     legend = list(title = list(text = "X value"))
>   )
> ```
>
> Figure 1: Joint probability mass function \\\operatorname{P}(X = x, Y = y)\\. Marginal totals: \\\operatorname{P}(X = 0) = 0.5\\, \\\operatorname{P}(X = 1) = 0.5\\, \\\operatorname{P}(Y = 0) = 0.3\\, \\\operatorname{P}(Y = 1) = 0.7\\.

> **NOTE:**
>
> *Remark*. Note that \\X\\ and \\Y\\ are **not** independent here: \\\operatorname{P}(X = 0, Y = 0) = 0.2 \neq 0.15 = \operatorname{P}(X = 0)\\\operatorname{P}(Y = 0)\\. LOTUS applies regardless, since it requires only the *actual* joint mass function, not independence.
>
> There are only four \\(x,y)\\ pairs here, so summing them in any order — row by row, column by column, or any other listing — gives the same total by ordinary commutativity and associativity of addition; no result about interchanging summation order is needed. Once the support is countably infinite, exchanging the order of summation needs a justification, which the Fubini–Tonelli theorem provides.

## 2 Fubini–Tonelli for expectations

> **NOTE:**
>
> **Theorem 8 (Fubini–Tonelli theorem, measure-theoretic form)** Let \\\mu_1\\ and \\\mu_2\\ be \\\sigma\\-finite [measures](https://morrison-lab.github.io/mds/measures.html#def-measure) on \\\sigma\\-algebras of subsets of sets \\S_1\\ and \\S_2\\, and let \\f\\ be a measurable function on \\S_1 \times S_2\\. If either
>
> 1.  \\f \ge 0\\ (Tonelli), or
>
> 2.  \\\int\_{S_1 \times S_2} \mathopen{}\left\|f\right\|\mathclose{}\\d(\mu_1 \otimes \mu_2) \< \infty\\ (Fubini),
>
> then the integral of \\f\\ against the product measure \\\mu_1 \otimes \mu_2\\ equals both iterated integrals:
>
> \\ \begin{aligned} \int\_{S_1 \times S_2} f\\d(\mu_1 \otimes \mu_2) &= \int\_{S_1}\mathopen{}\left(\int\_{S_2} f(s_1, s_2)\\d\mu_2(s_2)\right)\mathclose{}\\d\mu_1(s_1) \\&= \int\_{S_2}\mathopen{}\left(\int\_{S_1} f(s_1, s_2)\\d\mu_1(s_1)\right)\mathclose{}\\d\mu_2(s_2). \end{aligned} \\
>
> In case (b), each inner integral is finite except on a set of measure \\0\\, which does not affect the outer integral.

> **NOTE:**
>
> *Remark*. For expectations, we use this measure-theoretic form of the [Fubini–Tonelli theorem](https://morrison-lab.github.io/mds/calculus.html#thm-fubini-tonelli), which lets us exchange the order of integration (or summation) over a product of \\\sigma\\-finite measure spaces, provided the integrand is non-negative (Tonelli) or absolutely integrable (Fubini). Its proof is beyond these notes’ scope ([Billingsley 1995](#ref-billingsley1995probability), Theorem 18.3). Lebesgue measure on the real line and [counting measure](https://morrison-lab.github.io/mds/measures.html#def-counting-measure) on a countable set are both \\\sigma\\-finite, which gives the theorem a form stated in terms of a joint distribution.

> **NOTE:**
>
> **Corollary 3 (Joint-distribution form (without independence; corollary of Fubini–Tonelli))** Let \\(X, Y)\\ be jointly distributed random variables whose joint distribution has a density \\f\_{X,Y}\\ with respect to a product of \\\sigma\\-finite reference measures \\\mu_X \otimes \mu_Y\\ on \\\mathcal{R}(X) \times \mathcal{R}(Y)\\, and let \\h : \mathcal{R}(X) \times \mathcal{R}(Y) \to \mathbb{R}\\ be measurable. If either
>
> 1.  \\h(X, Y) \ge 0\\ almost surely, or
>
> 2.  \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left\|h(X, Y)\right\|\mathclose{}\right\]\mathclose{} \< \infty\\,
>
> then the expectation of \\h(X, Y)\\ can be written as an iterated integral against \\f\_{X,Y}\\, with the order of integration exchangeable:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[h(X, Y)\right\]\mathclose{} &= \int\_{\mathcal{R}(X)}\mathopen{}\left(\int\_{\mathcal{R}(Y)} h(x, y)\\f\_{X,Y}(x, y)\\d\mu_Y(y)\right)\mathclose{}\\d\mu_X(x) \\&= \int\_{\mathcal{R}(Y)}\mathopen{}\left(\int\_{\mathcal{R}(X)} h(x, y)\\f\_{X,Y}(x, y)\\d\mu_X(x)\right)\mathclose{}\\d\mu_Y(y). \end{aligned} \\
>
> The choice of reference measures covers three cases:
>
> - **Both continuous:** \\\mu_X = \mu_Y = \text{Lebesgue measure}\\; \\f\_{X,Y}\\ is the joint probability density function (PDF), and \\\int\_{\mathcal{R}(X)} g(x)\\d\mu_X(x) = \int\_{\mathcal{R}(X)} g(x)\\dx\\.
> - **Both discrete:** \\\mu_X = \mu_Y = \text{counting measure}\\; \\f\_{X,Y}(x,y) = \operatorname{P}(X = x,\\ Y = y)\\ is the joint probability mass function (PMF), and \\\int\_{\mathcal{R}(X)} g(x)\\d\mu_X(x) = \sum\_{x \in \mathcal{R}(X)} g(x)\\.
> - **Mixed** (one continuous, one discrete): one reference measure is Lebesgue and the other is counting; \\f\_{X,Y}\\ is the [joint density-mass function](random-variables.llms.md#def-joint-density-mass), \\f\_{X,Y}(x,y) = f\_{X \mid Y}(x \mid y)\\\operatorname{P}(Y = y)\\ (or \\\operatorname{P}(X = x \mid Y = y)\\f_Y(y)\\ if \\X\\ is discrete and \\Y\\ continuous), and the iterated integrals combine an ordinary integral with a sum. The conditional densities/PMFs here are defined the same way as in [Definition 6](#def-cond-mixed), just conditioning on \\Y\\ instead of \\X\\.

> **NOTE:**
>
> *Proof*. Apply [Theorem 8](#thm-fubini-tonelli-measure) with \\\mu_1 = \mu_X\\ and \\\mu_2 = \mu_Y\\ to the integrand \\h(x,y)\\f\_{X,Y}(x,y)\\ on \\\mathcal{R}(X) \times \mathcal{R}(Y)\\. Lebesgue measure and counting measure on a countable set are each \\\sigma\\-finite, so \\\mu_X \otimes \mu_Y\\ is \\\sigma\\-finite in all three cases. The relevant condition is (a) when \\h \ge 0\\ and (b) when \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left\|h(X, Y)\right\|\mathclose{}\right\]\mathclose{} \< \infty\\. Independence is not required. When \\X\\ and \\Y\\ are independent, \\f\_{X,Y}(x,y) = f_X(x)\\f_Y(y)\\ (or \\\operatorname{P}(X=x,Y=y) = \operatorname{P}(X=x)\\\operatorname{P}(Y=y)\\ in the discrete case), and the iterated integrals factor into separate integrals over the marginals.

> **NOTE:**
>
> **Example 16 (Expectation of a product of independent variables)** Let \\X \sim \mathrm{Uniform}(0, 1)\\ and \\Y \sim \mathrm{Uniform}(0, 2)\\, independently distributed. Compute \\\operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{}\\.
>
> We apply [Corollary 3](#cor-fubini-joint) (both-continuous case) with \\h(x, y) = xy\\. Since \\X\\ and \\Y\\ are independent with densities \\f_X(x) = 1\\ on \\\[0,1\]\\ and \\f_Y(y) = \tfrac{1}{2}\\ on \\\[0,2\]\\, the joint density factors as \\f\_{X,Y}(x,y) = f_X(x)\\f_Y(y) = \tfrac{1}{2}\\, and \\\mu_X = \mu_Y = \text{Lebesgue measure}\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} &= \int_0^1 \mathopen{}\left(\int_0^2 xy \cdot\tfrac{1}{2}\\dy\right)\mathclose{}\\dx && \text{(joint-distribution form of Fubini--Tonelli)} \\&= \int_0^1 x\mathopen{}\left(\frac{1}{2}\int_0^2 y\\dy\right)\mathclose{}\\dx && \text{(factor constants out of the inner integral)} \\&= \int_0^1 x \cdot\frac{1}{2} \cdot\mathopen{}\left\[\frac{y^2}{2}\right\]\mathclose{}\_0^2\\dx && \text{(antiderivative of } y \text{)} \\&= \int_0^1 x \cdot\frac{1}{2} \cdot 2\\dx && \text{(evaluate at the bounds)} \\&= \int_0^1 x\\dx && \text{(simplify)} \\&= \frac{1}{2} && \text{(integrate)} \end{aligned} \\
>
> As a check: \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} = \tfrac{1}{2}\\, \\\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = 1\\, and \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = \tfrac{1}{2}\\.

> **NOTE:**
>
> **Example 17 (When independence fails: a counterexample)** Correctly applying [Corollary 3](#cor-fubini-joint) requires the *actual* joint density \\f\_{X,Y}\\ — not the product of marginals \\f_X(x)\\f_Y(y)\\, which is valid only when \\X\\ and \\Y\\ are independent. Using the wrong joint density gives the wrong answer.
>
> Let \\X \sim \mathrm{Uniform}(0, 1)\\ and set \\Y = X\\ (so \\X\\ and \\Y\\ are perfectly correlated and **not** independent).
>
> **True expectation:**
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[X \cdot X\right\]\mathclose{} && \text{(} Y = X \text{)} \\&= \operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} && \text{(} X \cdot X = X^2 \text{)} \\&= \int_0^1 x^2\\dx && \text{(LOTUS, with the uniform density } 1 \text{ on } \[0, 1\] \text{)} \\&= \frac{1}{3} && \text{(integrate)} \end{aligned} \\
>
> **Erroneously applying the product-measure formula:**
>
> Note that Fubini–Tonelli’s own conditions still hold here (\\h(x,y) = xy\\ is nonnegative and integrable), so the error is not a failure of Fubini–Tonelli itself. Rather, the error is using the *wrong measure*: the joint distribution of \\(X, X)\\ is concentrated on the diagonal \\\\(x, x) : x \in \[0, 1\]\\ \subset \[0, 1\]^2\\, which has Lebesgue measure zero in \\\mathbb{R}^2\\. The joint distribution is therefore **not** absolutely continuous with respect to two-dimensional Lebesgue measure, so **no joint density \\f\_{X,Y}\\ on \\\[0, 1\]^2\\ exists**, which is the reference density [Corollary 3](#cor-fubini-joint) requires.
>
> The following calculation is what someone would *erroneously* write if they assumed independence and used \\f_X(x)\\f_Y(y)\\ as a “joint density” — a function that does not in fact correspond to the joint distribution of \\(X, X)\\. The marginals \\X \sim \mathrm{Uniform}(0,1)\\ and \\Y \sim \mathrm{Uniform}(0,1)\\ do have densities \\f_X = f_Y = 1\\, but the *product* \\f_X(x)\\f_Y(y) = 1\\ on \\\[0, 1\]^2\\ is the density of an *independent* pair, not of \\(X, X)\\:
>
> \\ \begin{aligned} \int_0^1\\\int_0^1 xy \cdot f_X(x) \cdot f_Y(y)\\dy\\dx &= \int_0^1\\\int_0^1 xy\\dy\\dx && \text{(} f_X(x)\\f_Y(y) = 1 \text{ on } \[0, 1\]^2 \text{)} \\&= \int_0^1 x\mathopen{}\left(\int_0^1 y\\dy\right)\mathclose{}\\dx && \text{(factor } x \text{ out of the inner integral)} \\&= \int_0^1 x \cdot\frac{1}{2}\\dx && \text{(} \textstyle\int_0^1 y\\dy = \tfrac{1}{2} \text{)} \\&= \frac{1}{4} && \text{(} \textstyle\int_0^1 \tfrac{x}{2}\\dx = \tfrac{1}{4} \text{)} \end{aligned} \\
>
> This calculation recovers \\\operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{}\\ for *independent* uniforms (\\\tfrac{1}{4}\\), not \\\operatorname{E}\mathopen{}\left\[XX\right\]\mathclose{}\\ for the perfectly correlated pair (\\\tfrac{1}{3}\\). The lesson is that [Corollary 3](#cor-fubini-joint) requires the *actual* joint density \\f\_{X,Y}\\. For independent \\(X, Y)\\, this density factors as \\f_X(x)\\f_Y(y)\\; for dependent \\(X, Y)\\, \\f\_{X,Y}\\ need not factor — and for \\(X, X)\\, no joint density on \\\mathbb{R}^2\\ exists at all, so [Corollary 3](#cor-fubini-joint) simply does not apply.
>
> Show code
>
> ``` r
> set.seed(204)
> n <- 400
> x_dep <- runif(n)
> y_dep <- x_dep
> x_ind <- runif(n)
> y_ind <- runif(n)
>
> plotly::plot_ly() |>
>   plotly::add_trace(
>     type = "scatter", mode = "markers",
>     x = x_ind, y = y_ind,
>     name = "Assumed independent (X<sub>1</sub>, X<sub>2</sub>)",
>     marker = list(size = 5, color = "#999999", opacity = 0.5)
>   ) |>
>   plotly::add_trace(
>     type = "scatter", mode = "markers",
>     x = x_dep, y = y_dep,
>     name = "Actual (X, X) on diagonal",
>     marker = list(size = 6, color = "#b40426")
>   ) |>
>   plotly::layout(
>     xaxis = list(title = "x", range = c(0, 1), scaleanchor = "y"),
>     yaxis = list(title = "y", range = c(0, 1)),
>     legend = list(orientation = "h", y = -0.2)
>   )
> ```
>
> Figure 2: Samples from the joint distribution of \\(X, X)\\ (red, on the diagonal) versus an independent pair \\(X_1, X_2)\\ with the same marginals (grey, scattered over \\\[0, 1\]^2\\). The actual joint mass for \\(X, X)\\ is concentrated on a 1-dimensional diagonal — a set of Lebesgue measure zero in \\\mathbb{R}^2\\ — so no joint density on \\\[0, 1\]^2\\ exists, and the “\\f_X(x)\\f_Y(y) = 1\\” calculation integrates against the wrong measure (the grey distribution).

> **NOTE:**
>
> **Example 18 (Both-continuous case: joint PDF on a non-rectangular support)** Let \\(X, Y)\\ have joint density \\f\_{X,Y}(x, y) = 2\\ for \\0 \le x \le y \le 1\\ (and \\0\\ otherwise). Compute \\\operatorname{E}\mathopen{}\left\[X + Y\right\]\mathclose{}\\.
>
> By [Corollary 3](#cor-fubini-joint):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X + Y\right\]\mathclose{} &= \int_0^1\\\int_0^y (x + y) \cdot 2\\dx\\dy && \text{(joint-distribution form of Fubini--Tonelli, over the support } 0 \le x \le y \le 1 \text{)} \\&= 2\int_0^1 \mathopen{}\left\[\frac{x^2}{2} + xy\right\]\mathclose{}\_{x=0}^{x=y}\\dy && \text{(antiderivative in } x \text{)} \\&= 2\int_0^1 \mathopen{}\left(\frac{y^2}{2} + y^2\right)\mathclose{}\\dy && \text{(evaluate at the bounds)} \\&= 2\int_0^1 \frac{3y^2}{2}\\dy && \text{(add)} \\&= 3\int_0^1 y^2\\dy && \text{(simplify the constant)} \\&= 3 \cdot\frac{1}{3} && \text{(integrate)} \\&= 1 && \text{(multiply)} \end{aligned} \\
>
> Show code
>
> ``` r
> n_grid <- 51
> x_seq <- seq(0, 1, length.out = n_grid)
> y_seq <- seq(0, 1, length.out = n_grid)
>
> z_mat <- outer(x_seq, y_seq, function(x, y) {
>   z <- rep(2, length(x))
>   z[x > y] <- NA
>   z
> })
>
> plotly::plot_ly(x = ~x_seq, y = ~y_seq, z = ~t(z_mat)) |>
>   plotly::add_surface(showscale = FALSE) |>
>   plotly::layout(scene = list(
>     xaxis = list(title = "x"),
>     yaxis = list(title = "y"),
>     zaxis = list(title = "f(x, y)", range = c(0, 2.5)),
>     camera = list(eye = list(x = 1.6, y = -1.6, z = 0.8))
>   ))
> ```
>
> Figure 3: Joint density \\f\_{X,Y}(x, y) = 2\\ on the triangular support \\\\(x, y) : 0 \le x \le y \le 1\\\\, and zero elsewhere. The total “volume” under the density is \\2 \cdot \tfrac{1}{2} = 1\\, as required.

> **NOTE:**
>
> **Theorem 9 (Law of iterated expectations)** For any two random variables \\X\\ and \\Y\\ with \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left\|Y\right\|\mathclose{}\right\]\mathclose{} \< \infty\\:
>
> \\\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right\]\mathclose{}\\

> **NOTE:**
>
> *Proof*. **Discrete case.** When \\X\\ and \\Y\\ are discrete, applying [Definition 1](#def-expectation) to \\\operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right\]\mathclose{}\\ and then the [law of total probability](probability-basics.llms.md#thm-total-prob) applied to the countable partition \\\\X = x : x \in \mathcal{R}(X)\\\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right\]\mathclose{} &= \sum\_{x \in \mathcal{R}(X)} \operatorname{E}\mathopen{}\left\[Y \mid X=x\right\]\mathclose{} \cdot\operatorname{P}(X=x) && \text{(LOTUS for the function } x \mapsto \operatorname{E}\mathopen{}\left\[Y \mid X=x\right\]\mathclose{} \text{)} \\&= \sum\_{x \in \mathcal{R}(X)} \mathopen{}\left(\sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y=y \mid X=x)\right)\mathclose{} \cdot\operatorname{P}(X=x) && \text{(definition of conditional expectation } \operatorname{E}\mathopen{}\left\[Y \mid X=x\right\]\mathclose{} \text{)} \\&= \sum\_{y \in \mathcal{R}(Y)} y \cdot\sum\_{x \in \mathcal{R}(X)} \operatorname{P}(Y=y \mid X=x) \cdot\operatorname{P}(X=x) && \text{(exchange order of summation: Fubini, since } \operatorname{E}\mathopen{}\left\[\mathopen{}\left\|Y\right\|\mathclose{}\right\]\mathclose{} \< \infty \text{)} \\&= \sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y=y) && \text{(law of total probability over } X \text{)} \\&= \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(definition of expectation of } Y \text{)} \end{aligned} \\
>
> **Continuous case.** When \\X\\ and \\Y\\ are continuous:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right\]\mathclose{} &= \int\_{x \in \mathcal{R}(X)} \operatorname{E}\mathopen{}\left\[Y \mid X=x\right\]\mathclose{} \cdot\operatorname{p}(X=x)\\ dx && \text{(LOTUS)} \\&= \int\_{x \in \mathcal{R}(X)} \mathopen{}\left(\int\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{p}(Y=y \mid X=x)\\ dy\right)\mathclose{} \cdot\operatorname{p}(X=x)\\ dx && \text{(definition of conditional expectation)} \\&= \int\_{x \in \mathcal{R}(X)} \int\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{p}(X=x, Y=y)\\ dy\\ dx && \text{(definition of conditional density: } \operatorname{p}(Y=y \mid X=x)\\\operatorname{p}(X=x) = \operatorname{p}(X=x, Y=y) \text{)} \\&= \int\_{y \in \mathcal{R}(Y)} y \cdot\mathopen{}\left(\int\_{x \in \mathcal{R}(X)} \operatorname{p}(X=x, Y=y)\\ dx\right)\mathclose{}\\ dy && \text{(Fubini's theorem, since } \operatorname{E}\mathopen{}\left\[\mathopen{}\left\|Y\right\|\mathclose{}\right\]\mathclose{} \< \infty \text{)} \\&= \int\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{p}(Y=y)\\ dy && \text{(marginal density from a joint density)} \\&= \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(definition of expectation)} \end{aligned} \\
>
> **Mixed case, \\X\\ discrete and \\Y\\ continuous.** With the [joint density-mass function](random-variables.llms.md#def-joint-density-mass) \\\operatorname{p}(X = x,\\ Y = y)\\, [Corollary 3](#cor-fubini-joint) applies with \\h(x, y) = y\\, counting measure for \\X\\, and Lebesgue measure for \\Y\\; its condition (b) holds because \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left\|Y\right\|\mathclose{}\right\]\mathclose{} \< \infty\\. The sum runs over the \\x\\ with \\\operatorname{P}(X = x) \> 0\\, where [Definition 6](#def-cond-mixed) defines \\\operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{}\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right\]\mathclose{} &= \sum\_{x \in \mathcal{R}(X)} \operatorname{E}\mathopen{}\left\[Y \mid X=x\right\]\mathclose{} \cdot\operatorname{P}(X=x) && \text{(LOTUS, discrete case)} \\&= \sum\_{x \in \mathcal{R}(X)} \mathopen{}\left(\int\_{\mathcal{R}(Y)} y \cdot\operatorname{p}(Y=y \mid X=x)\\dy\right)\mathclose{} \cdot\operatorname{P}(X=x) && \text{(definition of conditional expectation, mixed case)} \\&= \sum\_{x \in \mathcal{R}(X)} \int\_{\mathcal{R}(Y)} y \cdot\operatorname{p}(Y=y \mid X=x) \cdot\operatorname{P}(X=x)\\dy && \text{(move the constant } \operatorname{P}(X=x) \text{ inside the integral)} \\&= \sum\_{x \in \mathcal{R}(X)} \int\_{\mathcal{R}(Y)} y \cdot\operatorname{p}(X=x,\\ Y=y)\\dy && \text{(definition of the conditional density, mixed case)} \\&= \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(joint-distribution form of Fubini--Tonelli, with } h(x, y) = y \text{)} \end{aligned} \\
>
> **Mixed case, \\X\\ continuous and \\Y\\ discrete.** The same steps apply with the integral and the sum swapped, over the \\x\\ with \\\operatorname{p}(X = x) \> 0\\; at any other \\x\\, \\\operatorname{p}(X = x,\\ Y = y) = 0\\ for every \\y\\, because these non-negative terms sum to \\\operatorname{p}(X = x)\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right\]\mathclose{} &= \int\_{\mathcal{R}(X)} \operatorname{E}\mathopen{}\left\[Y \mid X=x\right\]\mathclose{} \cdot\operatorname{p}(X=x)\\dx && \text{(LOTUS, continuous case)} \\&= \int\_{\mathcal{R}(X)} \mathopen{}\left(\sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y=y \mid X=x)\right)\mathclose{} \cdot\operatorname{p}(X=x)\\dx && \text{(definition of conditional expectation, mixed case)} \\&= \int\_{\mathcal{R}(X)} \sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y=y \mid X=x) \cdot\operatorname{p}(X=x)\\dx && \text{(move the constant } \operatorname{p}(X=x) \text{ inside the sum)} \\&= \int\_{\mathcal{R}(X)} \sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{p}(X=x,\\ Y=y)\\dx && \text{(definition of the conditional PMF, mixed case)} \\&= \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(joint-distribution form of Fubini--Tonelli, with } h(x, y) = y \text{)} \end{aligned} \\

> **NOTE:**
>
> *Remark*. Alternate names for this identity include: the **tower rule**, the **tower property**, the **law of total expectation**, and the **smoothing theorem**.

> **NOTE:**
>
> **Theorem 10 (Conditional law of iterated expectations)** For random variables \\X\\, \\Y\\, and \\Z\\ with \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left\|Y\right\|\mathclose{}\right\]\mathclose{} \< \infty\\:
>
> \\\operatorname{E}\mathopen{}\left\[Y \mid Z\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X,Z\right\]\mathclose{} \mid Z\right\]\mathclose{}\\

> **NOTE:**
>
> *Proof*. Fix a value \\z\\ with positive probability (discrete case) or positive density (continuous case). Conditioning every probability on \\Z = z\\ gives a probability measure, and the proof of [Theorem 9](#thm-lie) goes through under it, line by line.
>
> **Discrete case.**
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X,Z\right\]\mathclose{} \mid Z=z\right\]\mathclose{} &= \sum\_{x \in \mathcal{R}(X)} \operatorname{E}\mathopen{}\left\[Y \mid X=x,Z=z\right\]\mathclose{} \cdot\operatorname{P}(X=x \mid Z=z) && \text{(expectation given } Z=z \text{)} \\&= \sum\_{x \in \mathcal{R}(X)} \mathopen{}\left(\sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y=y \mid X=x,Z=z)\right)\mathclose{} \cdot\operatorname{P}(X=x \mid Z=z) && \text{(definition of } \operatorname{E}\mathopen{}\left\[Y \mid X=x,Z=z\right\]\mathclose{} \text{)} \\&= \sum\_{y \in \mathcal{R}(Y)} y \cdot\sum\_{x \in \mathcal{R}(X)} \operatorname{P}(Y=y \mid X=x,Z=z) \cdot\operatorname{P}(X=x \mid Z=z) && \text{(exchange order of summation)} \\&= \sum\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{P}(Y=y \mid Z=z) && \text{(law of total probability given } Z=z \text{)} \\&= \operatorname{E}\mathopen{}\left\[Y \mid Z=z\right\]\mathclose{} && \text{(definition of conditional expectation given } Z=z \text{)} \end{aligned} \\
>
> **Continuous case.**
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X,Z\right\]\mathclose{} \mid Z=z\right\]\mathclose{} &= \int\_{x \in \mathcal{R}(X)} \operatorname{E}\mathopen{}\left\[Y \mid X=x,Z=z\right\]\mathclose{} \cdot\operatorname{p}(X=x \mid Z=z)\\ dx && \text{(expectation given } Z=z \text{)} \\&= \int\_{x \in \mathcal{R}(X)} \mathopen{}\left(\int\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{p}(Y=y \mid X=x,Z=z)\\ dy\right)\mathclose{} \cdot\operatorname{p}(X=x \mid Z=z)\\ dx && \text{(definition of } \operatorname{E}\mathopen{}\left\[Y \mid X=x,Z=z\right\]\mathclose{} \text{)} \\&= \int\_{x \in \mathcal{R}(X)} \int\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{p}(X=x, Y=y \mid Z=z)\\ dy\\ dx && \text{(product of conditional densities is the joint conditional density)} \\&= \int\_{y \in \mathcal{R}(Y)} y \cdot\mathopen{}\left(\int\_{x \in \mathcal{R}(X)} \operatorname{p}(X=x, Y=y \mid Z=z)\\ dx\right)\mathclose{}\\ dy && \text{(Fubini's theorem)} \\&= \int\_{y \in \mathcal{R}(Y)} y \cdot\operatorname{p}(Y=y \mid Z=z)\\ dy && \text{(marginalize over } x \text{)} \\&= \operatorname{E}\mathopen{}\left\[Y \mid Z=z\right\]\mathclose{} && \text{(definition of conditional expectation given } Z=z \text{)} \end{aligned} \\
>
> Since the two sides agree at every such \\z\\, they agree as random variables (functions of \\Z\\): \\\operatorname{E}\mathopen{}\left\[Y \mid Z\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X,Z\right\]\mathclose{} \mid Z\right\]\mathclose{}\\.

> **NOTE:**
>
> *Remark*. This identity is the tower rule applied conditionally on \\Z\\.

> **NOTE:**
>
> **Example 19 (Marginal expectation from conditional expectations)** Suppose \\X\\ is a binary random variable indicating treatment assignment (\\X=1\\ treated, \\X=0\\ control), with \\\operatorname{P}(X=1) = 0.5\\, and suppose the outcome \\Y\\ has conditional expectations:
>
> \\\operatorname{E}\mathopen{}\left\[Y \mid X=1\right\]\mathclose{} = 10, \quad \operatorname{E}\mathopen{}\left\[Y \mid X=0\right\]\mathclose{} = 6\\
>
> By the law of iterated expectations ([Theorem 9](#thm-lie)):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right\]\mathclose{} && \text{(law of iterated expectations)} \\&= \operatorname{E}\mathopen{}\left\[Y \mid X=1\right\]\mathclose{} \cdot\operatorname{P}(X=1) + \operatorname{E}\mathopen{}\left\[Y \mid X=0\right\]\mathclose{} \cdot\operatorname{P}(X=0) && \text{(LOTUS over the two values of } X \text{)} \\&= 10 \cdot 0.5 + 6 \cdot 0.5 && \text{(substitute)} \\&= 5 + 3 && \text{(multiply)} \\&= 8 && \text{(add)} \end{aligned} \\

> **NOTE:**
>
> **Exercise 3 (Both-discrete case, infinite support: joint PMF)** Let \\X\\ and \\Y\\ be independent, each Geometric on \\\mathcal{R}(X) = \mathcal{R}(Y) = \\0, 1, 2, \dots\\\\ with \\\operatorname{P}(X = x) = (1-p)\\p^x\\ for a fixed \\p \in (0, 1)\\ (\\X\\ counts the number of failures before the first success in a sequence of independent trials with success probability \\1-p\\; likewise for \\Y\\). Unlike [Exercise 2](#exr-fubini-joint-disc), the support here is countably infinite. The joint PMF is \\\operatorname{P}(X = x,\\ Y = y) = (1-p)^2\\p^{x+y}\\.
>
> Compute \\\operatorname{E}\mathopen{}\left\[X + Y\right\]\mathclose{}\\.

> **NOTE:**
>
> *Solution*. Compute \\\operatorname{E}\mathopen{}\left\[X + Y\right\]\mathclose{}\\ using [Corollary 3](#cor-fubini-joint) with \\\mu_X = \mu_Y = \text{counting measure}\\ and \\h(x, y) = x + y\\. Since \\h(x,y) = x + y \ge 0\\ for every \\(x,y)\\ in this support, condition (a) holds, so [Corollary 3](#cor-fubini-joint) (via Tonelli’s theorem) guarantees the order of this now-infinite double sum is exchangeable — unlike the finite case, elementary algebra alone could not establish this.
>
> The derivation uses the standard geometric-series facts \\\sum\_{y=0}^{\infty} p^y = \frac{1}{1-p}\\ and \\\sum\_{y=0}^{\infty} y\\p^y = \frac{p}{(1-p)^2}\\ (e.g. Casella and Berger ([2002](#ref-CaseBerg01))). By [Corollary 3](#cor-fubini-joint) (both-discrete case), summing over \\y\\ first for each fixed \\x\\:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X + Y\right\]\mathclose{} &= \sum\_{x=0}^{\infty} \sum\_{y=0}^{\infty} (x + y)\\\operatorname{P}(X = x,\\ Y = y) && \text{(joint-distribution form of Fubini--Tonelli)} \\&= \sum\_{x=0}^{\infty} \sum\_{y=0}^{\infty} (x + y)(1-p)^2 p^{x+y} && \text{(substitute the joint PMF)} \\&= \sum\_{x=0}^{\infty} (1-p)^2 p^x \sum\_{y=0}^{\infty} (x + y)\\p^y && \text{(factor } (1-p)^2 p^x \text{ out of the inner sum)} \\&= \sum\_{x=0}^{\infty} (1-p)^2 p^x \mathopen{}\left(x \sum\_{y=0}^{\infty} p^y + \sum\_{y=0}^{\infty} y\\p^y\right)\mathclose{} && \text{(split the inner sum; factor out } x \text{)} \\&= \sum\_{x=0}^{\infty} (1-p)^2 p^x \mathopen{}\left(\frac{x}{1-p} + \frac{p}{(1-p)^2}\right)\mathclose{} && \text{(geometric-series facts)} \\&= \sum\_{x=0}^{\infty} p^x \mathopen{}\left\[x(1-p) + p\right\]\mathclose{} && \text{(multiply } (1-p)^2 \text{ into the parentheses)} \\&= (1-p) \sum\_{x=0}^{\infty} x\\p^x + p \sum\_{x=0}^{\infty} p^x && \text{(split the sum; factor out the constants)} \\&= (1-p) \cdot\frac{p}{(1-p)^2} + p \cdot\frac{1}{1-p} && \text{(geometric-series facts)} \\&= \frac{p}{1-p} + \frac{p}{1-p} && \text{(cancel } 1 - p \text{)} \\&= \frac{2p}{1-p} && \text{(add)} \end{aligned} \\
>
> As a check, \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = \frac{p}{1-p}\\ (the mean of this Geometric distribution; Casella and Berger ([2002](#ref-CaseBerg01))), so \\\operatorname{E}\mathopen{}\left\[X + Y\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = \frac{2p}{1-p}\\ by [linearity of expectation](#thm-linearity-expectation), matching.
>
> Show code
>
> ``` r
> p <- 0.4
> exact_sum <- 2 * p / (1 - p)
>
> n_trunc <- 500
> support <- 0:n_trunc
> joint_pmf_fn <- function(x, y) (1 - p)^2 * p^(x + y)
> joint_probs <- outer(support, support, joint_pmf_fn)
> h_vals <- outer(support, support, function(x, y) x + y)
>
> sum_y_first <- sum(rowSums(h_vals * joint_probs))
> sum_x_first <- sum(colSums(h_vals * joint_probs))
>
> pander::pander(data.frame(
>   quantity = c("exact (closed form)", "sum over y first, then x",
>                "sum over x first, then y"),
>   value = round(c(exact_sum, sum_y_first, sum_x_first), 6)
> ))
> ```
>
> |         quantity         | value |
> |:------------------------:|:-----:|
> |   exact (closed form)    | 1.333 |
> | sum over y first, then x | 1.333 |
> | sum over x first, then y | 1.333 |
>
> With \\p = 0.4\\, the truncated sums agree with the closed form \\\frac{2p}{1-p} = 1.3333\\ up to truncation error, which confirms the closed form. They cannot illustrate Tonelli’s guarantee, though: each truncation is a finite sum, and a finite sum gives the same total in either order, whether or not the infinite sums would agree. That the infinite sums agree is what Tonelli’s theorem supplies.

> **NOTE:**
>
> The calculation in [Exercise 3](#exr-fubini-joint-disc-infinite) only needed condition (a), \\h(X,Y) \ge 0\\, because \\h(x,y) = x+y\\ is nonnegative on this support. For a **signed** \\h\\, interchanging an infinite double sum is not automatically valid — [Corollary 3](#cor-fubini-joint)’s condition (b), \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left\|h(X,Y)\right\|\mathclose{}\right\]\mathclose{} \< \infty\\, is what licenses it in that case. Without either condition, the two orders can genuinely disagree. A standard example (a signed array, not a probability distribution; see e.g. ([Rudin 1976](#ref-rudin1976principles), Theorem 3.54, p. 76) for the general theory of rearranging series): let \\a\_{m,n} = 1\\ if \\m = n\\, \\a\_{m,n} = -1\\ if \\m = n+1\\, and \\a\_{m,n} = 0\\ otherwise, for \\m, n = 0, 1, 2, \dots\\. Summing each row \\m\\ first: row \\0\\ has only the term \\a\_{0,0}=1\\ (there is no valid \\n = -1\\), so its row sum is \\1\\; every row \\m \ge 1\\ has \\a\_{m,m} = 1\\ and \\a\_{m,m-1} = -1\\, so its row sum is \\0\\. Summing the rows then gives \\1 + 0 + 0 + \cdots = 1\\. Summing each column \\n\\ first: every column \\n \ge 0\\ has \\a\_{n,n} = 1\\ and \\a\_{n+1,n} = -1\\, so its column sum is always \\0\\, and summing the columns then gives \\0 + 0 + \cdots = 0\\. The two orders give \\1\\ and \\0\\: genuinely different answers, confirming that a condition like (a) or (b) really is needed once the terms are no longer all nonnegative.

> **NOTE:**
>
> **Exercise 4 (Mixed case: one continuous variable, one discrete variable)** Let \\Y \sim \mathrm{Bernoulli}(0.6)\\ and, given \\Y = y\\, let \\X \mid Y = y \sim \mathrm{Uniform}(0,\\ y + 1)\\.
>
> Compute \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\\.

> **NOTE:**
>
> *Solution*. Compute \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\\ using [Corollary 3](#cor-fubini-joint) with \\\mu_X = \text{Lebesgue measure}\\, \\\mu_Y = \text{counting measure}\\, and \\h(x, y) = x\\.
>
> The joint density w.r.t. Lebesgue \\\times\\ counting measure is \\f\_{X,Y}(x, y) = f\_{X \mid Y}(x \mid y)\\\operatorname{P}(Y = y)\\:
>
> \\ \begin{aligned} f\_{X,Y}(x,\\ 0) &= 1 \cdot 0.4 = 0.4 &&\text{ for } x \in \[0,1\];\\ f\_{X,Y}(x,\\ 1) &= \tfrac{1}{2} \cdot 0.6 = 0.3 &&\text{ for } x \in \[0,2\]. \end{aligned} \\
>
> By [Corollary 3](#cor-fubini-joint) (mixed case):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} &= \sum\_{y \in \\0,1\\} \int_0^{y+1} x\\f\_{X,Y}(x,\\ y)\\dx && \text{(joint-distribution form of Fubini--Tonelli, mixed case)} \\ &= \int_0^1 x \cdot 0.4\\dx + \int_0^2 x \cdot 0.3\\dx && \text{(expand the sum over } y \in \\0, 1\\ \text{; substitute } f\_{X,Y} \text{)} \\ &= 0.4 \cdot \frac{1}{2} + 0.3 \cdot 2 && \text{(} \textstyle\int_0^b x\\dx = b^2/2 \text{)} \\ &= 0.2 + 0.6 && \text{(multiply)} \\ &= 0.8 && \text{(add)} \end{aligned} \\
>
> As a check using the law of iterated expectations ([Theorem 9](#thm-lie)): \\\operatorname{E}\mathopen{}\left\[X \mid Y = 0\right\]\mathclose{} = \tfrac{1}{2}\\ and \\\operatorname{E}\mathopen{}\left\[X \mid Y = 1\right\]\mathclose{} = 1\\, so \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} = \tfrac{1}{2}(0.4) + 1(0.6) = 0.2 + 0.6 = 0.8\\.
>
> Show code
>
> ``` r
> x_fine <- seq(0, 2, by = 0.005)
> df <- data.frame(
>   x = c(x_fine[x_fine <= 1], x_fine),
>   density = c(rep(0.4, sum(x_fine <= 1)), rep(0.3, length(x_fine))),
>   label = c(
>     rep("Y = 0  (P = 0.4)", sum(x_fine <= 1)),
>     rep("Y = 1  (P = 0.6)", length(x_fine))
>   )
> )
>
> plotly::plot_ly(
>   df, x = ~x, y = ~density, color = ~label,
>   colors = c("steelblue", "tomato")
> ) |>
>   plotly::add_lines() |>
>   plotly::layout(
>     xaxis = list(title = "x"),
>     yaxis = list(title = "f<sub>X,Y</sub>(x, y)", range = c(0, 0.55)),
>     legend = list(title = list(text = "Y value"))
>   )
> ```
>
> Figure 4: Joint density \\f\_{X,Y}(x, y) = f\_{X \mid Y}(x \mid y)\\\operatorname{P}(Y = y)\\ for each value of the discrete variable \\Y\\. The area under each component integrates to \\\operatorname{P}(Y = y)\\: \\0.4 \cdot 1 = 0.4\\ (blue) and \\0.3 \cdot 2 = 0.6\\ (red), summing to 1.

> **NOTE:**
>
> *Remark*. \\Y\\ takes only finitely many values here (two), so \\\sum\_{y \in \\0,1\\} \int_0^{y+1} x\\f\_{X,Y}(x,\\y)\\dx\\ is just linearity of the integral applied to a two-term sum — \\\int g + \int k = \int (g + k)\\ — not a genuine interchange of summation and integration order. If \\Y\\ had a countably infinite range instead, the sum of integrals would be an infinite series, and [Corollary 3](#cor-fubini-joint)’s guarantee would be load-bearing.

> **NOTE:**
>
> **Exercise 5 (Mixed case, infinite discrete support)** Let \\Y\\ be Geometric on \\\\0, 1, 2, \dots\\\\ with \\\operatorname{P}(Y = y) = (1-q)\\q^y\\ for a fixed \\q \in (0, 1)\\ and, given \\Y = y\\, let \\X \mid Y = y \sim \mathrm{Uniform}(0,\\ y+1)\\. Unlike [Exercise 4](#exr-fubini-joint-mixed), \\Y\\’s range here is countably infinite.
>
> Compute \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\\.

> **NOTE:**
>
> *Solution*. Compute \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\\ using [Corollary 3](#cor-fubini-joint) with \\\mu_X = \text{Lebesgue measure}\\, \\\mu_Y = \text{counting measure}\\, and \\h(x, y) = x\\.
>
> The joint density w.r.t. Lebesgue \\\times\\ counting measure is \\f\_{X,Y}(x, y) = f\_{X \mid Y}(x \mid y)\\\operatorname{P}(Y = y) = \frac{(1-q)\\q^y}{y+1}\\ for \\x \in \[0, y+1\]\\.
>
> Since \\h(x, y) = x \ge 0\\ on this support, condition (a) holds, so [Corollary 3](#cor-fubini-joint) (via Tonelli’s theorem) guarantees the now-infinite sum-of-integrals expression is valid — unlike in [Exercise 4](#exr-fubini-joint-mixed), this Fubini–Tonelli justification is required because the sum is infinite rather than finite.
>
> By [Corollary 3](#cor-fubini-joint) (mixed case):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} &= \sum\_{y=0}^{\infty} \int_0^{y+1} x\\f\_{X,Y}(x,\\y)\\dx && \text{(joint-distribution form of Fubini--Tonelli, mixed case)} \\&= \sum\_{y=0}^{\infty} \frac{(1-q)\\q^y}{y+1} \int_0^{y+1} x\\dx && \text{(} f\_{X,Y}(x, y) \text{ is constant in } x \text{ on } \[0, y+1\] \text{)} \\&= \sum\_{y=0}^{\infty} \frac{(1-q)\\q^y}{y+1} \cdot\frac{(y+1)^2}{2} && \text{(integrate)} \\&= \frac{1-q}{2} \sum\_{y=0}^{\infty} (y+1)\\q^y && \text{(cancel } y + 1 \text{; factor out } \tfrac{1-q}{2} \text{)} \\&= \frac{1-q}{2} \mathopen{}\left(\sum\_{y=0}^{\infty} y\\q^y + \sum\_{y=0}^{\infty} q^y\right)\mathclose{} && \text{(split the sum)} \\&= \frac{1-q}{2} \mathopen{}\left(\frac{q}{(1-q)^2} + \frac{1}{1-q}\right)\mathclose{} && \text{(geometric-series facts)} \\&= \frac{1-q}{2} \cdot\frac{q + (1-q)}{(1-q)^2} && \text{(common denominator)} \\&= \frac{1-q}{2} \cdot\frac{1}{(1-q)^2} && \text{(simplify the numerator)} \\&= \frac{1}{2(1-q)} && \text{(cancel } 1 - q \text{)} \end{aligned} \\
>
> using the same geometric-series facts as [Exercise 3](#exr-fubini-joint-disc-infinite) (e.g. Casella and Berger ([2002](#ref-CaseBerg01))).
>
> As a check using the law of iterated expectations ([Theorem 9](#thm-lie)) and the expectation of a linear function ([Corollary 1](#cor-linearity-affine)): \\\operatorname{E}\mathopen{}\left\[X \mid Y=y\right\]\mathclose{} = \frac{y+1}{2}\\ (the mean of \\\mathrm{Uniform}(0,y+1)\\) and \\\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = \frac{q}{1-q}\\ (the mean of this Geometric distribution; Casella and Berger ([2002](#ref-CaseBerg01))), so:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[X \mid Y\right\]\mathclose{}\right\]\mathclose{} && \text{(law of iterated expectations)} \\&= \operatorname{E}\mathopen{}\left\[\frac{Y+1}{2}\right\]\mathclose{} && \text{(} \operatorname{E}\mathopen{}\left\[X \mid Y = y\right\]\mathclose{} = \tfrac{y+1}{2} \text{)} \\&= \frac{\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} + 1}{2} && \text{(expectation of a linear function of one random variable)} \\&= \frac{1}{2}\mathopen{}\left(\frac{q}{1-q} + 1\right)\mathclose{} && \text{(substitute } \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} \text{)} \\&= \frac{1}{2} \cdot\frac{q + (1-q)}{1-q} && \text{(common denominator)} \\&= \frac{1}{2(1-q)} && \text{(simplify the numerator)} \end{aligned} \\
>
> matching.
>
> Show code
>
> ``` r
> q <- 0.5
> exact_ex <- 1 / (2 * (1 - q))
>
> n_trunc <- 2000
> y_vals <- 0:n_trunc
> py_vals <- (1 - q) * q^y_vals
> cond_mean_x <- (y_vals + 1) / 2
> trunc_ex <- sum(cond_mean_x * py_vals)
>
> pander::pander(data.frame(
>   quantity = c("exact (closed form)", "truncated sum-of-integrals"),
>   value = round(c(exact_ex, trunc_ex), 6)
> ))
> ```
>
> |          quantity          | value |
> |:--------------------------:|:-----:|
> |    exact (closed form)     |   1   |
> | truncated sum-of-integrals |   1   |
>
> With \\q = 0.5\\, the truncated sum-of-integrals matches the closed form \\\frac{1}{2(1-q)} = 1\\.

## 3 Loss and risk

> **NOTE:**
>
> **Definition 9 (Prediction)** A **prediction** of a random variable \\Y\\ is a constant \\\hat{y}\\, or a function \\\hat{Y} \stackrel{\text{def}}{=}g(X)\\ of another observable random variable \\X\\, used as a guess for the value \\Y\\ takes:
>
> \\\hat{y} \quad \text{or} \quad \hat{Y} \stackrel{\text{def}}{=}g(X)\\

> **NOTE:**
>
> *Remark*. When no covariate or feature is available, a prediction is a single number \\\hat{y}\\ (such as a constant \\c\\). When an informative random variable \\X\\ is observed, a prediction is a function \\g(X)\\, which is itself a random variable because \\X\\ is random. The quality of a prediction is evaluated using a [loss function](#def-loss-function) and its expected value, the [risk](#def-risk).

> **NOTE:**
>
> **Exercise 6 (Squared and absolute loss)**  
>
> 1.  For a true value \\y = 3\\ and a prediction \\\hat{y} = 5\\, compute the squared error loss \\\mathopen{}\left(y - \hat{y}\right)^2\mathclose{}\\ and the absolute error loss \\\mathopen{}\left\|y - \hat{y}\right\|\mathclose{}\\.
>
> 2.  A random variable \\Y\\ has \\\operatorname{P}(Y = 0) = 0.5\\ and \\\operatorname{P}(Y = 4) = 0.5\\. For the constant prediction \\c = 1\\, compute the expected squared error loss \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - c\right)^2\mathclose{}\right\]\mathclose{}\\ and the expected absolute error loss \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left\|Y - c\right\|\mathclose{}\right\]\mathclose{}\\.
>
> 3.  Repeat part 2 for \\c = 2\\.
>
> 4.  Which of \\c = 1\\ and \\c = 2\\ gives the smaller expected loss under each loss?

> **NOTE:**
>
> *Solution 2*.
>
> 1.  For squared error loss: \\\mathopen{}\left(3 - 5\right)^2\mathclose{} = 4\\ For absolute error loss: \\\mathopen{}\left\|3 - 5\right\|\mathclose{} = 2\\
>
> 2.  For \\c = 1\\: The expected squared error loss is: \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - 1\right)^2\mathclose{}\right\]\mathclose{} = 0.5 \cdot\mathopen{}\left(0 - 1\right)^2\mathclose{} + 0.5 \cdot\mathopen{}\left(4 - 1\right)^2\mathclose{} = 0.5 \cdot 1 + 0.5 \cdot 9 = 5\\ The expected absolute error loss is: \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left\|Y - 1\right\|\mathclose{}\right\]\mathclose{} = 0.5 \cdot\mathopen{}\left\|0 - 1\right\|\mathclose{} + 0.5 \cdot\mathopen{}\left\|4 - 1\right\|\mathclose{} = 0.5 \cdot 1 + 0.5 \cdot 3 = 2\\
>
> 3.  For \\c = 2\\: The expected squared error loss is: \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - 2\right)^2\mathclose{}\right\]\mathclose{} = 0.5 \cdot\mathopen{}\left(0 - 2\right)^2\mathclose{} + 0.5 \cdot\mathopen{}\left(4 - 2\right)^2\mathclose{} = 0.5 \cdot 4 + 0.5 \cdot 4 = 4\\ The expected absolute error loss is: \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left\|Y - 2\right\|\mathclose{}\right\]\mathclose{} = 0.5 \cdot\mathopen{}\left\|0 - 2\right\|\mathclose{} + 0.5 \cdot\mathopen{}\left\|4 - 2\right\|\mathclose{} = 0.5 \cdot 2 + 0.5 \cdot 2 = 2\\
>
> 4.  The prediction \\c = 2\\ has the smaller expected squared error loss (\\4\\ versus \\5\\). The two predictions have the same expected absolute error loss (\\2\\), so under absolute error loss this exercise does not choose one of them. The prediction \\c = 2\\ equals the expectation: \\\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = 0.5 \cdot 0 + 0.5 \cdot 4 = 2\\

> **NOTE:**
>
> **Definition 10 (Loss function)** A **loss function** \\L(y, \hat{y})\\ is a rule that gives a number that is 0 or larger: the cost of [predicting](#def-prediction) \\\hat{y}\\ when the true value is \\y\\.

> **NOTE:**
>
> *Remark*. The squared error loss is: \\L(y, \hat{y}) = \mathopen{}\left(y - \hat{y}\right)^2\mathclose{}\\
>
> The absolute error loss is: \\L(y, \hat{y}) = \mathopen{}\left\|y - \hat{y}\right\|\mathclose{}\\
>
> Hastie et al. ([2009, 18](#ref-hastie2009elements)) call squared error loss “by far the most common and convenient” choice.
>
> For the values \\y = 3\\ and \\\hat{y} = 5\\ from [Exercise 6](#exr-loss) (part 1), the squared error loss is \\4\\, and the absolute error loss is \\2\\.

> **NOTE:**
>
> **Definition 11 (Risk (expected loss))** For a random variable \\Y\\ and a [prediction](#def-prediction) \\\hat{y}\\ (a constant, or a function \\g(X)\\ of a random input \\X\\), the **risk** is the expectation of the [loss](#def-loss-function):
>
> \\R \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[L(Y, \hat{y})\right\]\mathclose{}\\

> **NOTE:**
>
> *Remark*. In [Exercise 6](#exr-loss) (parts 2 and 3), the risk of the prediction \\c = 1\\ is \\5\\ for squared error loss and \\2\\ for absolute error loss. The risk of the prediction \\c = 2\\ is \\4\\ for squared error loss and \\2\\ for absolute error loss.
>
> For squared error loss and a prediction \\g(X)\\, the risk is \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g(X)\right)^2\mathclose{}\right\]\mathclose{}\\. Hastie et al. ([2009, 18](#ref-hastie2009elements)) call it the expected prediction error.
>
> The prediction with the smallest risk depends on the loss. In [Exercise 6](#exr-loss), every constant \\c\\ from \\0\\ to \\4\\ has absolute error risk \\2\\, because \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left\|Y - c\right\|\mathclose{}\right\]\mathclose{} = 0.5\\c + 0.5\\(4 - c) = 2\\. Only \\c = 2\\ has the smallest squared error risk. Under squared error loss, the prediction function that minimizes risk is the conditional mean \\\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\\, proved below ([Theorem 11](#thm-best-predictor)). Hastie et al. ([2009, 20](#ref-hastie2009elements)) state that, for absolute error loss, the best prediction function is the conditional median instead of the conditional mean. This statement is given here without proof.

> **NOTE:**
>
> **Exercise 7 (Comparing prediction functions under squared-error loss)** Let \\(X, Y)\\ be jointly distributed discrete random variables. \\X\\ takes values in \\\\0, 1\\\\ with \\\operatorname{P}(X = 0) = 0.5\\ and \\\operatorname{P}(X = 1) = 0.5\\. Given \\X = 0\\, \\Y\\ takes values in \\\\0, 2\\\\ with conditional probabilities \\\operatorname{P}(Y = 0 \mid X = 0) = 0.5\\ and \\\operatorname{P}(Y = 2 \mid X = 0) = 0.5\\. Given \\X = 1\\, \\Y\\ takes values in \\\\4, 6\\\\ with conditional probabilities \\\operatorname{P}(Y = 4 \mid X = 1) = 0.5\\ and \\\operatorname{P}(Y = 6 \mid X = 1) = 0.5\\.
>
> 1.  Compute the marginal mean \\\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\\ and the conditional expectation function \\g^\*(X) \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\\.
>
> 2.  Consider the constant prediction \\g_1(X) \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = 3\\, which ignores \\X\\. Compute its squared-error risk \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g_1(X)\right)^2\mathclose{}\right\]\mathclose{}\\.
>
> 3.  Consider the alternate prediction \\g_2(X) \stackrel{\text{def}}{=}4X\\. Compute its squared-error risk \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g_2(X)\right)^2\mathclose{}\right\]\mathclose{}\\.
>
> 4.  Compute the squared-error risk \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g^\*(X)\right)^2\mathclose{}\right\]\mathclose{}\\ of the conditional mean predictor \\g^\*(X)\\. Which of \\g_1\\, \\g_2\\, and \\g^\*\\ achieves the lowest risk?

> **NOTE:**
>
> *Solution 3*.
>
> 1.  For each value of \\X\\, compute the conditional expectation: \\\operatorname{E}\mathopen{}\left\[Y \mid X = 0\right\]\mathclose{} = 0 \cdot 0.5 + 2 \cdot 0.5 = 1\\ \\\operatorname{E}\mathopen{}\left\[Y \mid X = 1\right\]\mathclose{} = 4 \cdot 0.5 + 6 \cdot 0.5 = 5\\ By the law of iterated expectations ([Theorem 9](#thm-lie)), the marginal mean is: \\\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right\]\mathclose{} = 1 \cdot 0.5 + 5 \cdot 0.5 = 3\\ The conditional expectation function is \\g^\*(0) = 1\\ and \\g^\*(1) = 5\\, which can also be written \\g^\*(X) = 1 + 4X\\.
>
> 2.  For the constant prediction \\g_1(X) = 3\\: Given \\X = 0\\: \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - 3\right)^2\mathclose{} \mid X = 0\right\]\mathclose{} = \mathopen{}\left(0 - 3\right)^2\mathclose{} \cdot 0.5 + \mathopen{}\left(2 - 3\right)^2\mathclose{} \cdot 0.5 = 9 \cdot 0.5 + 1 \cdot 0.5 = 5\\ Given \\X = 1\\: \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - 3\right)^2\mathclose{} \mid X = 1\right\]\mathclose{} = \mathopen{}\left(4 - 3\right)^2\mathclose{} \cdot 0.5 + \mathopen{}\left(6 - 3\right)^2\mathclose{} \cdot 0.5 = 1 \cdot 0.5 + 9 \cdot 0.5 = 5\\ By the law of iterated expectations ([Theorem 9](#thm-lie)): \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g_1(X)\right)^2\mathclose{}\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - 3\right)^2\mathclose{} \mid X\right\]\mathclose{}\right\]\mathclose{} = 5 \cdot 0.5 + 5 \cdot 0.5 = 5\\
>
> 3.  For the prediction \\g_2(X) = 4X\\: Here \\g_2(0) = 0\\ and \\g_2(1) = 4\\. Given \\X = 0\\: \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - 0\right)^2\mathclose{} \mid X = 0\right\]\mathclose{} = \mathopen{}\left(0 - 0\right)^2\mathclose{} \cdot 0.5 + \mathopen{}\left(2 - 0\right)^2\mathclose{} \cdot 0.5 = 0 \cdot 0.5 + 4 \cdot 0.5 = 2\\ Given \\X = 1\\: \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - 4\right)^2\mathclose{} \mid X = 1\right\]\mathclose{} = \mathopen{}\left(4 - 4\right)^2\mathclose{} \cdot 0.5 + \mathopen{}\left(6 - 4\right)^2\mathclose{} \cdot 0.5 = 0 \cdot 0.5 + 4 \cdot 0.5 = 2\\ By [Theorem 9](#thm-lie): \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g_2(X)\right)^2\mathclose{}\right\]\mathclose{} = 2 \cdot 0.5 + 2 \cdot 0.5 = 2\\
>
> 4.  For the conditional mean predictor \\g^\*(X) = \operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\\: Given \\X = 0\\, \\g^\*(0) = 1\\: \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - 1\right)^2\mathclose{} \mid X = 0\right\]\mathclose{} = \mathopen{}\left(0 - 1\right)^2\mathclose{} \cdot 0.5 + \mathopen{}\left(2 - 1\right)^2\mathclose{} \cdot 0.5 = 1 \cdot 0.5 + 1 \cdot 0.5 = 1\\ Given \\X = 1\\, \\g^\*(1) = 5\\: \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - 5\right)^2\mathclose{} \mid X = 1\right\]\mathclose{} = \mathopen{}\left(4 - 5\right)^2\mathclose{} \cdot 0.5 + \mathopen{}\left(6 - 5\right)^2\mathclose{} \cdot 0.5 = 1 \cdot 0.5 + 1 \cdot 0.5 = 1\\ By [Theorem 9](#thm-lie): \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g^\*(X)\right)^2\mathclose{}\right\]\mathclose{} = 1 \cdot 0.5 + 1 \cdot 0.5 = 1\\ The conditional mean predictor \\g^\*\\ achieves the lowest risk (\\1\\), strictly outperforming \\g_2\\ (\\2\\) and the constant prediction \\g_1\\ (\\5\\).

> **NOTE:**
>
> **Theorem 11 (Conditional mean minimizes squared-error risk)** Let \\X\\ and \\Y\\ be jointly distributed random variables with \\\operatorname{E}\mathopen{}\left\[Y^2\right\]\mathclose{} \< \infty\\. Let \\g^\*(X) \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\\. Then for any prediction function \\g(X)\\ with \\\operatorname{E}\mathopen{}\left\[g(X)^2\right\]\mathclose{} \< \infty\\:
>
> \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g(X)\right)^2\mathclose{}\right\]\mathclose{} \ge \operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g^\*(X)\right)^2\mathclose{}\right\]\mathclose{}\\
>
> with equality if and only if \\\operatorname{P}(g(X) = g^\*(X)) = 1\\. That is, the conditional expectation function \\\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\\ minimizes the squared-error risk among all prediction functions of \\X\\.

> **NOTE:**
>
> *Proof*. Write \\Y - g(X) = \mathopen{}\left(Y - g^\*(X)\right)\mathclose{} + \mathopen{}\left(g^\*(X) - g(X)\right)\mathclose{}\\. Squaring both sides gives:
>
> \\\mathopen{}\left(Y - g(X)\right)^2\mathclose{} = \mathopen{}\left(Y - g^\*(X)\right)^2\mathclose{} + 2\mathopen{}\left(Y - g^\*(X)\right)\mathclose{}\mathopen{}\left(g^\*(X) - g(X)\right)\mathclose{} + \mathopen{}\left(g^\*(X) - g(X)\right)^2\mathclose{}\\
>
> We compute the expectation of the cross-product term by conditioning on \\X\\. Because \\g^\*(X) - g(X)\\ is a function of \\X\\, by [Theorem 7](#thm-cond-pull-out) it factors out of the conditional expectation:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g^\*(X)\right)\mathclose{}\mathopen{}\left(g^\*(X) - g(X)\right)\mathclose{} \mid X\right\]\mathclose{} &= \mathopen{}\left(g^\*(X) - g(X)\right)\mathclose{} \cdot\operatorname{E}\mathopen{}\left\[Y - g^\*(X) \mid X\right\]\mathclose{} && \text{(a function of } X \text{ factors out)} \\ &= \mathopen{}\left(g^\*(X) - g(X)\right)\mathclose{} \cdot\mathopen{}\left(\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[g^\*(X) \mid X\right\]\mathclose{}\right)\mathclose{} && \text{(linearity of conditional expectation)} \\ &= \mathopen{}\left(g^\*(X) - g(X)\right)\mathclose{} \cdot\mathopen{}\left(g^\*(X) - g^\*(X)\right)\mathclose{} && \text{(definition of } g^\*(X) \text{ and } \operatorname{E}\mathopen{}\left\[g^\*(X) \mid X\right\]\mathclose{} = g^\*(X) \text{)} \\ &= 0 && \text{(evaluate)} \end{aligned} \\
>
> By the law of iterated expectations ([Theorem 9](#thm-lie)), the unconditional expectation of the cross-product is:
>
> \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g^\*(X)\right)\mathclose{}\mathopen{}\left(g^\*(X) - g(X)\right)\mathclose{}\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g^\*(X)\right)\mathclose{}\mathopen{}\left(g^\*(X) - g(X)\right)\mathclose{} \mid X\right\]\mathclose{}\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[0\right\]\mathclose{} = 0\\
>
> Taking expectations on both sides of the squared expansion, by linearity of expectation ([Theorem 4](#thm-linearity-expectation)):
>
> \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g(X)\right)^2\mathclose{}\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g^\*(X)\right)^2\mathclose{}\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[\mathopen{}\left(g^\*(X) - g(X)\right)^2\mathclose{}\right\]\mathclose{}\\
>
> Since \\\mathopen{}\left(g^\*(X) - g(X)\right)^2\mathclose{} \ge 0\\, its expectation is non-negative:
>
> \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(g^\*(X) - g(X)\right)^2\mathclose{}\right\]\mathclose{} \ge 0\\
>
> with equality if and only if \\\mathopen{}\left(g^\*(X) - g(X)\right)^2\mathclose{} = 0\\ with probability \\1\\, meaning \\\operatorname{P}(g(X) = g^\*(X)) = 1\\. Therefore:
>
> \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g(X)\right)^2\mathclose{}\right\]\mathclose{} \ge \operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g^\*(X)\right)^2\mathclose{}\right\]\mathclose{}\\
>
> with equality if and only if \\\operatorname{P}(g(X) = g^\*(X)) = 1\\.

> **NOTE:**
>
> **Definition 12 (Irreducible risk)** In the squared-error risk decomposition of [Theorem 11](#thm-best-predictor), the minimum risk
>
> \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - \operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right)^2\mathclose{}\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{Var}\mathopen{}\left(Y \mid X\right)\mathclose{}\right\]\mathclose{}\\
>
> is the **irreducible risk**. It depends only on the joint distribution of \\(X, Y)\\ and not on the prediction function \\g\\, so no choice of \\g\\ can achieve a smaller risk. For example, in [Exercise 7](#exr-best-predictor), \\\operatorname{Var}\mathopen{}\left(Y \mid X = 0\right)\mathclose{} = 1\\ and \\\operatorname{Var}\mathopen{}\left(Y \mid X = 1\right)\mathclose{} = 1\\, so the irreducible risk is \\\operatorname{E}\mathopen{}\left\[\operatorname{Var}\mathopen{}\left(Y \mid X\right)\mathclose{}\right\]\mathclose{} = 1\\.

> **NOTE:**
>
> **Definition 13 (Reducible risk)** In the squared-error risk decomposition of [Theorem 11](#thm-best-predictor), the excess risk from choosing the prediction function \\g\\ instead of the conditional mean,
>
> \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{} - g(X)\right)^2\mathclose{}\right\]\mathclose{} \ge 0\\
>
> is the **reducible risk**. It is zero if and only if \\\operatorname{P}(g(X) = \operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}) = 1\\. For example, in [Exercise 7](#exr-best-predictor), the constant prediction \\g_1(X) = 3\\ has reducible risk \\5 - 1 = 4\\, and the prediction \\g_2(X) = 4X\\ has reducible risk \\2 - 1 = 1\\.

> **NOTE:**
>
> *Remark*. This characterization of the best predictor under squared error loss follows Hastie et al. ([2009, sec. 2.4](#ref-hastie2009elements), eq. 2.11). The risk identity in [Theorem 11](#thm-best-predictor)
>
> \\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - g(X)\right)^2\mathclose{}\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - \operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right)^2\mathclose{}\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[\mathopen{}\left(\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{} - g(X)\right)^2\mathclose{}\right\]\mathclose{}\\
>
> shows that the total squared-error risk is the sum of the irreducible risk ([Definition 12](#def-irreducible-risk)) and the reducible risk ([Definition 13](#def-reducible-risk)).

## References

Billingsley, Patrick. 1995. *Probability and Measure*. 3rd ed. Wiley Series in Probability and Mathematical Statistics. Wiley.

Casella, George, and Roger Berger. 2002. *Statistical Inference*. 2nd ed. Cengage Learning. <https://www.cengage.com/c/statistical-inference-2e-casella-berger/9780534243128/>.

Dobson, Annette J, and Adrian G Barnett. 2018. *An Introduction to Generalized Linear Models*. 4th ed. CRC press. <https://doi.org/10.1201/9781315182780>.

Gut, Allan. 2013. *Probability: A Graduate Course*. 2nd ed. Springer Texts in Statistics. Springer. <https://doi.org/10.1007/978-1-4614-4708-5>.

Hastie, Trevor, Robert Tibshirani, and Jerome Friedman. 2009. *The Elements of Statistical Learning: Data Mining, Inference, and Prediction*. 2nd ed. Springer. <https://doi.org/10.1007/978-0-387-84858-7>.

Ross, Kevin. 2022. *An Introduction to Probability and Simulation*. Bookdown. <https://bookdown.org/kevin_davisross/probsim-book/>.

Rudin, Walter. 1976. *Principles of Mathematical Analysis*. 3rd ed. International Series in Pure and Applied Mathematics. McGraw-Hill.

Soch, Joram. 2020. *Proof: Expected Value of a Non-Negative Random Variable*. The Book of Statistical Proofs. <https://doi.org/10.5281/zenodo.4305949>.

Wikipedia contributors. 2026. *Law of the Unconscious Statistician — Wikipedia, the Free Encyclopedia*. <https://en.wikipedia.org/wiki/Law_of_the_unconscious_statistician>.

Back to top
