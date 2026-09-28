# Random variables

Code

Published

Last modified: 2026-09-28 03:31:52 (PDT)

## 1 Random variables

> **NOTE:**
>
> **Definition 1 (Random variable)** A **random variable** is a function from a [sample space](probability-basics.llms.md#def-sample-space) \\\Omega\\ to the real numbers \\\mathbb{R}\\: it assigns a number to each possible outcome of a random experiment.

We use uppercase letters (\\X\\, \\Y\\, \\Z\\, …) for random variables, and lowercase letters (\\x\\, \\y\\, \\z\\, …) for their realized (observed) values. We write \\\\X = x\\\\ for the event \\\\\omega \in \Omega : X(\omega) = x\\\\, and similarly for \\\\X \le x\\\\ and other conditions on \\X\\. A fully rigorous definition also requires the function to be *measurable*, so that every such set is an event with a probability; that requirement never binds in these notes.

See also: <https://en.wikipedia.org/wiki/Random_variable>

> **NOTE:**
>
> **Example 1 (Number of heads in two coin flips)** Flip a fair coin twice. The sample space is \\\Omega = \mathopen{}\left\\HH, HT, TH, TT\right\\\mathclose{}\\, each outcome with probability \\1/4\\. Let \\X\\ be the number of heads:
>
> \\X(HH) = 2, \quad X(HT) = X(TH) = 1, \quad X(TT) = 0\\
>
> Then \\\\X = 1\\ = \mathopen{}\left\\HT, TH\right\\\mathclose{}\\, so \\\Pr(X = 1) = 1/4 + 1/4 = 1/2\\.

> **NOTE:**
>
> **Definition 2 (Range of a random variable)** The **range** of a random variable \\X\\, denoted \\\mathcal{R}(X)\\, is the set of values \\X\\ can take:
>
> \\\mathcal{R}(X) \stackrel{\text{def}}{=}\mathopen{}\left\\X(\omega) : \omega \in \Omega\right\\\mathclose{}\\

> **NOTE:**
>
> **Example 2 (Range of the number of heads)** In [Example 1](#exm-random-variable), \\\mathcal{R}(X) = \mathopen{}\left\\0, 1, 2\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 3 (Discrete random variable)** A random variable \\X\\ is **discrete** if its [range](#def-range) \\\mathcal{R}(X)\\ is finite or countably infinite.

> **NOTE:**
>
> **Example 3 (Discrete random variables)** The number of heads in [Example 1](#exm-random-variable) is discrete, with a finite range. A count with no upper bound, such as the number of emergency-department visits in a day, is discrete with a countably infinite range, \\\mathopen{}\left\\0, 1, 2, \dots\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 4 (Continuous random variable)** A random variable \\X\\ is **continuous** if \\\Pr(X = x) = 0\\ for every \\x \in \mathbb{R}\\.

Every continuous random variable in these notes also has a [probability density function](#def-pdf). Continuous random variables without a density exist, but they do not arise in applications. Some random variables are neither discrete nor continuous: a time to event that equals exactly \\0\\ with positive probability, and otherwise spreads over \\(0, \infty)\\, is one.

> **NOTE:**
>
> **Definition 5 (Uniform distribution)** A random variable \\X\\ has the **uniform distribution** on an interval \\\[\alpha, \beta\]\\, with \\\alpha \< \beta\\, written \\X \sim \text{Uniform}(\alpha, \beta)\\, if the probability that \\X\\ falls in any subinterval of \\\[\alpha, \beta\]\\ is proportional to the length of that subinterval:
>
> \\\Pr(a \le X \le b) = \frac{b - a}{\beta - \alpha} \quad \text{for all } \alpha \le a \le b \le \beta\\

> **NOTE:**
>
> **Example 4 (A uniformly distributed random variable)** Let \\X \sim \text{Uniform}(0, 1)\\ ([Definition 5](#def-uniform)), so \\\Pr(a \le X \le b) = b - a\\ for all \\0 \le a \le b \le 1\\. Taking \\a = b = x\\ gives \\\Pr(X = x) = x - x = 0\\ for every \\x \in \[0,1\]\\. Taking \\a = 0\\ and \\b = 1\\ gives \\\Pr(0 \le X \le 1) = 1\\, so by the [complement rule](probability-basics.llms.md#cor-p-neg0) \\X\\ falls outside \\\[0, 1\]\\ with probability 0, and \\\Pr(X = x) = 0\\ for every \\x\\ outside \\\[0, 1\]\\ as well. So \\X\\ is continuous. Its range, \\\[0, 1\]\\, is uncountable.

## 2 Characteristics of probability distributions

> **NOTE:**
>
> **Definition 6 (Probability mass function (PMF))** If \\X\\ is a [discrete random variable](#def-discrete-rv), the **probability mass function** of \\X\\ at value \\x\\, denoted \\f(x)\\, \\f_X(x)\\, \\\operatorname{P}(x)\\, \\\operatorname{P}\_X(x)\\, or \\\operatorname{P}(X=x)\\, is the probability that \\X\\ takes exactly the value \\x\\:
>
> \\\operatorname{P}(X=x) \stackrel{\text{def}}{=}\Pr(\\X=x\\)\\

See also <https://en.wikipedia.org/wiki/Probability_mass_function>

> **NOTE:**
>
> **Example 5 (PMF of the number of heads)** For the number of heads \\X\\ in two fair coin flips ([Example 1](#exm-random-variable)):
>
> \\\operatorname{P}(X = 0) = \tfrac{1}{4}, \quad \operatorname{P}(X = 1) = \tfrac{1}{2}, \quad \operatorname{P}(X = 2) = \tfrac{1}{4}\\

> **NOTE:**
>
> **Definition 7 (Bernoulli distribution)** A [discrete](#def-discrete-rv) random variable \\X\\ has the **Bernoulli distribution** with parameter \\\pi \in \[0, 1\]\\, written \\X \sim \operatorname{Ber}(\pi)\\, if:
>
> \\ \begin{aligned} \Pr(X=x) &\stackrel{\text{def}}{=}\text{1}\_{x\in \mathopen{}\left\\0,1\right\\\mathclose{}}\pi^x(1-\pi)^{1-x}\\ &= \begin{cases} \pi, & x=1\\ 1-\pi, & x=0 \end{cases} \end{aligned} \\

> **NOTE:**
>
> **Example 6 (The first of two coin flips)** In [Example 1](#exm-random-variable), let \\X_1\\ indicate heads on the first flip, so \\X_1(HH) = X_1(HT) = 1\\ and \\X_1(TH) = X_1(TT) = 0\\. Then \\\operatorname{P}(X_1 = 1) = \Pr(\mathopen{}\left\\HH, HT\right\\\mathclose{}) = 1/2\\ and \\\operatorname{P}(X_1 = 0) = \Pr(\mathopen{}\left\\TH, TT\right\\\mathclose{}) = 1/2\\, so \\X_1 \sim \operatorname{Ber}(1/2)\\.

> **NOTE:**
>
> **Definition 8 (Probability density function (PDF))** If \\X\\ is a [continuous random variable](#def-continuous-rv), a **probability density function** of \\X\\, denoted \\f(x)\\, \\f_X(x)\\, \\\operatorname{p}(x)\\, \\\operatorname{p}\_X(x)\\, or \\\operatorname{p}(X=x)\\, is a function \\f \ge 0\\ whose integral over any interval is the [probability](probability-basics.llms.md#def-probability) that \\X\\ falls in that interval:
>
> \\\Pr(a \le X \le b) = \int_a^b f(x)\\dx \quad \text{for all } a \le b\\

A density is not a probability: it can exceed 1. A density is also not unique: changing \\f\\ at finitely many points changes none of its integrals, so the value of a density at a single point carries no probability by itself. These notes use the version that is continuous wherever possible. [Theorem 3](#thm-density-limit) gives the value of \\f\\ at a point where it is continuous.

See also <https://en.wikipedia.org/wiki/Probability_density_function#Formal_definition>

> **NOTE:**
>
> **Example 7 (Density of a uniform random variable)** Let \\X \sim \text{Uniform}(0, 1)\\ ([Example 4](#exm-continuous-rv)), and let \\f(x) = 1\\ for \\x \in \[0, 1\]\\ and \\f(x) = 0\\ otherwise. For \\0 \le a \le b \le 1\\:
>
> \\ \begin{aligned} \int_a^b f(x)\\dx &= \int_a^b 1\\dx && \text{(} f = 1 \text{ on } \[0, 1\] \text{)} \\ &= b - a && \text{(integrate)} \\ &= \Pr(a \le X \le b) && \text{(definition of the uniform distribution)} \end{aligned} \\
>
> An interval reaching outside \\\[0, 1\]\\ adds nothing to either side: \\f = 0\\ there, and \\X\\ falls outside \\\[0, 1\]\\ with probability 0 ([Example 4](#exm-continuous-rv)). So \\f\\ is a density of \\X\\.

> **NOTE:**
>
> **Definition 9 (Normal distribution)** A random variable \\X\\ has the **normal distribution** (or **Gaussian distribution**) with mean parameter \\\mu \in \mathbb{R}\\ and variance parameter \\\sigma^2\> 0\\, written \\X \sim \operatorname{N}\mathopen{}\left(\mu, \sigma^2\right)\mathclose{}\\, if \\X\\ is continuous with [density](#def-pdf):
>
> \\\operatorname{p}(X=x) \stackrel{\text{def}}{=}\frac{1}{\sigma\sqrt{2\pi}} \text{e}^{-\frac{(x-\mu)^2}{2\sigma^2}}, \quad x \in \mathbb{R}\\

The distribution \\\operatorname{N}\mathopen{}\left(0, 1\right)\mathclose{}\\ is called the **standard normal distribution**. This density integrates to 1, and a normal random variable has mean \\\mu\\ and variance \\\sigma^2\\, which is where the parameters’ names come from ([Casella and Berger 2002](#ref-CaseBerg01)).

> **NOTE:**
>
> **Example 8 (Normal densities at their centers)** For \\X \sim \operatorname{N}\mathopen{}\left(0, 1\right)\mathclose{}\\, the density at \\x = 0\\ is:
>
> \\ \begin{aligned} \operatorname{p}(X=0) &= \frac{1}{1 \cdot\sqrt{2\pi}} \text{e}^{-\frac{(0-0)^2}{2 \cdot 1}} && \text{(normal density with } \mu = 0, \sigma^2= 1 \text{)} \\ &= \frac{1}{\sqrt{2\pi}} && \text{(} \text{e}^0 = 1 \text{)} \\ &\approx 0.399 && \text{(evaluate)} \end{aligned} \\
>
> For \\X \sim \operatorname{N}\mathopen{}\left(0, 0.1^2\right)\mathclose{}\\, the same steps give \\\operatorname{p}(X=0) = 1 / (0.1\sqrt{2\pi}) \approx 3.99\\, a density greater than 1.

> **NOTE:**
>
> **Definition 10 (Exponential distribution)** A random variable \\T\\ has the **exponential distribution** with rate \\\lambda \> 0\\ if \\T\\ is continuous with [density](#def-pdf):
>
> \\ f(t) \stackrel{\text{def}}{=}\begin{cases} \lambda \text{e}^{-\lambda t}, & t \ge 0 \\ 0, & t \< 0 \end{cases} \\

> **NOTE:**
>
> **Example 9 (Probability of an event within one time unit)** Let \\T\\ be exponential with rate \\\lambda\\. The probability that \\T\\ falls in \\\[0, 1\]\\ is:
>
> \\ \begin{aligned} \Pr(0 \le T \le 1) &= \int_0^1 \lambda \text{e}^{-\lambda t}\\dt && \text{(definition of a density)} \\ &= \mathopen{}\left\[-\text{e}^{-\lambda t}\right\]\mathclose{}\_{t=0}^{1} && \text{(antiderivative of } \lambda \text{e}^{-\lambda t} \text{)} \\ &= 1 - \text{e}^{-\lambda} && \text{(evaluate at the bounds)} \end{aligned} \\
>
> With \\\lambda = 0.5\\, for example, \\\Pr(0 \le T \le 1) = 1 - \text{e}^{-0.5} \approx 0.393\\.

> **NOTE:**
>
> **Definition 11 (Cumulative distribution function (CDF))** For a random variable \\X\\ (discrete or continuous), its **cumulative distribution function** is:
>
> \\F(t) \stackrel{\text{def}}{=}\Pr(X\le t), \quad t\in\mathbb{R}.\\

The CDF is always defined, whether \\X\\ is discrete or continuous, and it fully characterizes \\X\\’s distribution. It is non-decreasing, with \\F(t) \to 0\\ as \\t \to -\infty\\ and \\F(t) \to 1\\ as \\t \to \infty\\.

See also <https://en.wikipedia.org/wiki/Cumulative_distribution_function>

> **NOTE:**
>
> **Example 10 (CDF of the number of heads)** Summing the PMF in [Example 5](#exm-pmf) over values at or below \\t\\:
>
> \\ F(t) = \begin{cases} 0, & t \< 0 \\ \tfrac{1}{4}, & 0 \le t \< 1 \\ \tfrac{3}{4}, & 1 \le t \< 2 \\ 1, & t \ge 2 \end{cases} \\

> **NOTE:**
>
> **Definition 12 (Quantile function (population inverse CDF))** For a random variable \\X\\ with [cumulative distribution function (CDF)](#def-cdf) \\F\\, its population **quantile function** (generalized inverse of \\F\\) is:
>
> \\Q(p) \stackrel{\text{def}}{=}\inf\\t:F(t)\ge p\\, \quad 0\<p\<1.\\

The restriction to \\0 \< p \< 1\\ keeps \\Q(p)\\ finite: for \\p = 1\\, the set \\\\t : F(t) \ge 1\\\\ is empty whenever \\F(t) \< 1\\ for every \\t\\, as for a [normal distribution](#def-normal), and the infimum of the empty set is \\+\infty\\.

> **NOTE:**
>
> **Example 11 (Median of the number of heads)** From [Example 10](#exm-cdf), \\F(t) \ge 0.5\\ first holds at \\t = 1\\, so the median of the number of heads is \\Q(0.5) = 1\\.

> **NOTE:**
>
> **Theorem 1 (A density integrates to the CDF, and is its derivative)** If \\X\\ is a continuous random variable with density \\f\\ and CDF \\F\\, then for every \\t\\:
>
> \\F(t) = \int\_{-\infty}^{t} f(x)\\dx\\
>
> and at every \\t\\ where \\f\\ is continuous:
>
> \\f(t) = \frac{\partial}{\partial t} F(t)\\

> **NOTE:**
>
> *Proof*. For any \\a \< t\\, \\\\X \le t\\\\ is the disjoint union of \\\\X \le a\\\\ and \\\\a \< X \le t\\\\, and \\\Pr(X = a) = 0\\ because \\X\\ is continuous. So:
>
> \\ \begin{aligned} F(t) &= \Pr(X \le a) + \Pr(a \< X \le t) && \text{(additivity, and the definition of the CDF)} \\ &= F(a) + \Pr(a \le X \le t) && \text{(definition of the CDF; } \Pr(X = a) = 0 \text{)} \\ &= F(a) + \int_a^t f(x)\\dx && \text{(definition of the density)} \end{aligned} \\
>
> Letting \\a \to -\infty\\, \\F(a) \to 0\\ ([Definition 11](#def-cdf)), which gives \\F(t) = \int\_{-\infty}^{t} f(x)\\dx\\. The fundamental theorem of calculus then gives \\\frac{\partial}{\partial t} \int\_{-\infty}^{t} f(x)\\dx = f(t)\\ at every \\t\\ where \\f\\ is continuous.

For the densities in these notes, \\f\\ is continuous at all but finitely many points, so \\F' = f\\ at all but finitely many points.

> **NOTE:**
>
> **Example 12 (CDF and density of a uniform random variable)** For \\X\\ uniform on \\\[0, 1\]\\ with the density \\f\\ of [Example 7](#exm-pdf), and \\t \in \[0, 1\]\\:
>
> \\ \begin{aligned} F(t) &= \int\_{-\infty}^{t} f(x)\\dx && \text{(the CDF is the integral of the density)} \\ &= \int\_{-\infty}^{0} 0\\dx + \int\_{0}^{t} 1\\dx && \text{(split at 0, and substitute } f \text{)} \\ &= t && \text{(integrate)} \end{aligned} \\
>
> For \\t \in (0, 1)\\, where \\f\\ is continuous, \\\frac{\partial}{\partial t} F(t) = 1 = f(t)\\. At \\t = 1\\, \\f\\ jumps from 1 to 0, and \\F\\ has no derivative: its slope is 1 on the left and 0 on the right.

> **NOTE:**
>
> **Theorem 2 (A piecewise-smooth CDF has its derivative as a density)** If the CDF \\F\\ of a random variable \\X\\ is continuous everywhere, and has a continuous derivative at all but finitely many points, then \\X\\ is continuous, and \\F'\\ (given any values at the finitely many exceptional points) is a density of \\X\\.

> **NOTE:**
>
> *Proof*. For events \\A \subseteq B\\, \\B\\ is the disjoint union of \\A\\ and \\B \setminus A\\, so additivity gives \\\Pr(A) \le \Pr(B)\\. For any \\x\\ and \\\Delta \> 0\\, \\\\X = x\\ \subseteq \\x - \Delta \< X \le x\\\\, so:
>
> \\ \begin{aligned} 0 &\le \Pr(X = x) && \text{(probabilities are non-negative)} \\ &\le \Pr(x - \Delta \< X \le x) && \text{(} \\X = x\\ \subseteq \\x - \Delta \< X \le x\\ \text{)} \\ &= F(x) - F(x - \Delta) && \text{(additivity, and the definition of the CDF)} \end{aligned} \\
>
> and \\F(x) - F(x - \Delta) \to 0\\ as \\\Delta \downarrow 0\\, because \\F\\ is continuous. So \\\Pr(X = x) = 0\\ for every \\x\\, and \\X\\ is continuous. Then, for \\a \le b\\:
>
> \\ \begin{aligned} \Pr(a \le X \le b) &= \Pr(a \< X \le b) && \text{(} \Pr(X = a) = 0 \text{)} \\ &= F(b) - F(a) && \text{(additivity, and the definition of the CDF)} \\ &= \int_a^b F'(x)\\dx && \text{(fundamental theorem of calculus)} \end{aligned} \\
>
> The last step applies the fundamental theorem of calculus on each piece of \\\[a, b\]\\ between exceptional points, where \\F'\\ is continuous, and joins the pieces using the continuity of \\F\\ at the exceptional points. Finally, \\F' \ge 0\\ wherever it exists, because \\F\\ is non-decreasing.

> **NOTE:**
>
> **Example 13 (A density from a CDF with a corner)** Let \\X\\ have CDF \\F(t) = 0\\ for \\t \< 0\\, \\F(t) = t^2\\ for \\0 \le t \le 1\\, and \\F(t) = 1\\ for \\t \> 1\\. This \\F\\ is continuous everywhere, and has a continuous derivative everywhere except \\t = 1\\, where its slope drops from 2 to 0. By [Theorem 2](#thm-cdf-derivative-density), \\X\\ is continuous with density \\f(t) = 2t\\ for \\0 \le t \< 1\\ and \\f(t) = 0\\ otherwise. As a check, \\\int_0^1 2t\\dt = 1\\.

> **NOTE:**
>
> **Theorem 3 (A density as a limit of interval probabilities)** If \\X\\ is a continuous random variable with density \\f\\, and \\f\\ is continuous at \\x\\, then \\f(x)\\ is the limit of the probability that \\X\\ falls in an interval starting at \\x\\, divided by the width of that interval, as that width shrinks to 0:
>
> \\f(x) = \lim\_{\Delta \downarrow 0} \frac{\Pr(x \le X \< x + \Delta)}{\Delta}\\

> **NOTE:**
>
> *Proof*. For \\\Delta \> 0\\:
>
> \\ \begin{aligned} \frac{\Pr(x \le X \< x + \Delta)}{\Delta} &= \frac{\Pr(x \< X \le x + \Delta)}{\Delta} && \text{(} \Pr(X = x) = \Pr(X = x + \Delta) = 0 \text{)} \\ &= \frac{F(x + \Delta) - F(x)}{\Delta} && \text{(additivity, and the definition of the CDF)} \end{aligned} \\
>
> By [Theorem 1](#thm-density-vs-CDF), \\F\\ is differentiable at \\x\\ with \\F'(x) = f(x)\\, so this difference quotient converges to \\f(x)\\ as \\\Delta \downarrow 0\\.

For small \\\Delta \> 0\\, \\f(x) \cdot\Delta \approx \Pr(x \le X \< x + \Delta)\\. The limit is the right derivative of \\F\\ at \\x\\. At a point where \\f\\ is not continuous, the limit can differ from the chosen value \\f(x)\\: for \\X \sim \text{Uniform}(0, 1)\\, the limit at \\x = 1\\ is 0, although [Example 7](#exm-pdf) sets \\f(1) = 1\\.

See also Rothman et al. ([2021](#ref-me4)) (Chapter 22, p. 535).

> **NOTE:**
>
> **Example 14 (The uniform density as a limit)** For \\X \sim \text{Uniform}(0, 1)\\ and \\x \in \[0, 1)\\, \\\Pr(x \le X \< x + \Delta) = \Delta\\ once \\\Delta \le 1 - x\\, so:
>
> \\f(x) = \lim\_{\Delta \downarrow 0} \frac{\Delta}{\Delta} = 1\\
>
> For \\x \< 0\\ or \\x \> 1\\, the interval eventually misses \\\[0, 1\]\\, so the limit is \\0\\. Both agree with the density of [Example 7](#exm-pdf).

> **NOTE:**
>
> **Theorem 4 (Density functions integrate to 1)** If \\X\\ is a continuous random variable with density \\f\\:
>
> \\\int\_{-\infty}^{\infty} f(x)\\ dx = 1\\

> **NOTE:**
>
> *Proof*. \\ \begin{aligned} \int\_{-\infty}^{\infty} f(x)\\ dx &= \lim\_{b \to \infty} \int\_{-\infty}^{b} f(x)\\ dx && \text{(definition of an improper integral)} \\ &= \lim\_{b \to \infty} F(b) && \text{(the CDF is the integral of the density)} \\ &= 1 && \text{(limit of a CDF)} \end{aligned} \\

> **NOTE:**
>
> **Example 15 (The uniform density integrates to 1)** For \\X\\ uniform on \\\[0, 1\]\\ ([Example 7](#exm-pdf)), \\\int\_{-\infty}^{\infty} f(x)\\dx = \int_0^1 1\\dx = 1\\.

> **NOTE:**
>
> **Definition 13 (Jointly distributed random variables)** Random variables \\X_1, \ldots, X_n\\ are **jointly distributed** when they are defined on the same [sample space](probability-basics.llms.md#def-sample-space) \\\Omega\\, so that an event about several of them at once, such as \\\\X_1 \le x_1\\ \cap \\X_2 \le x_2\\\\, has a probability.

We write \\\Pr(X \in A, Y \in B)\\ for \\\Pr(\\X \in A\\ \cap \\Y \in B\\)\\, and similarly for more variables. The collection of all such probabilities is the **joint distribution** of the variables.

> **NOTE:**
>
> **Example 16 (The first flip and the total)** In [Example 1](#exm-random-variable), let \\X_1\\ indicate heads on the first flip (as in [Example 6](#exm-bernoulli-pmf)), and let \\X\\ be the total number of heads. Both are functions on the same sample space, \\\mathopen{}\left\\HH, HT, TH, TT\right\\\mathclose{}\\, so they are jointly distributed, and, for example:
>
> \\\Pr(X_1 = 1, X = 1) = \Pr(\mathopen{}\left\\HH, HT\right\\\mathclose{} \cap \mathopen{}\left\\HT, TH\right\\\mathclose{}) = \Pr(\mathopen{}\left\\HT\right\\\mathclose{}) = \tfrac{1}{4}\\

> **NOTE:**
>
> **Definition 14 (Joint probability mass function)** For [jointly distributed](#def-jointly-distributed) discrete random variables \\X\\ and \\Y\\, the **joint probability mass function** (joint PMF) of \\X\\ and \\Y\\ is the probability that \\X\\ takes the value \\x\\ and \\Y\\ takes the value \\y\\:
>
> \\\operatorname{P}(X = x,\\ Y = y) \stackrel{\text{def}}{=}\Pr(\\X = x\\ \cap \\Y = y\\)\\

> **NOTE:**
>
> **Example 17 (Joint PMF of the first flip and the total)** Continuing [Example 16](#exm-jointly-distributed), each outcome of the two flips fixes both \\X_1\\ and \\X\\, so the joint PMF puts probability \\1/4\\ on each outcome’s pair of values:
>
> |             |    \\X = 0\\     |    \\X = 1\\     |    \\X = 2\\     |
> |:-----------:|:----------------:|:----------------:|:----------------:|
> | \\X_1 = 0\\ | \\1/4\\ (\\TT\\) | \\1/4\\ (\\TH\\) |      \\0\\       |
> | \\X_1 = 1\\ |      \\0\\       | \\1/4\\ (\\HT\\) | \\1/4\\ (\\HH\\) |

> **NOTE:**
>
> **Definition 15 (Marginal distribution)** When a random variable \\X\\ is one of several [jointly distributed](#def-jointly-distributed) random variables, the distribution of \\X\\ by itself (its CDF, and its PMF or density) is called the **marginal distribution** of \\X\\.

The word “marginal” only says that the other variables are being set aside; the marginal distribution of \\X\\ is the same object as the distribution of \\X\\.

> **NOTE:**
>
> **Example 18 (Marginal distribution of the total)** In [Example 17](#exm-joint-pmf), the marginal distribution of the total \\X\\ is the PMF of [Example 5](#exm-pmf): \\\operatorname{P}(X = 0) = 1/4\\, \\\operatorname{P}(X = 1) = 1/2\\, \\\operatorname{P}(X = 2) = 1/4\\.

> **NOTE:**
>
> **Theorem 5 (Marginal PMF from a joint PMF)** If \\X\\ and \\Y\\ are jointly distributed discrete random variables, then for every \\x\\:
>
> \\\operatorname{P}(X = x) = \sum\_{y \in \mathcal{R}(Y)} \operatorname{P}(X = x,\\ Y = y)\\

> **NOTE:**
>
> *Proof*. The event \\\\X = x\\\\ is the disjoint union of the events \\\\X = x\\ \cap \\Y = y\\\\ over the countably many values \\y \in \mathcal{R}(Y)\\, so:
>
> \\ \begin{aligned} \operatorname{P}(X = x) &= \Pr\mathopen{}\left(\bigcup\_{y \in \mathcal{R}(Y)} \mathopen{}\left(\\X = x\\ \cap \\Y = y\\\right)\mathclose{}\right)\mathclose{} && \text{(the events partition } \\X = x\\ \text{)} \\ &= \sum\_{y \in \mathcal{R}(Y)} \Pr(\\X = x\\ \cap \\Y = y\\) && \text{(countable additivity)} \\ &= \sum\_{y \in \mathcal{R}(Y)} \operatorname{P}(X = x,\\ Y = y) && \text{(definition of the joint PMF)} \end{aligned} \\

> **NOTE:**
>
> **Example 19 (Summing a row of the joint PMF)** In [Example 17](#exm-joint-pmf), summing the \\X_1 = 1\\ row:
>
> \\ \begin{aligned} \operatorname{P}(X_1 = 1) &= \operatorname{P}(X_1 = 1, X = 0) + \operatorname{P}(X_1 = 1, X = 1) + \operatorname{P}(X_1 = 1, X = 2) && \text{(marginal PMF from the joint PMF)} \\ &= 0 + \tfrac{1}{4} + \tfrac{1}{4} && \text{(read the table)} \\ &= \tfrac{1}{2} && \text{(add)} \end{aligned} \\
>
> which matches \\X_1 \sim \operatorname{Ber}(1/2)\\ from [Example 6](#exm-bernoulli-pmf).

> **NOTE:**
>
> **Definition 16 (Joint probability density function)** For [jointly distributed](#def-jointly-distributed) continuous random variables \\X\\ and \\Y\\, a **joint probability density function** (joint density) of \\X\\ and \\Y\\, denoted \\f\_{X,Y}(x, y)\\ or \\\operatorname{p}(X = x,\\ Y = y)\\, is a function \\f\_{X,Y} \ge 0\\ on \\\mathbb{R}^2\\ whose integral over any region \\A \subseteq \mathbb{R}^2\\ is the probability that the pair \\(X, Y)\\ falls in \\A\\:
>
> \\\Pr((X, Y) \in A) = \iint_A f\_{X,Y}(x, y)\\dx\\dy\\

As with [events](probability-basics.llms.md#def-event), a fully rigorous version restricts \\A\\ to a designated collection of regions; every region that arises in these notes is in it. Not every pair of continuous random variables has a joint density: if \\X\\ is continuous, the pair \\(X, X)\\ falls on the line \\y = x\\, a region of area 0, so every candidate \\f\_{X,Y}\\ would give that line probability 0 instead of 1.

> **NOTE:**
>
> **Example 20 (A joint density on a triangle)** Let \\f\_{X,Y}(x, y) = 2\\ for \\0 \le x \le y \le 1\\, and \\0\\ otherwise. The triangle \\\\(x, y) : 0 \le x \le y \le 1\\\\ has area \\1/2\\, so \\f\_{X,Y}\\ gives the whole plane probability \\2 \cdot\tfrac{1}{2} = 1\\, and it is the joint density of a pair \\(X, Y)\\ with \\X \le Y\\ always. For example, the probability that both are at most \\1/2\\ is \\2\\ times the area of the smaller triangle \\\\0 \le x \le y \le 1/2\\\\:
>
> \\\Pr(X \le \tfrac{1}{2}, Y \le \tfrac{1}{2}) = 2 \cdot\tfrac{1}{8} = \tfrac{1}{4}\\

> **NOTE:**
>
> **Theorem 6 (Marginal density from a joint density)** If \\X\\ and \\Y\\ have joint density \\f\_{X,Y}\\, then \\X\\ has the density:
>
> \\f_X(x) = \int\_{-\infty}^{\infty} f\_{X,Y}(x, y)\\dy\\

> **NOTE:**
>
> *Proof*. For \\a \le b\\, the event \\\\a \le X \le b\\\\ is the event that \\(X, Y)\\ falls in the strip \\\[a, b\] \times \mathbb{R}\\, so:
>
> \\ \begin{aligned} \Pr(a \le X \le b) &= \Pr((X, Y) \in \[a, b\] \times \mathbb{R}) && \text{(same event)} \\ &= \iint\_{\[a, b\] \times \mathbb{R}} f\_{X,Y}(x, y)\\dx\\dy && \text{(definition of a joint density)} \\ &= \int_a^b \mathopen{}\left(\int\_{-\infty}^{\infty} f\_{X,Y}(x, y)\\dy\right)\mathclose{}\\dx && \text{(iterate the integral; Tonelli's theorem)} \\ &= \int_a^b f_X(x)\\dx && \text{(definition of } f_X \text{)} \end{aligned} \\
>
> Tonelli’s theorem allows the iterated integral because \\f\_{X,Y} \ge 0\\ ([Fubini–Tonelli theorem](https://morrison-lab.github.io/rme/chapters/math-prereqs.html#thm-fubini-tonelli); Billingsley ([1995](#ref-billingsley1995probability)), Theorem 18.3). So \\f_X\\ satisfies [Definition 8](#def-pdf).

> **NOTE:**
>
> **Example 21 (Marginal densities on the triangle)** For the joint density of [Example 20](#exm-joint-pdf) and \\x \in \[0, 1\]\\, \\f\_{X,Y}(x, y) = 2\\ exactly when \\x \le y \le 1\\, so:
>
> \\ \begin{aligned} f_X(x) &= \int\_{-\infty}^{\infty} f\_{X,Y}(x, y)\\dy && \text{(marginal density from a joint density)} \\ &= \int_x^1 2\\dy && \text{(} f\_{X,Y}(x, y) = 2 \text{ for } x \le y \le 1 \text{, else } 0 \text{)} \\ &= 2(1 - x) && \text{(integrate)} \end{aligned} \\
>
> The same steps with the roles swapped give \\f_Y(y) = \int_0^y 2\\dx = 2y\\ for \\y \in \[0, 1\]\\.

> **NOTE:**
>
> **Definition 17 (Joint density-mass function)** Let \\X\\ be a discrete random variable and \\Y\\ a continuous random variable, [jointly distributed](#def-jointly-distributed). A **joint density-mass function** of \\X\\ and \\Y\\, denoted \\\operatorname{p}(X = x,\\ Y = y)\\, is a function \\\operatorname{p}(X = x,\\ Y = y) \ge 0\\ that is a probability mass in \\x\\ and a probability density in \\y\\: for every \\x\\ and every set \\B \subseteq \mathbb{R}\\,
>
> \\\Pr(X = x,\\ Y \in B) = \int\_{B} \operatorname{p}(X = x,\\ Y = y)\\dy\\

Taking \\B = \mathbb{R}\\ gives \\\int\_{-\infty}^{\infty} \operatorname{p}(X = x,\\ Y = y)\\dy = \operatorname{P}(X = x)\\. When \\X\\ is continuous and \\Y\\ is discrete, the roles swap: \\\Pr(X \in B,\\ Y = y) = \int_B \operatorname{p}(X = x,\\ Y = y)\\dx\\.

> **NOTE:**
>
> **Example 22 (A coin flip and a waiting time)** Let \\\operatorname{p}(X = 0,\\ Y = y) = 1/2\\ for \\y \in \[0, 1\]\\, \\\operatorname{p}(X = 1,\\ Y = y) = 1/4\\ for \\y \in \[0, 2\]\\, and \\0\\ otherwise. Integrating over \\y\\ gives \\\operatorname{P}(X = 0) = 1/2\\ and \\\operatorname{P}(X = 1) = 1/2\\, which add to 1. For example, the probability that \\X = 1\\ and \\Y \le 1\\ is:
>
> \\\Pr(X = 1,\\ Y \le 1) = \int_0^1 \tfrac{1}{4}\\dy = \tfrac{1}{4}\\

## 3 Survival, hazard, and cumulative hazard functions

> **NOTE:**
>
> **Definition 18 (Survival function)** The **survival function** (or **survivor function**) of a random variable \\T\\, denoted \\\operatorname{S}(t)\\, is the probability that \\T\\ exceeds \\t\\:
>
> \\\operatorname{S}(t) \stackrel{\text{def}}{=}\Pr(T \> t)\\

The name comes from time-to-event analysis: if \\T\\ is the time at which a participant dies, then \\\operatorname{S}(t)\\ is the probability that the participant is still alive at time \\t\\. The definition itself applies to any random variable.

> **NOTE:**
>
> **Theorem 7 (Survival function and CDF)** For any random variable \\T\\ with [CDF](#def-cdf) \\F(t)\\:
>
> \\\operatorname{S}(t) = 1 - F(t)\\
>
> If \\T\\ is continuous with [density](#def-pdf) \\f(t)\\, then also:
>
> \\\operatorname{S}(t) = \int\_{u=t}^{\infty} f(u)\\du\\

> **NOTE:**
>
> *Proof*. The event \\\\T \> t\\\\ is the complement of the event \\\\T \le t\\\\, so the [complement rule](probability-basics.llms.md#cor-p-neg0) gives:
>
> \\ \begin{aligned} \operatorname{S}(t) &\stackrel{\text{def}}{=}\Pr(T \> t) && \text{(definition of the survival function)} \\ &= 1 - \Pr(T \le t) && \text{(complement rule)} \\ &= 1 - F(t) && \text{(definition of the CDF)} \end{aligned} \\
>
> For continuous \\T\\, the density integrates to 1 over the real line ([Theorem 4](#thm-density-sums-to-one)), and \\F\\ is the integral of the density up to \\t\\ ([Theorem 1](#thm-density-vs-CDF)), so:
>
> \\ \begin{aligned} 1 - F(t) &= \int\_{u=-\infty}^{\infty} f(u)\\du - \int\_{u=-\infty}^{t} f(u)\\du && \text{(total integral is 1; } F \text{ is the integral of } f \text{)} \\ &= \int\_{u=t}^{\infty} f(u)\\du && \text{(split the first integral at } t \text{ and cancel)} \end{aligned} \\

> **NOTE:**
>
> **Example 23 (Survival function of an exponential distribution)** Let \\T\\ be exponential with rate \\\lambda \> 0\\ ([Definition 10](#def-exponential)), so \\T\\ has density \\f(t) = \lambda \text{e}^{-\lambda t}\\ for \\t \ge 0\\. For \\t \ge 0\\, by [Theorem 7](#thm-survival-expressions-1):
>
> \\ \begin{aligned} \operatorname{S}(t) &= \int\_{u=t}^{\infty} \lambda \text{e}^{-\lambda u}\\du && \text{(integral form of the survival function)} \\ &= \mathopen{}\left\[-\text{e}^{-\lambda u}\right\]\mathclose{}\_{u=t}^{\infty} && \text{(antiderivative of } \lambda \text{e}^{-\lambda u} \text{)} \\ &= 0 - \mathopen{}\left(-\text{e}^{-\lambda t}\right)\mathclose{} && \text{(evaluate at the bounds; } \text{e}^{-\lambda u} \to 0 \text{ as } u \to \infty \text{)} \\ &= \text{e}^{-\lambda t} && \text{(simplify)} \end{aligned} \\
>
> For \\t \< 0\\, \\\operatorname{S}(t) = \Pr(T \> t) = 1\\, since \\T \ge 0\\. With \\\lambda = 0.5\\, for example, \\\operatorname{S}(2) = \text{e}^{-1} \approx 0.368\\.

> **NOTE:**
>
> **Definition 19 (Hazard function)** The **hazard function** (also called the **hazard rate** or **hazard rate function**) of a continuous random variable \\T\\ at a value \\t\\ with \\\Pr(T \ge t) \> 0\\, typically denoted \\{\lambda}(t)\\ or \\\operatorname{h}(t)\\, is the limit of the [conditional probability](probability-basics.llms.md#def-conditional-prob) that \\T\\ falls in an interval starting at \\t\\, given \\T \ge t\\, divided by the width of that interval, as that width shrinks to 0:
>
> \\{\lambda}(t) \stackrel{\text{def}}{=}\lim\_{\Delta \downarrow 0} \frac{\Pr(t \le T \< t + \Delta \mid T \ge t)}{\Delta}\\

Sources differ on the symbol: \\\operatorname{h}(t)\\ appears in Dobson and Barnett ([2018](#ref-dobson4e)), Vittinghoff et al. ([2012](#ref-vittinghoff2e)), Klein and Moeschberger ([2003](#ref-klein2003survival)), and Kleinbaum and Klein ([2012](#ref-kleinbaum2012survival)), while \\\lambda(t)\\ appears in Rothman et al. ([2021](#ref-me4)) and Kalbfleisch and Prentice ([2011](#ref-kalbfleisch2011statistical)).

If \\T\\ is the time at which an event occurs, then \\{\lambda}(t)\\ is a rate, not a probability: for a small interval width \\\Delta \> 0\\, \\{\lambda}(t) \cdot\Delta\\ is approximately the probability that the event occurs in \\\[t, t + \Delta)\\, given that it has not occurred before \\t\\. A hazard can exceed 1, just as a density can. Many sources write the hazard as \\{\lambda}(t) = \operatorname{p}(T = t \mid T \ge t)\\, reading it as the density of \\T\\ at \\t\\, conditional on the event \\T \ge t\\; that notation abbreviates the limit in [Definition 19](#def-hazard). For a discrete \\T\\, the conditional probability \\\Pr(T = t \mid T \ge t)\\ itself is called the *discrete-time* hazard, and it is a probability.

The name “hazard” carries a connotation that the event is undesirable — death, relapse, equipment failure, and so on. When the event in question is neutral or desirable (recovery, conception, graduation, response to treatment), the same quantity \\{\lambda}(t)\\ is often called the **event incidence rate** instead. This terminology parallels the convention that conditional probabilities of undesirable events are called **risks**, while the same conditional probabilities for neutral or desirable events are simply called **probabilities**. The math is identical; only the name changes with the valence of the event.

> **NOTE:**
>
> **Theorem 8 (Hazard equals density over survival)** If \\T\\ is a continuous random variable with [density](#def-pdf) \\f(t)\\ and [survival function](#def-surv-fn) \\\operatorname{S}(t)\\, then for every \\t\\ with \\\operatorname{S}(t) \> 0\\ at which \\f\\ is continuous:
>
> \\{\lambda}(t) = \frac{f(t)}{\operatorname{S}(t)}\\

> **NOTE:**
>
> *Proof*. The proof uses three facts. First, for \\\Delta \> 0\\ the event \\\\t \le T \< t + \Delta\\\\ is a subset of the event \\\\T \ge t\\\\, so intersecting them leaves \\\\t \le T \< t + \Delta\\\\ (the [subset property](probability-basics.llms.md#thm-prob-subset)). Second, \\\Pr(T = t) = 0\\ for a continuous \\T\\, so \\\Pr(T \ge t) = \Pr(T \> t) = \operatorname{S}(t)\\, which is positive. Third, because \\f\\ is continuous at \\t\\, [Theorem 3](#thm-density-limit) gives \\f(t)\\ as the limit of \\\Pr(t \le T \< t + \Delta) / \Delta\\.
>
> \\ \begin{aligned} {\lambda}(t) &\stackrel{\text{def}}{=}\lim\_{\Delta \downarrow 0} \frac{\Pr(t \le T \< t + \Delta \mid T \ge t)}{\Delta} && \text{(definition of the hazard function)} \\ &= \lim\_{\Delta \downarrow 0} \frac{1}{\Delta} \cdot\frac{\Pr(\\t \le T \< t + \Delta\\ \cap \\T \ge t\\)}{\Pr(T \ge t)} && \text{(definition of conditional probability)} \\ &= \lim\_{\Delta \downarrow 0} \frac{1}{\Delta} \cdot\frac{\Pr(t \le T \< t + \Delta)}{\Pr(T \ge t)} && \text{(subset property)} \\ &= \frac{1}{\Pr(T \ge t)} \cdot\lim\_{\Delta \downarrow 0} \frac{\Pr(t \le T \< t + \Delta)}{\Delta} && \text{(} \Pr(T \ge t) \text{ does not depend on } \Delta \text{)} \\ &= \frac{f(t)}{\Pr(T \ge t)} && \text{(density as a limit; } f \text{ is continuous at } t \text{)} \\ &= \frac{f(t)}{\operatorname{S}(t)} && \text{(} \Pr(T = t) = 0 \text{ for continuous } T \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 24 (Hazard function of an exponential distribution)** Continuing [Example 23](#exm-exp-survfn), for \\t \> 0\\, where \\f\\ is continuous:
>
> \\ \begin{aligned} {\lambda}(t) &= \frac{f(t)}{\operatorname{S}(t)} && \text{(hazard equals density over survival)} \\ &= \frac{\lambda \text{e}^{-\lambda t}}{\text{e}^{-\lambda t}} && \text{(substitute the exponential density and survival function)} \\ &= \lambda && \text{(cancel } \text{e}^{-\lambda t} \text{)} \end{aligned} \\
>
> At \\t = 0\\, where \\f\\ jumps from \\0\\ to \\\lambda\\, [Definition 19](#def-hazard) gives the same value directly: \\\Pr(0 \le T \< \Delta \mid T \ge 0) / \Delta = \mathopen{}\left(1 - \text{e}^{-\lambda \Delta}\right)\mathclose{} / \Delta \to \lambda\\ as \\\Delta \downarrow 0\\. So the exponential distribution has a constant hazard for \\t \ge 0\\, equal to its rate parameter; for \\t \< 0\\, \\f(t) = 0\\, so \\{\lambda}(t) = 0\\.

> **NOTE:**
>
> **Definition 20 (Cumulative hazard function)** The **cumulative hazard function** of a continuous random variable \\T\\, often denoted \\{\Lambda}(t)\\ or \\\operatorname{H}(t)\\, is the integral of its [hazard function](#def-hazard) up to \\t\\:
>
> \\{\Lambda}(t) \stackrel{\text{def}}{=}\int\_{u=-\infty}^{t} {\lambda}(u)\\du\\

For a non-negative \\T\\, such as a time to event, \\{\lambda}(u) = 0\\ for \\u \< 0\\, so the lower limit of the integral can be replaced by \\0\\: \\{\Lambda}(t) = \int\_{u=0}^{t} {\lambda}(u)\\du\\. That is the form most survival-analysis texts use.

> **NOTE:**
>
> **Example 25 (Cumulative hazard function of an exponential distribution)** Continuing [Example 24](#exm-exp-haz), the hazard is \\{\lambda}(u) = \lambda\\ for \\u \ge 0\\ and \\0\\ for \\u \< 0\\, so for \\t \ge 0\\:
>
> \\ \begin{aligned} {\Lambda}(t) &= \int\_{u=-\infty}^{0} 0\\du + \int\_{u=0}^{t} \lambda\\du && \text{(split the integral at } 0 \text{)} \\ &= 0 + \lambda t && \text{(integrate each piece)} \\ &= \lambda t && \text{(simplify)} \end{aligned} \\
>
> and \\{\Lambda}(t) = 0\\ for \\t \< 0\\.

> **NOTE:**
>
> **Corollary 1 (Survival function from the cumulative hazard)** If \\T\\ is a continuous random variable whose density \\f\\ is continuous at all but finitely many points, then for every \\t\\ with \\\operatorname{S}(t) \> 0\\:
>
> \\{\Lambda}(t) = -\operatorname{log}\mathopen{}\left\\\operatorname{S}(t)\right\\\mathclose{}\\
>
> and therefore:
>
> \\\operatorname{S}(t) = \operatorname{exp}\mathopen{}\left\\-{\Lambda}(t)\right\\\mathclose{} \tag{1}\\

> **NOTE:**
>
> *Proof*. Since \\\operatorname{S}(t) = 1 - F(t)\\ ([Theorem 7](#thm-survival-expressions-1)) and \\F\\ has derivative \\f\\ wherever \\f\\ is continuous ([Theorem 1](#thm-density-vs-CDF)), \\\operatorname{S}\\ has derivative \\-f\\ at those points. At each such \\u\\ with \\\operatorname{S}(u) \> 0\\:
>
> \\ \begin{aligned} \frac{d}{du}\mathopen{}\left(-\operatorname{log}\mathopen{}\left\\\operatorname{S}(u)\right\\\mathclose{}\right)\mathclose{} &= -\frac{1}{\operatorname{S}(u)} \cdot\frac{d}{du}\operatorname{S}(u) && \text{(chain rule)} \\ &= -\frac{1}{\operatorname{S}(u)} \cdot\mathopen{}\left(-f(u)\right)\mathclose{} && \text{(} \operatorname{S}' = -f \text{)} \\ &= \frac{f(u)}{\operatorname{S}(u)} && \text{(simplify)} \\ &= {\lambda}(u) && \text{(hazard equals density over survival)} \end{aligned} \\
>
> The function \\-\operatorname{log}\mathopen{}\left\\\operatorname{S}(u)\right\\\mathclose{}\\ is continuous, because \\\operatorname{S}\\ is continuous for a continuous \\T\\, and it has derivative \\{\lambda}(u)\\ at all but finitely many points, so it is an antiderivative of \\{\lambda}\\ for the fundamental theorem of calculus. As \\u \to -\infty\\, \\\operatorname{S}(u) \to 1\\, so \\-\operatorname{log}\mathopen{}\left\\\operatorname{S}(u)\right\\\mathclose{} \to 0\\. Therefore:
>
> \\ \begin{aligned} {\Lambda}(t) &\stackrel{\text{def}}{=}\int\_{u=-\infty}^{t} {\lambda}(u)\\du && \text{(definition of the cumulative hazard)} \\ &= \mathopen{}\left\[-\operatorname{log}\mathopen{}\left\\\operatorname{S}(u)\right\\\mathclose{}\right\]\mathclose{}\_{u=-\infty}^{t} && \text{(} -\log \operatorname{S}\text{ is an antiderivative of } {\lambda}\text{)} \\ &= -\operatorname{log}\mathopen{}\left\\\operatorname{S}(t)\right\\\mathclose{} - 0 && \text{(evaluate at the bounds)} \\ &= -\operatorname{log}\mathopen{}\left\\\operatorname{S}(t)\right\\\mathclose{} && \text{(simplify)} \end{aligned} \\
>
> Exponentiating both sides of \\-{\Lambda}(t) = \operatorname{log}\mathopen{}\left\\\operatorname{S}(t)\right\\\mathclose{}\\ gives [Equation 1](#eq-surv-int-haz).

> **NOTE:**
>
> **Example 26 (Recovering the exponential survival function from its cumulative hazard)** Continuing [Example 25](#exm-exp-cumhaz), for \\t \ge 0\\:
>
> \\ \begin{aligned} \operatorname{S}(t) &= \operatorname{exp}\mathopen{}\left\\-{\Lambda}(t)\right\\\mathclose{} && \text{(survival function from the cumulative hazard)} \\ &= \operatorname{exp}\mathopen{}\left\\-\lambda t\right\\\mathclose{} && \text{(substitute } {\Lambda}(t) = \lambda t \text{)} \end{aligned} \\
>
> which matches the survival function computed directly in [Example 23](#exm-exp-survfn).

| Name | Symbols | Definition |
|:---|----|----|
| [Probability density function (PDF)](#def-pdf) | \\f(t), \operatorname{p}(t)\\ | \\f \ge 0\\ with \\\int_a^b f(u)\\du = \Pr(a \le T \le b)\\ |
| [Cumulative distribution function (CDF)](#def-cdf) | \\F(t)\\ | \\\Pr(T\leq t)\\ |
| [Survival function](#def-surv-fn) | \\\operatorname{S}(t), \bar{F}(t)\\ | \\\Pr(T \> t)\\ |
| [Hazard function](#def-hazard) | \\{\lambda}(t), \operatorname{h}(t)\\ | \\\lim\_{\Delta \downarrow 0} \Pr(t \le T \< t + \Delta \mid T \ge t) / \Delta\\ |
| [Cumulative hazard function](#def-cuhaz) | \\{\Lambda}(t), \operatorname{H}(t)\\ | \\\int\_{u=-\infty}^t {\lambda}(u)\\du\\ |
| Log-hazard function | \\\eta(t)\\ | \\\operatorname{log}\mathopen{}\left\\{\lambda}(t)\right\\\mathclose{}\\ |

Table 1: Probability distribution functions of a continuous random variable \\T\\

For a continuous random variable \\T \ge 0\\ whose density is continuous at all but finitely many points, [Theorem 7](#thm-survival-expressions-1), [Theorem 8](#thm-hazard-dens-surv), and [Corollary 1](#cor-surv-int-haz) connect the functions in [Table 1](#tbl-prob-dist-fns); each arrow in the following diagram converts one function into the next:

\\ f(t) \xleftarrow\[\operatorname{S}(t){\lambda}(t)\]{-\operatorname{S}'(t)} \operatorname{S}(t) \xleftarrow\[\]{\operatorname{exp}\mathopen{}\left\\-{\Lambda}(t)\right\\\mathclose{}} {\Lambda}(t) \xleftarrow\[\]{\int\_{u=0}^t {\lambda}(u)\\du} {\lambda}(t) \xleftarrow\[\]{\operatorname{exp}\mathopen{}\left\\\eta(t)\right\\\mathclose{}} \eta(t) \\

\\ f(t) \xrightarrow\[\int\_{u=t}^\infty f(u)\\du\]{f(t)/{\lambda}(t)} \operatorname{S}(t) \xrightarrow\[-\operatorname{log}\mathopen{}\left\\\operatorname{S}(t)\right\\\mathclose{}\]{} {\Lambda}(t) \xrightarrow\[{\Lambda}'(t)\]{} {\lambda}(t) \xrightarrow\[\operatorname{log}\mathopen{}\left\\{\lambda}(t)\right\\\mathclose{}\]{} \eta(t) \\

## References

Billingsley, Patrick. 1995. *Probability and Measure*. 3rd ed. Wiley Series in Probability and Mathematical Statistics. Wiley.

Casella, George, and Roger Berger. 2002. *Statistical Inference*. 2nd ed. Cengage Learning. <https://www.cengage.com/c/statistical-inference-2e-casella-berger/9780534243128/>.

Dobson, Annette J, and Adrian G Barnett. 2018. *An Introduction to Generalized Linear Models*. 4th ed. CRC press. <https://doi.org/10.1201/9781315182780>.

Kalbfleisch, John D, and Ross L Prentice. 2011. *The Statistical Analysis of Failure Time Data*. John Wiley & Sons.

Klein, John P, and Melvin L Moeschberger. 2003. *Survival Analysis: Techniques for Censored and Truncated Data*. 2nd ed. Springer. <https://link.springer.com/book/10.1007/b97377>.

Kleinbaum, David G, and Mitchel Klein. 2012. *Survival Analysis: A Self-Learning Text*. 3rd ed. Springer. <https://link.springer.com/book/10.1007/978-1-4419-6646-9>.

Rothman, Kenneth J., Timothy L. Lash, Tyler J. VanderWeele, and Sebastien Haneuse. 2021. *Modern Epidemiology*. Fourth edition. Wolters Kluwer.

Vittinghoff, Eric, David V Glidden, Stephen C Shiboski, and Charles E McCulloch. 2012. *Regression Methods in Biostatistics: Linear, Logistic, Survival, and Repeated Measures Models*. 2nd ed. Springer. <https://doi.org/10.1007/978-1-4614-1353-0>.

Back to top
