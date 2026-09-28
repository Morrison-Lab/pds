# Variance and covariance

Code

Published

Last modified: 2026-09-28 00:57:21 (PDT)

# 1 Variance and covariance

## 1.1 Deviation, error, and noise

> **NOTE:**
>
> **Definition 1 (Deviation)** A **deviation** is the difference between a value and a reference value. For any quantity \\z\\ and reference value \\r\\, the deviation of \\z\\ from \\r\\ is:
>
> \\z - r\\

In probability and statistics, “deviation” usually means deviation from a [population mean](expectation.llms.md#def-expectation).

See: [Wikipedia: Deviation (statistics)](https://en.wikipedia.org/wiki/Deviation_(statistics))

> **NOTE:**
>
> **Example 1 (Deviation from a reference weight)** A newborn weighing 3,200 g deviates from a reference weight of 3,500 g by \\3200 - 3500 = -300\\ g.

> **NOTE:**
>
> **Definition 2 (Deviation from a population or subpopulation mean)** The **deviation from the mean** of a random variable \\Y\\ is its [deviation](#def-deviation) from its [expectation](expectation.llms.md#def-expectation):
>
> \\e(Y) \stackrel{\text{def}}{=}Y - \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\\
>
> For a realized observation \\y\\:
>
> \\e(y) \stackrel{\text{def}}{=}y - \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\\

Other sources often call this quantity an **error** or **noise term**. In regression settings, the reference mean is often conditional on covariates: \\e(y_i) \stackrel{\text{def}}{=}y_i - \operatorname{E}\mathopen{}\left\[Y_i \mid X_i = x_i\right\]\mathclose{}\\.

These notes prefer “deviation” for this mean-deviation quantity; “error” and “noise” are common aliases. The Morrison Lab’s regression notes use “residual” (defined in their [Linear regression chapter](https://morrison-lab.github.io/rme/chapters/Linear-models-overview.html#def-resid-fitted)) for deviations from fitted values, write \\e(\cdot)\\ for these model/data deviations, and reserve \\\varepsilon\mathopen{}\left(\cdot\right)\mathclose{}\\ for estimator-to-estimand deviations (see [Estimation](https://morrison-lab.github.io/rme/chapters/estimation.html#def-estimation-error)).

See:

- [Wikipedia: Errors and residuals](https://en.wikipedia.org/wiki/Errors_and_residuals)
- [Wikipedia: Deviation (statistics)](https://en.wikipedia.org/wiki/Deviation_(statistics))
- [Wikipedia: Linear regression — Notation and terminology](https://en.wikipedia.org/wiki/Linear_regression#Notation_and_terminology)

> **NOTE:**
>
> **Example 2 (Deviation of a die roll from its mean)** A fair die roll \\Y\\ has \\\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = 3.5\\ (computed on the [expectation page](expectation.llms.md#exm-linearity-expectation)), so a roll of \\y = 5\\ has deviation \\e(5) = 5 - 3.5 = 1.5\\, and a roll of \\y = 2\\ has deviation \\e(2) = 2 - 3.5 = -1.5\\.

## 1.2 Variance and related characteristics

> **NOTE:**
>
> **Definition 3 (Variance)** The **variance** of a random variable \\X\\ is the [expectation](expectation.llms.md#def-expectation) of the squared [deviation from the mean](#def-deviation-pop-mean); that is:
>
> \\\operatorname{Var}\mathopen{}\left(X\right)\mathclose{} \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[\[e(X)\]^2\right\]\mathclose{}\\

> **NOTE:**
>
> **Theorem 1 (Variance as expected squared deviation from the mean)** \\\operatorname{Var}\mathopen{}\left(X\right)\mathclose{} = \operatorname{E}\mathopen{}\left\[(X - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})^2\right\]\mathclose{}\\

> **NOTE:**
>
> *Proof*. Substituting the definition of \\e(X)\\ from [Definition 2](#def-deviation-pop-mean) into [Definition 3](#def-variance):
>
> \\ \operatorname{Var}\mathopen{}\left(X\right)\mathclose{} \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[\[e(X)\]^2\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[(X - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})^2\right\]\mathclose{}. \\

This is the more commonly seen form of the variance definition, and the canonical starting point in most treatments; it’s given here as a theorem rather than the primary definition to keep \\e(X)\\ as the definition’s single building block, matching the notation of [Definition 2](#def-deviation-pop-mean).

> **NOTE:**
>
> **Theorem 2 (Simplified expression for variance)** \\\operatorname{Var}\mathopen{}\left(X\right)\mathclose{}=\operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} - \mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{}\\

> **NOTE:**
>
> *Proof*. By [linearity of expectation](expectation.llms.md#thm-linearity-expectation), with \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\\ treated as a constant:
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(X\right)\mathclose{} &\stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[\[e(X)\]^2\right\]\mathclose{} && \text{(definition of variance)} \\ &= \operatorname{E}\mathopen{}\left\[(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})^2\right\]\mathclose{} && \text{(definition of deviation from mean)} \\ &=\operatorname{E}\mathopen{}\left\[X^2 - 2X\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{}\right\]\mathclose{} && \text{(expand binomial square)} \\ &=\operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} - 2\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{} && \text{(linearity of expectation; } \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} \text{ is a constant)} \\ &=\operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} - \mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{} && \text{(combine like terms)} \end{aligned} \\

> **NOTE:**
>
> **Example 3 (Variance of a Bernoulli random variable)** Let \\X \sim \operatorname{Ber}(\pi)\\. Then \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} = \pi\\ and \\\operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} = \pi\\ (both computed on the [expectation page](expectation.llms.md#exm-lotus)), so:
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(X\right)\mathclose{} &= \operatorname{E}\mathopen{}\left\[X^2\right\]\mathclose{} - \mathopen{}\left(\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\right)^2\mathclose{} && \text{(simplified expression for variance)} \\ &= \pi - \pi^2 && \text{(substitute)} \\ &= \pi(1 - \pi) && \text{(factor)} \end{aligned} \\
>
> For a fair coin (\\\pi = 1/2\\), \\\operatorname{Var}\mathopen{}\left(X\right)\mathclose{} = 1/4\\.

> **NOTE:**
>
> **Definition 4 (Conditional variance)** The **conditional variance** of \\Y\\ given \\X = x\\ is the variance of \\Y\\ under its conditional distribution given \\X = x\\:
>
> \\\operatorname{Var}\mathopen{}\left(Y \mid X = x\right)\mathclose{} \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - \operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{}\right)\mathclose{}^2 \mid X = x\right\]\mathclose{}\\
>
> Evaluating this function of \\x\\ at \\X\\ gives the random variable \\\operatorname{Var}\mathopen{}\left(Y \mid X\right)\mathclose{}\\, just as the [conditional expectation function](expectation.llms.md#def-cond-expectation-function) \\\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\\ comes from \\\operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{}\\.

> **NOTE:**
>
> **Example 4 (Conditional variance of a binary outcome)** Let \\(X, Y)\\ have the joint PMF \\\operatorname{P}(X=0, Y=0) = 0.2\\, \\\operatorname{P}(X=0, Y=1) = 0.3\\, \\\operatorname{P}(X=1, Y=0) = 0.1\\, \\\operatorname{P}(X=1, Y=1) = 0.4\\ (the table in the [expectation page’s exercise](expectation.llms.md#exr-fubini-joint-disc)). Given \\X = 0\\, \\Y\\ is binary with \\\operatorname{P}(Y = 1 \mid X = 0) = 0.3/0.5 = 0.6\\, so \\\operatorname{E}\mathopen{}\left\[Y \mid X = 0\right\]\mathclose{} = 0.6\\, and by [Definition 4](#def-cond-variance):
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(Y \mid X = 0\right)\mathclose{} &= (0 - 0.6)^2 \cdot 0.4 + (1 - 0.6)^2 \cdot 0.6 && \text{(definition of conditional variance)} \\ &= 0.144 + 0.096 && \text{(multiply)} \\ &= 0.24 && \text{(add)} \end{aligned} \\
>
> The same steps with \\\operatorname{P}(Y = 1 \mid X = 1) = 0.4/0.5 = 0.8\\ give \\\operatorname{Var}\mathopen{}\left(Y \mid X = 1\right)\mathclose{} = (0.2)^2 \cdot 0.8 + (0.8)^2 \cdot 0.2 = 0.16\\.

> **NOTE:**
>
> **Definition 5 (Homoskedasticity)** A random variable \\Y\\ is **homoskedastic** with respect to a random variable (or vector) \\X\\ if the [conditional variance](#def-cond-variance) of \\Y\\ given \\X = x\\ is the same for every \\x\\:
>
> \\\operatorname{Var}\mathopen{}\left(Y \mid X = x\right)\mathclose{} = \sigma^2\quad \text{for all } x\\
>
> for some constant \\\sigma^2\\.

> **NOTE:**
>
> **Example 5 (A homoskedastic total)** Flip two fair coins, let \\X_1\\ indicate heads on the first, and let \\Y\\ be the total number of heads. Given \\X_1 = 0\\, \\Y\\ is \\0\\ or \\1\\ with probability \\1/2\\ each; given \\X_1 = 1\\, \\Y\\ is \\1\\ or \\2\\ with probability \\1/2\\ each. Either way, \\Y\\ is \\1/2\\ away from its conditional mean with probability 1, so \\\operatorname{Var}\mathopen{}\left(Y \mid X_1 = 0\right)\mathclose{} = \operatorname{Var}\mathopen{}\left(Y \mid X_1 = 1\right)\mathclose{} = 1/4\\, and \\Y\\ is homoskedastic with respect to \\X_1\\, with \\\sigma^2= 1/4\\.

> **NOTE:**
>
> **Definition 6 (Heteroskedasticity)** A random variable \\Y\\ is **heteroskedastic** with respect to \\X\\ if it is not [homoskedastic](#def-homosked) with respect to \\X\\: that is, if \\\operatorname{Var}\mathopen{}\left(Y \mid X = x\right)\mathclose{}\\ differs between some values of \\x\\.

> **NOTE:**
>
> **Example 6 (A heteroskedastic binary outcome)** In [Example 4](#exm-cond-variance), \\\operatorname{Var}\mathopen{}\left(Y \mid X = 0\right)\mathclose{} = 0.24 \ne 0.16 = \operatorname{Var}\mathopen{}\left(Y \mid X = 1\right)\mathclose{}\\, so \\Y\\ is heteroskedastic with respect to \\X\\. More generally, a binary outcome with \\\operatorname{P}(Y = 1 \mid X = x) = \pi(x)\\ has conditional variance \\\pi(x)(1 - \pi(x))\\, so it is homoskedastic only if \\\pi(x)\\ takes at most two values, \\\pi\\ and \\1 - \pi\\, for some \\\pi\\.

> **NOTE:**
>
> **Theorem 3 (Law of total variance)** For random variables \\X\\ and \\Y\\ with \\\operatorname{E}\mathopen{}\left\[Y^2\right\]\mathclose{} \< \infty\\:
>
> \\\operatorname{Var}\mathopen{}\left(Y\right)\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{Var}\mathopen{}\left(Y \mid X\right)\mathclose{}\right\]\mathclose{} + \operatorname{Var}\mathopen{}\left(\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right)\mathclose{}\\

> **NOTE:**
>
> *Proof*. Write \\\mu \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\\ and \\m(X) \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\\. Adding and subtracting \\m(X)\\ inside the deviation and expanding the square:
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(Y\right)\mathclose{} &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - \mu\right)\mathclose{}^2\right\]\mathclose{} && \text{(definition of variance)} \\ &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left(\mathopen{}\left\[Y - m(X)\right\]\mathclose{} + \mathopen{}\left\[m(X) - \mu\right\]\mathclose{}\right)\mathclose{}^2\right\]\mathclose{} && \text{(add and subtract } m(X) \text{)} \\ &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - m(X)\right)^2\mathclose{}\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[\mathopen{}\left(m(X) - \mu\right)^2\mathclose{}\right\]\mathclose{} + 2\operatorname{E}\mathopen{}\left\[\mathopen{}\left\[Y - m(X)\right\]\mathclose{}\mathopen{}\left\[m(X) - \mu\right\]\mathclose{}\right\]\mathclose{} && \text{(expand the square; linearity of expectation)} \end{aligned} \\
>
> The three terms are handled separately, each using the [law of iterated expectations](expectation.llms.md#thm-lie). Given \\X = x\\, any function of \\X\\ is the constant obtained by evaluating it at \\x\\, so it factors out of a conditional expectation given \\X\\.
>
> First term:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - m(X)\right)^2\mathclose{}\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - m(X)\right)^2\mathclose{} \mid X\right\]\mathclose{}\right\]\mathclose{} && \text{(law of iterated expectations)} \\ &= \operatorname{E}\mathopen{}\left\[\operatorname{Var}\mathopen{}\left(Y \mid X\right)\mathclose{}\right\]\mathclose{} && \text{(definition of conditional variance)} \end{aligned} \\
>
> Second term: by the law of iterated expectations, \\\operatorname{E}\mathopen{}\left\[m(X)\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right\]\mathclose{} = \mu\\, so:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\mathopen{}\left(m(X) - \mu\right)^2\mathclose{}\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left(m(X) - \operatorname{E}\mathopen{}\left\[m(X)\right\]\mathclose{}\right)^2\mathclose{}\right\]\mathclose{} && \text{(} \mu = \operatorname{E}\mathopen{}\left\[m(X)\right\]\mathclose{} \text{)} \\ &= \operatorname{Var}\mathopen{}\left(m(X)\right)\mathclose{} && \text{(definition of variance)} \\ &= \operatorname{Var}\mathopen{}\left(\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right)\mathclose{} && \text{(definition of } m(X) \text{)} \end{aligned} \\
>
> Third term:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[Y - m(X)\right\]\mathclose{}\mathopen{}\left\[m(X) - \mu\right\]\mathclose{}\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[\mathopen{}\left\[Y - m(X)\right\]\mathclose{}\mathopen{}\left\[m(X) - \mu\right\]\mathclose{} \mid X\right\]\mathclose{}\right\]\mathclose{} && \text{(law of iterated expectations)} \\ &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[m(X) - \mu\right\]\mathclose{} \cdot\operatorname{E}\mathopen{}\left\[Y - m(X) \mid X\right\]\mathclose{}\right\]\mathclose{} && \text{(} m(X) - \mu \text{ is constant given } X \text{)} \\ &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[m(X) - \mu\right\]\mathclose{} \cdot\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{} - m(X)\right\]\mathclose{}\right\]\mathclose{} && \text{(linearity of conditional expectation)} \\ &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[m(X) - \mu\right\]\mathclose{} \cdot 0\right\]\mathclose{} && \text{(} \operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{} = m(X) \text{)} \\ &= 0 && \text{(expectation of a constant)} \end{aligned} \\
>
> Substituting the three terms:
>
> \\\operatorname{Var}\mathopen{}\left(Y\right)\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{Var}\mathopen{}\left(Y \mid X\right)\mathclose{}\right\]\mathclose{} + \operatorname{Var}\mathopen{}\left(\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right)\mathclose{} + 2 \cdot 0 = \operatorname{E}\mathopen{}\left\[\operatorname{Var}\mathopen{}\left(Y \mid X\right)\mathclose{}\right\]\mathclose{} + \operatorname{Var}\mathopen{}\left(\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right)\mathclose{}\\

