# Random variables and distribution functions

Code

Published

Last modified: 2026-09-28 00:57:21 (PDT)

# 1 Random variables

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
> **Example 4 (A uniformly distributed random variable)** Let \\X\\ satisfy \\\Pr(a \le X \le b) = b - a\\ for all \\0 \le a \le b \le 1\\ (the **uniform distribution** on \\\[0, 1\]\\). Taking \\a = b = x\\ gives \\\Pr(X = x) = x - x = 0\\ for every \\x \in \[0,1\]\\, and \\\Pr(X = x) = 0\\ outside \\\[0, 1\]\\ as well, so \\X\\ is continuous. Its range, \\\[0, 1\]\\, is uncountable.

# 2 Characteristics of probability distributions

> **NOTE:**
>
> **Definition 5 (Probability mass function (PMF))** If \\X\\ is a [discrete random variable](#def-discrete-rv), the **probability mass function** of \\X\\ at value \\x\\, denoted \\f(x)\\, \\f_X(x)\\, \\\operatorname{P}(x)\\, \\\operatorname{P}\_X(x)\\, or \\\operatorname{P}(X=x)\\, is the probability that \\X\\ takes exactly the value \\x\\:
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
> **Definition 6 (Probability density function (PDF))** If \\X\\ is a [continuous random variable](#def-continuous-rv), the **probability density** of \\X\\ at value \\x\\, denoted \\f(x)\\, \\f_X(x)\\, \\\operatorname{p}(x)\\, \\\operatorname{p}\_X(x)\\, or \\\operatorname{p}(X=x)\\, is the limit of the [probability](probability-basics.llms.md#def-probability) that \\X\\ falls in an interval starting at \\x\\, divided by the width of that interval, as that width shrinks to 0:
>
> \\f(x) \stackrel{\text{def}}{=}\lim\_{\Delta \downarrow 0} \frac{\Pr(X \in \[x, x + \Delta\])}{\Delta}\\

A density is not a probability: it can exceed 1. For small \\\Delta \> 0\\, \\f(x) \cdot\Delta \approx \Pr(X \in \[x, x + \Delta\])\\.

See also Rothman et al. ([2021](#ref-me4)) (Chapter 22, p. 535) and <https://en.wikipedia.org/wiki/Probability_density_function#Formal_definition>

> **NOTE:**
>
> **Example 6 (Density of a uniform random variable)** For \\X\\ uniform on \\\[0, 1\]\\ ([Example 4](#exm-continuous-rv)) and \\x \in \[0, 1)\\, \\\Pr(X \in \[x, x + \Delta\]) = \Delta\\ once \\\Delta \le 1 - x\\, so:
>
> \\f(x) = \lim\_{\Delta \downarrow 0} \frac{\Delta}{\Delta} = 1\\
>
> For \\x \< 0\\ or \\x \> 1\\, the interval eventually misses \\\[0, 1\]\\, so \\f(x) = 0\\.

> **NOTE:**
>
> **Definition 7 (Cumulative distribution function (CDF))** For a random variable \\X\\ (discrete or continuous), its **cumulative distribution function** is:
>
> \\F(t) \stackrel{\text{def}}{=}\Pr(X\le t), \quad t\in\mathbb{R}.\\

The CDF is always defined, whether \\X\\ is discrete or continuous, and it fully characterizes \\X\\’s distribution. It is non-decreasing, with \\F(t) \to 0\\ as \\t \to -\infty\\ and \\F(t) \to 1\\ as \\t \to \infty\\.

See also <https://en.wikipedia.org/wiki/Cumulative_distribution_function>

> **NOTE:**
>
> **Example 7 (CDF of the number of heads)** Summing the PMF in [Example 5](#exm-pmf) over values at or below \\t\\:
>
> \\ F(t) = \begin{cases} 0, & t \< 0 \\ \tfrac{1}{4}, & 0 \le t \< 1 \\ \tfrac{3}{4}, & 1 \le t \< 2 \\ 1, & t \ge 2 \end{cases} \\

> **NOTE:**
>
> **Definition 8 (Quantile function (population inverse CDF))** For a random variable \\X\\ with [cumulative distribution function (CDF)](#def-cdf) \\F\\, its population **quantile function** (generalized inverse of \\F\\) is:
>
> \\Q(p) \stackrel{\text{def}}{=}\inf\\t:F(t)\ge p\\, \quad 0\<p\<1.\\

The restriction to \\0 \< p \< 1\\ keeps \\Q(p)\\ finite: for \\p = 1\\, the set \\\\t : F(t) \ge 1\\\\ is empty whenever \\F(t) \< 1\\ for every \\t\\, as for a normal distribution, and the infimum of the empty set is \\+\infty\\.

> **NOTE:**
>
> **Example 8 (Median of the number of heads)** From [Example 7](#exm-cdf), \\F(t) \ge 0.5\\ first holds at \\t = 1\\, so the median of the number of heads is \\Q(0.5) = 1\\.

> **NOTE:**
>
> **Theorem 1 (Density function is derivative of CDF)** If \\X\\ is a continuous random variable with density \\f\\ and CDF \\F\\, then at every \\t\\ where \\F\\ is differentiable:
>
> \\f(t) = \frac{\partial}{\partial t} F(t)\\

> **NOTE:**
>
> *Proof*. For \\\Delta \> 0\\, \\\\X \le t + \Delta\\\\ is the disjoint union of \\\\X \le t\\\\ and \\\\t \< X \le t + \Delta\\\\, and \\\Pr(X = t) = 0\\ because \\X\\ is continuous. So:
>
> \\ \begin{aligned} f(t) &\stackrel{\text{def}}{=}\lim\_{\Delta \downarrow 0} \frac{\Pr(t \le X \le t + \Delta)}{\Delta} && \text{(definition of the density)} \\ &= \lim\_{\Delta \downarrow 0} \frac{\Pr(t \< X \le t + \Delta)}{\Delta} && \text{(} \Pr(X = t) = 0 \text{)} \\ &= \lim\_{\Delta \downarrow 0} \frac{F(t + \Delta) - F(t)}{\Delta} && \text{(additivity, and the definition of the CDF)} \\ &= \frac{\partial}{\partial t} F(t) && \text{(} F \text{ is differentiable at } t \text{)} \end{aligned} \\

For the densities in these notes, \\F\\ is differentiable at all but finitely many points, so the fundamental theorem of calculus gives \\F(b) - F(a) = \int_a^b f(x)\\dx\\, and in particular \\F(t) = \int\_{-\infty}^t f(x)\\dx\\.

> **NOTE:**
>
> **Example 9 (CDF and density of a uniform random variable)** For \\X\\ uniform on \\\[0, 1\]\\, \\F(t) = \Pr(0 \le X \le t) = t\\ for \\t \in \[0, 1\]\\. For \\t \in (0, 1)\\, \\\frac{\partial}{\partial t} F(t) = 1\\, which matches [Example 6](#exm-pdf).

> **NOTE:**
>
> **Theorem 2 (Density functions integrate to 1)** If \\X\\ is a continuous random variable with density \\f\\:
>
> \\\int\_{-\infty}^{\infty} f(x)\\ dx = 1\\

> **NOTE:**
>
> *Proof*. \\ \begin{aligned} \int\_{-\infty}^{\infty} f(x)\\ dx &= \lim\_{b \to \infty} F(b) - \lim\_{a \to -\infty} F(a) && \text{(} F(b) - F(a) = \textstyle\int_a^b f(x)\\dx \text{)} \\ &= 1 - 0 && \text{(limits of a CDF)} \\ &= 1 && \text{(simplify)} \end{aligned} \\

> **NOTE:**
>
> **Example 10 (The uniform density integrates to 1)** For \\X\\ uniform on \\\[0, 1\]\\ ([Example 6](#exm-pdf)), \\\int\_{-\infty}^{\infty} f(x)\\dx = \int_0^1 1\\dx = 1\\.

## 2.1 Survival, hazard, and cumulative hazard functions

> **NOTE:**
>
> **Definition 9 (Survival function)** The **survival function** (or **survivor function**) of a random variable \\T\\, denoted \\\operatorname{S}(t)\\, is the probability that \\T\\ exceeds \\t\\:
>
> \\\operatorname{S}(t) \stackrel{\text{def}}{=}\Pr(T \> t)\\

The name comes from time-to-event analysis: if \\T\\ is the time at which a participant dies, then \\\operatorname{S}(t)\\ is the probability that the participant is still alive at time \\t\\. The definition itself applies to any random variable.

> **NOTE:**
>
> **Theorem 3 (Survival function and CDF)** For any random variable \\T\\ with [CDF](#def-cdf) \\F(t)\\:
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
> For continuous \\T\\, the density integrates to 1 over the real line ([Theorem 2](#thm-density-sums-to-one)), so:
>
> \\ \begin{aligned} 1 - F(t) &= \int\_{u=-\infty}^{\infty} f(u)\\du - \int\_{u=-\infty}^{t} f(u)\\du && \text{(total integral is 1; } F \text{ is the integral of } f \text{)} \\ &= \int\_{u=t}^{\infty} f(u)\\du && \text{(split the first integral at } t \text{ and cancel)} \end{aligned} \\

> **NOTE:**
>
> **Example 11 (Survival function of an exponential distribution)** Let \\T\\ have density \\f(t) = \lambda \text{e}^{-\lambda t}\\ for \\t \ge 0\\ (and \\0\\ for \\t \< 0\\), for a fixed rate \\\lambda \> 0\\; this is the **exponential distribution** with rate \\\lambda\\. For \\t \ge 0\\, by [Theorem 3](#thm-survival-expressions-1):
>
> \\ \begin{aligned} \operatorname{S}(t) &= \int\_{u=t}^{\infty} \lambda \text{e}^{-\lambda u}\\du && \text{(integral form of the survival function)} \\ &= \mathopen{}\left\[-\text{e}^{-\lambda u}\right\]\mathclose{}\_{u=t}^{\infty} && \text{(antiderivative of } \lambda \text{e}^{-\lambda u} \text{)} \\ &= 0 - \mathopen{}\left(-\text{e}^{-\lambda t}\right)\mathclose{} && \text{(evaluate at the bounds; } \text{e}^{-\lambda u} \to 0 \text{ as } u \to \infty \text{)} \\ &= \text{e}^{-\lambda t} && \text{(simplify)} \end{aligned} \\
>
> For \\t \< 0\\, \\\operatorname{S}(t) = \Pr(T \> t) = 1\\, since \\T \ge 0\\. With \\\lambda = 0.5\\, for example, \\\operatorname{S}(2) = \text{e}^{-1} \approx 0.368\\.

> **NOTE:**
>
> **Definition 10 (Hazard function)** The **hazard function** (also called the **hazard rate** or **hazard rate function**) of a continuous random variable \\T\\ at value \\t\\, typically denoted \\{\lambda}(t)\\ or \\\operatorname{h}(t)\\, is the conditional [density](#def-pdf) of \\T\\ at \\t\\, given \\T \ge t\\:
>
> \\{\lambda}(t) \stackrel{\text{def}}{=}\operatorname{p}(T=t \mid T\ge t)\\

Sources differ on the symbol: \\\operatorname{h}(t)\\ appears in Dobson and Barnett ([2018](#ref-dobson4e)), Vittinghoff et al. ([2012](#ref-vittinghoff2e)), Klein and Moeschberger ([2003](#ref-klein2003survival)), and Kleinbaum and Klein ([2012](#ref-kleinbaum2012survival)), while \\\lambda(t)\\ appears in Rothman et al. ([2021](#ref-me4)) and Kalbfleisch and Prentice ([2011](#ref-kalbfleisch2011statistical)).

If \\T\\ is the time at which an event occurs, then \\{\lambda}(t)\\ is a rate, not a probability: for a small interval width \\\Delta \> 0\\, \\{\lambda}(t) \cdot\Delta\\ is approximately the probability that the event occurs in \\\[t, t + \Delta)\\, given that it has not occurred before \\t\\. A hazard can exceed 1, just as a density can. For a discrete \\T\\, the same definition with a conditional probability in place of the conditional density gives a *discrete-time* hazard, \\\Pr(T = t \mid T \ge t)\\, which is a probability.

The name “hazard” carries a connotation that the event is undesirable — death, relapse, equipment failure, and so on. When the event in question is neutral or desirable (recovery, conception, graduation, response to treatment), the same quantity \\{\lambda}(t)\\ is often called the **event incidence rate** instead. This terminology parallels the convention that conditional probabilities of undesirable events are called **risks**, while the same conditional probabilities for neutral or desirable events are simply called **probabilities**. The math is identical; only the name changes with the valence of the event.

> **NOTE:**
>
> **Theorem 4 (Hazard equals density over survival)** If \\T\\ is a continuous random variable with [density](#def-pdf) \\f(t)\\ and [survival function](#def-surv-fn) \\\operatorname{S}(t)\\, then for every \\t\\ with \\\operatorname{S}(t) \> 0\\:
>
> \\{\lambda}(t) = \frac{f(t)}{\operatorname{S}(t)}\\

> **NOTE:**
>
> *Proof*. The proof uses two facts. First, the event \\\\T = t\\\\ is a subset of the event \\\\T \ge t\\\\, so intersecting them leaves \\\\T = t\\\\ (the [subset property](probability-basics.llms.md#thm-prob-subset)). Second, \\\Pr(T = t) = 0\\ for a continuous \\T\\, so \\\Pr(T \ge t) = \Pr(T \> t) = \operatorname{S}(t)\\.
>
> \\ \begin{aligned} {\lambda}(t) &\stackrel{\text{def}}{=}\operatorname{p}(T = t \mid T \ge t) && \text{(definition of the hazard function)} \\ &= \frac{\operatorname{p}(T = t,\\ T \ge t)}{\Pr(T \ge t)} && \text{(definition of a conditional density)} \\ &= \frac{\operatorname{p}(T = t)}{\Pr(T \ge t)} && \text{(} \\T = t\\ \subseteq \\T \ge t\\ \text{)} \\ &= \frac{f(t)}{\Pr(T \ge t)} && \text{(} f \text{ is the density of } T \text{)} \\ &= \frac{f(t)}{\operatorname{S}(t)} && \text{(} \Pr(T = t) = 0 \text{ for continuous } T \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 12 (Hazard function of an exponential distribution)** Continuing [Example 11](#exm-exp-survfn), for \\t \ge 0\\:
>
> \\ \begin{aligned} {\lambda}(t) &= \frac{f(t)}{\operatorname{S}(t)} && \text{(hazard equals density over survival)} \\ &= \frac{\lambda \text{e}^{-\lambda t}}{\text{e}^{-\lambda t}} && \text{(substitute the exponential density and survival function)} \\ &= \lambda && \text{(cancel } \text{e}^{-\lambda t} \text{)} \end{aligned} \\
>
> The exponential distribution has a constant hazard, equal to its rate parameter; for \\t \< 0\\, \\f(t) = 0\\, so \\{\lambda}(t) = 0\\.

> **NOTE:**
>
> **Definition 11 (Cumulative hazard function)** The **cumulative hazard function** of a continuous random variable \\T\\, often denoted \\{\Lambda}(t)\\ or \\\operatorname{H}(t)\\, is the integral of its [hazard function](#def-hazard) up to \\t\\:
>
> \\{\Lambda}(t) \stackrel{\text{def}}{=}\int\_{u=-\infty}^{t} {\lambda}(u)\\du\\

For a non-negative \\T\\, such as a time to event, \\{\lambda}(u) = 0\\ for \\u \< 0\\, so the lower limit of the integral can be replaced by \\0\\: \\{\Lambda}(t) = \int\_{u=0}^{t} {\lambda}(u)\\du\\. That is the form most survival-analysis texts use.

> **NOTE:**
>
> **Example 13 (Cumulative hazard function of an exponential distribution)** Continuing [Example 12](#exm-exp-haz), the hazard is \\{\lambda}(u) = \lambda\\ for \\u \ge 0\\ and \\0\\ for \\u \< 0\\, so for \\t \ge 0\\:
>
> \\ \begin{aligned} {\Lambda}(t) &= \int\_{u=-\infty}^{0} 0\\du + \int\_{u=0}^{t} \lambda\\du && \text{(split the integral at } 0 \text{)} \\ &= 0 + \lambda t && \text{(integrate each piece)} \\ &= \lambda t && \text{(simplify)} \end{aligned} \\
>
> and \\{\Lambda}(t) = 0\\ for \\t \< 0\\.

> **NOTE:**
>
> **Corollary 1 (Survival function from the cumulative hazard)** If \\T\\ is a continuous random variable whose CDF \\F\\ is differentiable at all but finitely many points, then for every \\t\\ with \\\operatorname{S}(t) \> 0\\:
>
> \\{\Lambda}(t) = -\operatorname{log}\mathopen{}\left\\\operatorname{S}(t)\right\\\mathclose{}\\
>
> and therefore:
>
> \\\operatorname{S}(t) = \operatorname{exp}\mathopen{}\left\\-{\Lambda}(t)\right\\\mathclose{} \tag{1}\\

> **NOTE:**
>
> *Proof*. Since \\\operatorname{S}(t) = 1 - F(t)\\ ([Theorem 3](#thm-survival-expressions-1)) and \\F\\ has derivative \\f\\ wherever \\F\\ is differentiable ([Theorem 1](#thm-density-vs-CDF)), \\\operatorname{S}\\ has derivative \\-f\\ at those points. At each such \\u\\ with \\\operatorname{S}(u) \> 0\\:
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
> **Example 14 (Recovering the exponential survival function from its cumulative hazard)** Continuing [Example 13](#exm-exp-cumhaz), for \\t \ge 0\\:
>
> \\ \begin{aligned} \operatorname{S}(t) &= \operatorname{exp}\mathopen{}\left\\-{\Lambda}(t)\right\\\mathclose{} && \text{(survival function from the cumulative hazard)} \\ &= \operatorname{exp}\mathopen{}\left\\-\lambda t\right\\\mathclose{} && \text{(substitute } {\Lambda}(t) = \lambda t \text{)} \end{aligned} \\
>
> which matches the survival function computed directly in [Example 11](#exm-exp-survfn).

| Name | Symbols | Definition |
|:---|----|----|
| [Probability density function (PDF)](#def-pdf) | \\f(t), \operatorname{p}(t)\\ | \\\operatorname{p}(T=t)\\ |
| [Cumulative distribution function (CDF)](#def-cdf) | \\F(t)\\ | \\\Pr(T\leq t)\\ |
| [Survival function](#def-surv-fn) | \\\operatorname{S}(t), \bar{F}(t)\\ | \\\Pr(T \> t)\\ |
| [Hazard function](#def-hazard) | \\{\lambda}(t), \operatorname{h}(t)\\ | \\\operatorname{p}(T=t \mid T\ge t)\\ |
| [Cumulative hazard function](#def-cuhaz) | \\{\Lambda}(t), \operatorname{H}(t)\\ | \\\int\_{u=-\infty}^t {\lambda}(u)\\du\\ |
| Log-hazard function | \\\eta(t)\\ | \\\operatorname{log}\mathopen{}\left\\{\lambda}(t)\right\\\mathclose{}\\ |

Table 1: Probability distribution functions of a continuous random variable \\T\\

For a continuous random variable \\T \ge 0\\ whose CDF is differentiable at all but finitely many points, [Theorem 3](#thm-survival-expressions-1), [Theorem 4](#thm-hazard-dens-surv), and [Corollary 1](#cor-surv-int-haz) connect the functions in [Table 1](#tbl-prob-dist-fns); each arrow in the following diagram converts one function into the next:

\\ f(t) \xleftarrow\[\operatorname{S}(t){\lambda}(t)\]{-\operatorname{S}'(t)} \operatorname{S}(t) \xleftarrow\[\]{\operatorname{exp}\mathopen{}\left\\-{\Lambda}(t)\right\\\mathclose{}} {\Lambda}(t) \xleftarrow\[\]{\int\_{u=0}^t {\lambda}(u)\\du} {\lambda}(t) \xleftarrow\[\]{\operatorname{exp}\mathopen{}\left\\\eta(t)\right\\\mathclose{}} \eta(t) \\

\\ f(t) \xrightarrow\[\int\_{u=t}^\infty f(u)\\du\]{f(t)/{\lambda}(t)} \operatorname{S}(t) \xrightarrow\[-\operatorname{log}\mathopen{}\left\\\operatorname{S}(t)\right\\\mathclose{}\]{} {\Lambda}(t) \xrightarrow\[{\Lambda}'(t)\]{} {\lambda}(t) \xrightarrow\[\operatorname{log}\mathopen{}\left\\{\lambda}(t)\right\\\mathclose{}\]{} \eta(t) \\

# References

Dobson, Annette J, and Adrian G Barnett. 2018. *An Introduction to Generalized Linear Models*. 4th ed. CRC press. <https://doi.org/10.1201/9781315182780>.

Kalbfleisch, John D, and Ross L Prentice. 2011. *The Statistical Analysis of Failure Time Data*. John Wiley & Sons.

Klein, John P, and Melvin L Moeschberger. 2003. *Survival Analysis: Techniques for Censored and Truncated Data*. 2nd ed. Springer. <https://link.springer.com/book/10.1007/b97377>.

Kleinbaum, David G, and Mitchel Klein. 2012. *Survival Analysis: A Self-Learning Text*. 3rd ed. Springer. <https://link.springer.com/book/10.1007/978-1-4419-6646-9>.

Rothman, Kenneth J., Timothy L. Lash, Tyler J. VanderWeele, and Sebastien Haneuse. 2021. *Modern Epidemiology*. Fourth edition. Wolters Kluwer.

Vittinghoff, Eric, David V Glidden, Stephen C Shiboski, and Charles E McCulloch. 2012. *Regression Methods in Biostatistics: Linear, Logistic, Survival, and Repeated Measures Models*. 2nd ed. Springer. <https://doi.org/10.1007/978-1-4614-1353-0>.

Back to top