Alternate names include: the **conditional variance formula**, **Eve’s law**, and the **variance decomposition formula**.

> **NOTE:**
>
> **Example 7 (Decomposing the variance of a binary outcome)** Continuing [Example 4](#exm-cond-variance), \\\operatorname{P}(X = 0) = \operatorname{P}(X = 1) = 0.5\\, \\\operatorname{E}\mathopen{}\left\[Y \mid X = 0\right\]\mathclose{} = 0.6\\, and \\\operatorname{E}\mathopen{}\left\[Y \mid X = 1\right\]\mathclose{} = 0.8\\, so \\\operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right\]\mathclose{} = 0.7\\, and by [Theorem 3](#thm-total-variance):
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\operatorname{Var}\mathopen{}\left(Y \mid X\right)\mathclose{}\right\]\mathclose{} &= 0.5 \cdot 0.24 + 0.5 \cdot 0.16 = 0.20 && \text{(average the conditional variances)} \\ \operatorname{Var}\mathopen{}\left(\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\right)\mathclose{} &= 0.5 \cdot(0.6 - 0.7)^2 + 0.5 \cdot(0.8 - 0.7)^2 = 0.01 && \text{(variance of the conditional means)} \\ \operatorname{Var}\mathopen{}\left(Y\right)\mathclose{} &= 0.20 + 0.01 = 0.21 && \text{(law of total variance)} \end{aligned} \\
>
> As a check, \\Y\\ is Bernoulli with \\\operatorname{P}(Y = 1) = 0.3 + 0.4 = 0.7\\, so by [Example 3](#exm-variance-bernoulli), \\\operatorname{Var}\mathopen{}\left(Y\right)\mathclose{} = 0.7 \cdot 0.3 = 0.21\\.

> **NOTE:**
>
> **Definition 7 (Precision)** The **precision** of a random variable \\X\\, often denoted \\\tau(X)\\, \\\tau_X\\, or shorthanded as \\\tau\\, is the inverse of that random variable’s [variance](#def-variance) (for \\\operatorname{Var}\mathopen{}\left(X\right)\mathclose{} \> 0\\); that is:
>
> \\\tau(X) \stackrel{\text{def}}{=}\mathopen{}\left(\operatorname{Var}\mathopen{}\left(X\right)\mathclose{}\right)^{-1}\mathclose{}\\

> **NOTE:**
>
> **Definition 8 (Standard deviation)** The **standard deviation** of a random variable \\X\\ is the square root of the [variance](#def-variance) of \\X\\:
>
> \\\operatorname{SD}\mathopen{}\left(X\right)\mathclose{} \stackrel{\text{def}}{=}\sqrt{\operatorname{Var}\mathopen{}\left(X\right)\mathclose{}}\\

The standard deviation is on the same scale as \\X\\ itself (unlike the variance, which is on the scale of \\X\\’s square), which is why it is often the preferred measure of spread when reporting results.

> **NOTE:**
>
> **Example 8 (Precision and standard deviation of a fair coin flip)** In [Example 3](#exm-variance-bernoulli), a fair coin flip has \\\operatorname{Var}\mathopen{}\left(X\right)\mathclose{} = 1/4\\, so its precision is \\\tau(X) = 1 / (1/4) = 4\\ and its standard deviation is \\\operatorname{SD}\mathopen{}\left(X\right)\mathclose{} = \sqrt{1/4} = 1/2\\.

## 1.3 Covariance

> **NOTE:**
>
> **Definition 9 (Covariance)** For any two random variables \\X, Y\\:
>
> \\\operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{} \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[(X - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})(Y - \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})\right\]\mathclose{}\\

> **NOTE:**
>
> **Theorem 4 (Alternative formula for covariance)** \\\operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{}= \operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\\

> **NOTE:**
>
> *Proof*. By [linearity of expectation](expectation.llms.md#thm-linearity-expectation), analogous to the proof of the [simplified expression for variance](#thm-variance):
>
> \\ \begin{aligned} \operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{} &\stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})\right\]\mathclose{} && \text{(definition of covariance)} \\ &= \operatorname{E}\mathopen{}\left\[XY - X\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} - Y\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\right\]\mathclose{} && \text{(expand the product)} \\ &= \operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(linearity of expectation; } \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}, \operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} \text{ are constants)} \\ &= \operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(combine like terms)} \end{aligned} \\

> **NOTE:**
>
> **Example 9 (Covariance of a binary exposure and outcome)** For the joint PMF in [Example 4](#exm-cond-variance), \\\operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} = \operatorname{P}(X = 1, Y = 1) = 0.4\\, \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} = 0.5\\, and \\\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} = 0.7\\, so:
>
> \\ \begin{aligned} \operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{} &= \operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} - \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{} && \text{(alternative formula for covariance)} \\ &= 0.4 - 0.5 \cdot 0.7 && \text{(substitute)} \\ &= 0.05 && \text{(evaluate)} \end{aligned} \\

> **NOTE:**
>
> **Definition 10 (Conditional covariance)** The **conditional covariance** of \\Y\\ and \\Z\\ given \\X = x\\ is their covariance under their conditional distribution given \\X = x\\:
>
> \\\operatorname{Cov}\mathopen{}\left(Y,Z \mid X = x\right)\mathclose{} \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y-\operatorname{E}\mathopen{}\left\[Y \mid X = x\right\]\mathclose{}\right)\mathclose{}\mathopen{}\left(Z-\operatorname{E}\mathopen{}\left\[Z \mid X = x\right\]\mathclose{}\right)\mathclose{} \mid X = x\right\]\mathclose{}\\
>
> Evaluating this function of \\x\\ at \\X\\ gives the random variable \\\operatorname{Cov}\mathopen{}\left(Y,Z \mid X\right)\mathclose{}\\.

> **NOTE:**
>
> **Example 10 (Conditional covariance of a variable with itself)** Taking \\Z = Y\\ in [Definition 10](#def-cond-cov) gives the [conditional variance](#def-cond-variance): \\\operatorname{Cov}\mathopen{}\left(Y,Y \mid X = x\right)\mathclose{} = \operatorname{Var}\mathopen{}\left(Y \mid X = x\right)\mathclose{}\\. In [Example 4](#exm-cond-variance), for example, \\\operatorname{Cov}\mathopen{}\left(Y,Y \mid X = 0\right)\mathclose{} = 0.24\\.

> **NOTE:**
>
> **Theorem 5 (Law of total covariance)** For random variables \\X\\, \\Y\\, and \\Z\\ with \\\operatorname{E}\mathopen{}\left\[Y^2\right\]\mathclose{} \< \infty\\ and \\\operatorname{E}\mathopen{}\left\[Z^2\right\]\mathclose{} \< \infty\\:
>
> \\\operatorname{Cov}\mathopen{}\left(Y,Z\right)\mathclose{} = \operatorname{E}\mathopen{}\left\[\operatorname{Cov}\mathopen{}\left(Y,Z \mid X\right)\mathclose{}\right\]\mathclose{} + \operatorname{Cov}\mathopen{}\left(\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}, \operatorname{E}\mathopen{}\left\[Z \mid X\right\]\mathclose{}\right)\mathclose{}\\

> **NOTE:**
>
> *Proof*. The proof follows the proof of the [law of total variance](#thm-total-variance), which is the special case \\Z = Y\\. Write \\m_Y(X) \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}\\, \\m_Z(X) \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[Z \mid X\right\]\mathclose{}\\, \\\mu_Y \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\\, and \\\mu_Z \stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[Z\right\]\mathclose{}\\. Adding and subtracting \\m_Y(X)\\ and \\m_Z(X)\\ inside the deviations:
>
> \\ \begin{aligned} \operatorname{Cov}\mathopen{}\left(Y,Z\right)\mathclose{} &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left(Y - \mu_Y\right)\mathclose{}\mathopen{}\left(Z - \mu_Z\right)\mathclose{}\right\]\mathclose{} && \text{(definition of covariance)} \\ &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left(\mathopen{}\left\[Y - m_Y(X)\right\]\mathclose{} + \mathopen{}\left\[m_Y(X) - \mu_Y\right\]\mathclose{}\right)\mathclose{}\mathopen{}\left(\mathopen{}\left\[Z - m_Z(X)\right\]\mathclose{} + \mathopen{}\left\[m_Z(X) - \mu_Z\right\]\mathclose{}\right)\mathclose{}\right\]\mathclose{} && \text{(add and subtract)} \\ &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[Y - m_Y(X)\right\]\mathclose{}\mathopen{}\left\[Z - m_Z(X)\right\]\mathclose{}\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[Y - m_Y(X)\right\]\mathclose{}\mathopen{}\left\[m_Z(X) - \mu_Z\right\]\mathclose{}\right\]\mathclose{} \\&\quad + \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[m_Y(X) - \mu_Y\right\]\mathclose{}\mathopen{}\left\[Z - m_Z(X)\right\]\mathclose{}\right\]\mathclose{} + \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[m_Y(X) - \mu_Y\right\]\mathclose{}\mathopen{}\left\[m_Z(X) - \mu_Z\right\]\mathclose{}\right\]\mathclose{} && \text{(expand the product; linearity of expectation)} \end{aligned} \\
>
> The two middle terms are 0, by the same steps as the cross term in the proof of [Theorem 3](#thm-total-variance): condition on \\X\\, factor out the term that is constant given \\X\\, and use \\\operatorname{E}\mathopen{}\left\[Y - m_Y(X) \mid X\right\]\mathclose{} = 0\\ (or \\\operatorname{E}\mathopen{}\left\[Z - m_Z(X) \mid X\right\]\mathclose{} = 0\\). For the first term:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[Y - m_Y(X)\right\]\mathclose{}\mathopen{}\left\[Z - m_Z(X)\right\]\mathclose{}\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[\operatorname{E}\mathopen{}\left\[\mathopen{}\left\[Y - m_Y(X)\right\]\mathclose{}\mathopen{}\left\[Z - m_Z(X)\right\]\mathclose{} \mid X\right\]\mathclose{}\right\]\mathclose{} && \text{(law of iterated expectations)} \\ &= \operatorname{E}\mathopen{}\left\[\operatorname{Cov}\mathopen{}\left(Y,Z \mid X\right)\mathclose{}\right\]\mathclose{} && \text{(definition of conditional covariance)} \end{aligned} \\
>
> For the last term, the law of iterated expectations gives \\\operatorname{E}\mathopen{}\left\[m_Y(X)\right\]\mathclose{} = \mu_Y\\ and \\\operatorname{E}\mathopen{}\left\[m_Z(X)\right\]\mathclose{} = \mu_Z\\, so:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[m_Y(X) - \mu_Y\right\]\mathclose{}\mathopen{}\left\[m_Z(X) - \mu_Z\right\]\mathclose{}\right\]\mathclose{} &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left\[m_Y(X) - \operatorname{E}\mathopen{}\left\[m_Y(X)\right\]\mathclose{}\right\]\mathclose{}\mathopen{}\left\[m_Z(X) - \operatorname{E}\mathopen{}\left\[m_Z(X)\right\]\mathclose{}\right\]\mathclose{}\right\]\mathclose{} && \text{(substitute the means)} \\ &= \operatorname{Cov}\mathopen{}\left(m_Y(X), m_Z(X)\right)\mathclose{} && \text{(definition of covariance)} \\ &= \operatorname{Cov}\mathopen{}\left(\operatorname{E}\mathopen{}\left\[Y \mid X\right\]\mathclose{}, \operatorname{E}\mathopen{}\left\[Z \mid X\right\]\mathclose{}\right)\mathclose{} && \text{(definitions of } m_Y, m_Z \text{)} \end{aligned} \\
>
> Adding the four terms gives the result.

Alternate names include: the **covariance decomposition formula** and the **conditional covariance formula**.

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
> **Definition 11 (Variance/covariance of a \\p \times 1\\ random vector)** For a \\p \times 1\\ dimensional random vector \\\tilde{X}\\,
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(\tilde{X}\right)\mathclose{} &\stackrel{\text{def}}{=}\operatorname{Cov}\mathopen{}\left(\tilde{X}\right)\mathclose{} \\ &\stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[\mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{} {\mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{}}^{\top}\right\]\mathclose{} \end{aligned} \\

> **NOTE:**
>
> **Theorem 6 (Elements of the variance-covariance matrix are pairwise covariances)** For a \\p \times 1\\ random vector \\\tilde{X}= {(X_1, \ldots, X_p)}^{\top}\\, the \\(i,j)\\-th element of \\\operatorname{Var}\mathopen{}\left(\tilde{X}\right)\mathclose{}\\ is \\\operatorname{Cov}\mathopen{}\left(X_i, X_j\right)\mathclose{}\\:
>
> \\ \operatorname{Var}\mathopen{}\left(\tilde{X}\right)\mathclose{}= \begin{pmatrix} \operatorname{Var}\mathopen{}\left(X_1\right)\mathclose{} & \operatorname{Cov}\mathopen{}\left(X_1, X_2\right)\mathclose{} & \cdots & \operatorname{Cov}\mathopen{}\left(X_1, X_p\right)\mathclose{} \\ \operatorname{Cov}\mathopen{}\left(X_2, X_1\right)\mathclose{} & \operatorname{Var}\mathopen{}\left(X_2\right)\mathclose{} & \cdots & \operatorname{Cov}\mathopen{}\left(X_2, X_p\right)\mathclose{} \\ \vdots & \vdots & \ddots & \vdots \\ \operatorname{Cov}\mathopen{}\left(X_p, X_1\right)\mathclose{} & \operatorname{Cov}\mathopen{}\left(X_p, X_2\right)\mathclose{} & \cdots & \operatorname{Var}\mathopen{}\left(X_p\right)\mathclose{} \end{pmatrix} \\

> **NOTE:**
>
> *Proof*. Let \\\mu_i = \operatorname{E}\mathopen{}\left\[X_i\right\]\mathclose{}\\ for \\i = 1, \ldots, p\\, so \\\operatorname{E}\tilde{X}= {(\mu_1, \ldots, \mu_p)}^{\top}\\. By [Definition 11](#def-cov-vec-x):
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(\tilde{X}\right)\mathclose{} &= \operatorname{E}\mathopen{}\left\[ \mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{} {\mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{}}^{\top} \right\]\mathclose{} \\ &= \operatorname{E}\mathopen{}\left\[ \begin{pmatrix}X_1 - \mu_1 \\ \vdots \\ X_p - \mu_p\end{pmatrix} \begin{pmatrix}X_1 - \mu_1 & \cdots & X_p - \mu_p\end{pmatrix} \right\]\mathclose{} \\ &= \operatorname{E}\mathopen{}\left\[ \begin{pmatrix} (X_1 - \mu_1)(X_1 - \mu_1) & \cdots & (X_1 - \mu_1)(X_p - \mu_p) \\ \vdots & \ddots & \vdots \\ (X_p - \mu_p)(X_1 - \mu_1) & \cdots & (X_p - \mu_p)(X_p - \mu_p) \end{pmatrix} \right\]\mathclose{} \\ &= \begin{pmatrix} \operatorname{E}\mathopen{}\left\[(X_1 - \mu_1)(X_1 - \mu_1)\right\]\mathclose{} & \cdots & \operatorname{E}\mathopen{}\left\[(X_1 - \mu_1)(X_p - \mu_p)\right\]\mathclose{} \\ \vdots & \ddots & \vdots \\ \operatorname{E}\mathopen{}\left\[(X_p - \mu_p)(X_1 - \mu_1)\right\]\mathclose{} & \cdots & \operatorname{E}\mathopen{}\left\[(X_p - \mu_p)(X_p - \mu_p)\right\]\mathclose{} \end{pmatrix} \\ &= \begin{pmatrix} \operatorname{Cov}\mathopen{}\left(X_1, X_1\right)\mathclose{} & \cdots & \operatorname{Cov}\mathopen{}\left(X_1, X_p\right)\mathclose{} \\ \vdots & \ddots & \vdots \\ \operatorname{Cov}\mathopen{}\left(X_p, X_1\right)\mathclose{} & \cdots & \operatorname{Cov}\mathopen{}\left(X_p, X_p\right)\mathclose{} \end{pmatrix} \\ &= \begin{pmatrix} \operatorname{Var}\mathopen{}\left(X_1\right)\mathclose{} & \cdots & \operatorname{Cov}\mathopen{}\left(X_1, X_p\right)\mathclose{} \\ \vdots & \ddots & \vdots \\ \operatorname{Cov}\mathopen{}\left(X_p, X_1\right)\mathclose{} & \cdots & \operatorname{Var}\mathopen{}\left(X_p\right)\mathclose{} \end{pmatrix} \end{aligned} \\
>
> where:
>
> - the step from the third to fourth line uses the [expectation of a random matrix](expectation.llms.md#def-expectation-matrix),
> - the step from the fourth to fifth line uses [Definition 9](#def-cov), and
> - the last step uses [Lemma 1](#lem-cov-xx).

> **NOTE:**
>
> **Theorem 7 (Alternate expression for variance of a random vector)** \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(\tilde{X}\right)\mathclose{} &= \operatorname{E}\mathopen{}\left\[\tilde{X}{\tilde{X}}^{\top}\right\]\mathclose{} - \mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{} {\mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{}}^{\top} \end{aligned} \\

> **NOTE:**
>
> *Proof*. \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(\tilde{X}\right)\mathclose{} &= \operatorname{E}\mathopen{}\left\[ \mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{} {\mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{}}^{\top} \right\]\mathclose{} && \text{(definition)} \\ &= \operatorname{E}\mathopen{}\left\[ \tilde{X}{\tilde{X}}^{\top} - \tilde{X}{\mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{}}^{\top} - \mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{} {\tilde{X}}^{\top} + \mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{} {\mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{}}^{\top} \right\]\mathclose{} && \text{(expand the product)} \\ &= \operatorname{E}\mathopen{}\left\[\tilde{X}{\tilde{X}}^{\top}\right\]\mathclose{} - \mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{} {\mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{}}^{\top} - \mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{} {\mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{}}^{\top} + \mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{} {\mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{}}^{\top} && \text{(linearity, element-wise; } \operatorname{E}\tilde{X}\text{ is constant)} \\ &= \operatorname{E}\mathopen{}\left\[\tilde{X}{\tilde{X}}^{\top}\right\]\mathclose{} - \mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{} {\mathopen{}\left(\operatorname{E}\tilde{X}\right)\mathclose{}}^{\top} && \text{(combine like terms)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 8 (Variance of a linear combination)** For any vector of random variables \\\tilde{X}= (X_1, \ldots, X_n)\\ and corresponding vector of constants \\\tilde{a}= (a_1, \ldots, a_n)\\, the variance of their linear combination is:
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(\tilde{a}\cdot \tilde{X}\right)\mathclose{} &= \operatorname{Var}\mathopen{}\left(\sum\_{i=1}^na_i X_i\right)\mathclose{} \\ &= {\tilde{a}}^{\top} \operatorname{Var}\mathopen{}\left(\tilde{X}\right)\mathclose{} \tilde{a} \\ &= \sum\_{i=1}^n\sum\_{j=1}^n a_i a_j \operatorname{Cov}\mathopen{}\left(X_i,X_j\right)\mathclose{} \end{aligned} \\

> **NOTE:**
>
> *Proof*. Treat \\\tilde{a}\\ and \\\tilde{X}\\ as \\n \times 1\\ column vectors, so \\\tilde{a}\cdot \tilde{X}= {\tilde{a}}^{\top}\tilde{X}= \sum\_{i=1}^na_i X_i\\, a scalar. By linearity of expectation, \\\operatorname{E}\mathopen{}\left\[{\tilde{a}}^{\top}\tilde{X}\right\]\mathclose{} = {\tilde{a}}^{\top}\\\operatorname{E}\tilde{X}\\, so:
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left({\tilde{a}}^{\top}\tilde{X}\right)\mathclose{} &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left({\tilde{a}}^{\top}\tilde{X}- {\tilde{a}}^{\top}\operatorname{E}\tilde{X}\right)\mathclose{}^2\right\]\mathclose{} && \text{(definition of variance)} \\ &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left({\tilde{a}}^{\top}\mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{}\right)\mathclose{}^2\right\]\mathclose{} && \text{(factor out } {\tilde{a}}^{\top} \text{)} \\ &= \operatorname{E}\mathopen{}\left\[{\tilde{a}}^{\top}\mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{}{\mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{}}^{\top}\tilde{a}\right\]\mathclose{} && \text{(a scalar equals its transpose, so } s^2 = s\\{s}^{\top} \text{)} \\ &= {\tilde{a}}^{\top}\\\operatorname{E}\mathopen{}\left\[\mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{}{\mathopen{}\left(\tilde{X}- \operatorname{E}\tilde{X}\right)\mathclose{}}^{\top}\right\]\mathclose{}\\\tilde{a} && \text{(linearity of expectation, element-wise)} \\ &= {\tilde{a}}^{\top} \operatorname{Var}\mathopen{}\left(\tilde{X}\right)\mathclose{} \tilde{a} && \text{(variance of a random vector)} \\ &= \sum\_{i=1}^n\sum\_{j=1}^n a_i a_j \operatorname{Cov}\mathopen{}\left(X_i,X_j\right)\mathclose{} && \text{(expand the quadratic form, using the elements of } \operatorname{Var}\mathopen{}\left(\tilde{X}\right)\mathclose{} \text{)} \end{aligned} \\

> **NOTE:**
>
> **Corollary 1 (Variance of a sum of two random variables)** For any two random variables \\X\\ and \\Y\\ and scalars \\a\\ and \\b\\:
>
> \\\operatorname{Var}\mathopen{}\left(aX + bY\right)\mathclose{} = a^2 \operatorname{Var}\mathopen{}\left(X\right)\mathclose{} + b^2 \operatorname{Var}\mathopen{}\left(Y\right)\mathclose{} + 2(a \cdot b) \operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{}\\

> **NOTE:**
>
> *Proof*. Apply [Theorem 8](#thm-var-lincom) with \\n=2\\, \\X_1 = X\\, and \\X_2 = Y\\:
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(aX+bY\right)\mathclose{} &= a^2 \operatorname{Var}\mathopen{}\left(X\right)\mathclose{} + b^2 \operatorname{Var}\mathopen{}\left(Y\right)\mathclose{} + 2ab \operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{} \end{aligned} \\
>
> Alternatively, by linearity of expectation:
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(aX+bY\right)\mathclose{} &\stackrel{\text{def}}{=}\operatorname{E}\mathopen{}\left\[\mathopen{}\left(aX+bY - \operatorname{E}\mathopen{}\left\[aX+bY\right\]\mathclose{}\right)\mathclose{}^2\right\]\mathclose{} && \text{(definition of variance)} \\ &= \operatorname{E}\mathopen{}\left\[\mathopen{}\left(a(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}) + b(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})\right)\mathclose{}^2\right\]\mathclose{} && \text{(linearity of expectation)} \\ &= \operatorname{E}\mathopen{}\left\[a^2(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})^2 + 2(a \cdot b)(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}) + b^2(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})^2\right\]\mathclose{} && \text{(expand the square)} \\ &= a^2\operatorname{E}\mathopen{}\left\[(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})^2\right\]\mathclose{} + 2(a \cdot b)\operatorname{E}\mathopen{}\left\[(X-\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{})(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})\right\]\mathclose{} + b^2\operatorname{E}\mathopen{}\left\[(Y-\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{})^2\right\]\mathclose{} && \text{(linearity of expectation)} \\ &= a^2 \operatorname{Var}\mathopen{}\left(X\right)\mathclose{} + 2(a \cdot b) \operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{} + b^2 \operatorname{Var}\mathopen{}\left(Y\right)\mathclose{} && \text{(definitions of variance and covariance)} \end{aligned} \\

This corollary is why two variables’ covariance matters for combining them: if \\X\\ and \\Y\\ are [independent](independence.llms.md#def-indpt), \\\operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{}=0\\ and the variance of their sum is just the sum of their variances. The first claim follows from the [joint-distribution form of Fubini–Tonelli](expectation.llms.md#cor-fubini-joint): for independent \\X\\ and \\Y\\ the joint density or PMF factors, so \\\operatorname{E}\mathopen{}\left\[XY\right\]\mathclose{} = \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}\operatorname{E}\mathopen{}\left\[Y\right\]\mathclose{}\\, and [Theorem 4](#thm-alt-cov) gives \\\operatorname{Cov}\mathopen{}\left(X,Y\right)\mathclose{} = 0\\.

# References

Back to top
