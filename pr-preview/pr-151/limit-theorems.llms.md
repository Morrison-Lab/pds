# Limit theorems

Code

- [Show All Code](javascript:void(0))

- [Hide All Code](javascript:void(0))

- 

  ------------------------------------------------------------------------

- [View Source](javascript:void(0))

Published

Last modified: 2026-10-14 19:36:47 (PDT)

## 1 The Central Limit Theorem

> **NOTE:**
>
> *Remark*. The sum of many independent random variables, none of which dominates the others, has a distribution that is approximately bell-shaped, whatever the distributions of the individual variables. [Theorem 1](#thm-clt) makes this precise.

> **NOTE:**
>
> **Theorem 1 (Central Limit Theorem)** Let \\X_1, X_2, \ldots\\ be [IID](independence.llms.md#def-iid) random variables with mean \\\mu\\ and finite variance \\\sigma^2\> 0\\, and let \\S_n \stackrel{\text{def}}{=}\sum\_{i=1}^nX_i\\. Then for every real number \\z\\:
>
> \\ \lim\_{n \to \infty} \Pr\mathopen{}\left(\frac{S_n - n\mu}{\sigma\sqrt{n}} \le z\right)\mathclose{} = \Phi(z) \\
>
> where \\\Phi(z) \stackrel{\text{def}}{=}\int\_{-\infty}^{z} \frac{1}{\sqrt{2\pi}} \text{e}^{-u^2/2}\\du\\ is the CDF of the [standard normal distribution](random-variables.llms.md#def-std-normal) \\\operatorname{N}\mathopen{}\left(0, 1\right)\mathclose{}\\.

> **NOTE:**
>
> *Remark*. This version is the Lindeberg–Lévy CLT; its proof is beyond these notes’ scope ([Billingsley 1995](#ref-billingsley1995probability), Theorem 27.1). Other versions relax the IID assumption, which is why the informal statement asks only that no summand dominate.

> **NOTE:**
>
> **Corollary 1 (Mean and variance of a sum of IID random variables)** Let \\X_1, \ldots, X_n\\ be [IID](independence.llms.md#def-iid) random variables, each discrete or continuous, with mean \\\mu\\ and finite variance \\\sigma^2\\, and let \\S_n \stackrel{\text{def}}{=}\sum\_{i=1}^nX_i\\. Then:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[S_n\right\]\mathclose{} &= n\mu\\ \operatorname{Var}\mathopen{}\left(S_n\right)\mathclose{} &= n\sigma^2 \end{aligned} \\

> **NOTE:**
>
> *Proof*. For the mean, apply [linearity of expectation](expectation.llms.md#thm-linearity-expectation) once per added summand:
>
> \\ \begin{aligned} \operatorname{E}\mathopen{}\left\[S_n\right\]\mathclose{} &= \sum\_{i=1}^n\operatorname{E}\mathopen{}\left\[X_i\right\]\mathclose{} && \text{(linearity of expectation, applied } n - 1 \text{ times)} \\ &= n\mu && \text{(each } X_i \text{ has mean } \mu\text{)} \end{aligned} \\
>
> For the variance, apply the [variance of a linear combination](variance-covariance.llms.md#thm-var-lincom) with every \\a_i = 1\\. For \\i \ne j\\, \\X_i\\ and \\X_j\\ are independent (take \\A_k = \mathbb{R}\\ for every other \\k\\ in the [definition of independence](independence.llms.md#def-indpt)), so \\\operatorname{Cov}\mathopen{}\left(X_i, X_j\right)\mathclose{} = 0\\ for [independent summands](variance-covariance.llms.md#thm-indpt-uncorrelated); and \\\operatorname{Cov}\mathopen{}\left(X_i, X_i\right)\mathclose{} = \operatorname{Var}\mathopen{}\left(X_i\right)\mathclose{}\\ ([covariance of a variable with itself](variance-covariance.llms.md#lem-cov-xx)):
>
> \\ \begin{aligned} \operatorname{Var}\mathopen{}\left(S_n\right)\mathclose{} &= \sum\_{i=1}^n\sum\_{j=1}^n \operatorname{Cov}\mathopen{}\left(X_i, X_j\right)\mathclose{} && \text{(variance of a linear combination, all } a_i = 1 \text{)} \\ &= \sum\_{i=1}^n\operatorname{Cov}\mathopen{}\left(X_i, X_i\right)\mathclose{} + \sum\_{\substack{i, j = 1 \\ i \ne j}}^n \operatorname{Cov}\mathopen{}\left(X_i, X_j\right)\mathclose{} && \text{(split off the terms with } i = j \text{)} \\ &= \sum\_{i=1}^n\operatorname{Var}\mathopen{}\left(X_i\right)\mathclose{} + 0 && \text{(covariance with itself; independent summands)} \\ &= n\sigma^2 && \text{(each } X_i \text{ has variance } \sigma^2\text{)} \end{aligned} \\

> **NOTE:**
>
> *Remark*. In practice, [Theorem 1](#thm-clt) justifies approximating \\S_n\\ by a normal distribution with mean \\n\mu\\ and variance \\n\sigma^2\\, which by [Corollary 1](#cor-sum-iid-moments) are exactly the mean and variance of \\S_n\\.

> **NOTE:**
>
> **Example 1 (The sum of five dice)** A single fair die roll has the discrete uniform distribution on \\\mathopen{}\left\\1, \ldots, 6\right\\\mathclose{}\\, which is flat, not bell-shaped ([Figure 1](#fig-clt-1d6)). Its mean is \\\mu= 3.5\\, and its variance is
>
> \\ \begin{aligned} \sigma^2&= \sum\_{x=1}^{6} (x - 3.5)^2 / 6 \\ &= 35/12. \end{aligned} \\
>
> Show code
>
> ``` r
> dice_sum_pmf <- function(n_dice) {
>   totals <- rowSums(expand.grid(rep(list(1:6), n_dice)))
>   probs <- prop.table(table(totals))
>   tibble::tibble(total = as.numeric(names(probs)), p = as.vector(probs))
> }
>
> dice_plot <-
>   ggplot2::ggplot(mapping = ggplot2::aes(x = total, y = p)) +
>   ggplot2::xlab("sum of dice (x)") +
>   ggplot2::ylab("Probability of outcome, Pr(X=x)") +
>   ggplot2::expand_limits(y = 0)
>
> dice_plot + ggplot2::geom_col(data = dice_sum_pmf(1))
> ```
>
> > **NOTE:**
> >
> > [![](limit-theorems_files/figure-html/fig-clt-1d6-1.png)](limit-theorems_files/figure-html/fig-clt-1d6-1.png "Figure 1: Distribution of the outcome of one die")
> >
> > Figure 1: Distribution of the outcome of one die
>
> The sum of five independent rolls, \\S_5\\, is already close to bell-shaped ([Figure 2](#fig-clt-5d6)).
>
> Show code
>
> ``` r
> pmf_five_dice <- dice_sum_pmf(5)
> dice_plot + ggplot2::geom_col(data = pmf_five_dice)
> ```
>
> > **NOTE:**
> >
> > [![](limit-theorems_files/figure-html/fig-clt-5d6-1.png)](limit-theorems_files/figure-html/fig-clt-5d6-1.png "Figure 2: Distribution of the sum of five dice")
> >
> > Figure 2: Distribution of the sum of five dice
>
> For example, the exact probability that five dice total at most 15 is \\\Pr(S_5 \le 15) = 0.3052\\. The normal approximation that [Theorem 1](#thm-clt) suggests, with mean \\5 \cdot 3.5 = 17.5\\ and variance \\5 \cdot 35/12 \approx 14.58\\, evaluated at \\15.5\\ to account for \\S_5\\ taking only integer values, gives \\\Phi\mathopen{}\left((15.5 - 17.5)/\sqrt{14.58}\right)\mathclose{} \approx 0.3002\\.

> **NOTE:**
>
> **Example 2 (Sample means of car horsepower)** The Auto data record the horsepower and fuel economy of 392 car models sold between 1970 and 1982. They come from the StatLib library at Carnegie Mellon University and ship with the book *An Introduction to Statistical Learning*, in the Python package [`ISLP`](https://islp.readthedocs.io/) (`ISLP.load_data("Auto")`) and the R package [`ISLR2`](https://cran.r-project.org/package=ISLR2) (`ISLR2::Auto`). This site has a copy at [`data/auto.csv`](data/auto.csv), and both code tabs below read that file.
>
> Horsepower is not bell-shaped: a few powerful cars give it a long right tail. To apply [Theorem 1](#thm-clt), treat each draw of one car at random as one IID observation \\X_i\\, so that \\\mu\\ and \\\sigma^2\\ are the mean and variance of the 392 horsepower values. The sum \\S_n\\ has mean \\n\mu\\ and variance \\n\sigma^2\\ by [Corollary 1](#cor-sum-iid-moments), so the sample mean \\S_n/n\\ has mean \\\mu\\ and standard deviation \\\sigma/\sqrt{n}\\. The code below draws 10,000 random samples of each size \\n \in \mathopen{}\left\\1, 5, 30\right\\\mathclose{}\\, with replacement, and computes each sample’s mean.
>
> ## Python
>
> ``` python
> import numpy as np
> import pandas as pd
>
> hp = pd.read_csv("data/auto.csv")["horsepower"].to_numpy(dtype=float)
> mu, sigma = hp.mean(), hp.std(ddof=0)
>
> rng = np.random.default_rng(571)
> sizes = [1, 5, 30]
> sample_means = {n: rng.choice(hp, size=(10_000, n)).mean(axis=1) for n in sizes}
>
> def skewness(x):
>     return np.mean(((x - x.mean()) / x.std()) ** 3)
>
> pd.DataFrame({
>     "n": sizes,
>     "sd of sample means": [sample_means[n].std(ddof=1) for n in sizes],
>     "sigma / sqrt(n)": [sigma / np.sqrt(n) for n in sizes],
>     "skewness of sample means": [skewness(sample_means[n]) for n in sizes],
> })
> #>     n  sd of sample means  sigma / sqrt(n)  skewness of sample means
> #> 0   1           38.691521        38.442033                  1.080767
> #> 1   5           17.265666        17.191800                  0.522243
> #> 2  30            6.971269         7.018523                  0.164940
> ```
>
> ## R
>
> ``` r
> hp <- read.csv("data/auto.csv")$horsepower
> mu <- mean(hp)
> sigma <- sqrt(mean((hp - mu)^2))
>
> set.seed(571)
> sizes <- c(1, 5, 30)
> sample_means <- lapply(sizes, function(n) {
>   replicate(10000, mean(sample(hp, n, replace = TRUE)))
> })
>
> skewness <- function(x) mean(((x - mean(x)) / sqrt(mean((x - mean(x))^2)))^3)
>
> data.frame(
>   n = sizes,
>   sd_of_sample_means = sapply(sample_means, sd),
>   sigma_over_root_n = sigma / sqrt(sizes),
>   skewness_of_sample_means = sapply(sample_means, skewness)
> )
> ```
>
> [Figure 3](#fig-clt-auto) shows a histogram of the 10,000 sample means for each \\n\\, with the normal density \\\operatorname{N}\mathopen{}\left(\mu, \sigma^2/n\right)\mathclose{}\\ from [Theorem 1](#thm-clt) drawn over it.
>
> Show code
>
> ``` r
> n_labels <- paste("n =", sizes)
> means_long <- tibble::tibble(
>   n = factor(
>     rep(n_labels, each = length(sample_means[[1]])),
>     levels = n_labels
>   ),
>   sample_mean = unlist(sample_means)
> )
> normal_curves <- seq_along(sizes) |>
>   lapply(function(k) {
>     se <- sigma / sqrt(sizes[k])
>     grid <- seq(mu - 4 * se, mu + 4 * se, length.out = 200)
>     tibble::tibble(
>       n = factor(n_labels[k], levels = n_labels),
>       sample_mean = grid,
>       density = dnorm(grid, mu, se)
>     )
>   }) |>
>   dplyr::bind_rows()
>
> ggplot2::ggplot(means_long, ggplot2::aes(x = sample_mean)) +
>   ggplot2::geom_histogram(
>     ggplot2::aes(y = ggplot2::after_stat(density)),
>     bins = 40,
>     fill = "grey70",
>     color = "white"
>   ) +
>   ggplot2::geom_line(
>     ggplot2::aes(y = density),
>     data = normal_curves,
>     linewidth = 1
>   ) +
>   ggplot2::facet_wrap(ggplot2::vars(n), scales = "free") +
>   ggplot2::labs(x = "sample mean of horsepower", y = "density") +
>   ggplot2::theme_minimal()
> ```
>
> > **NOTE:**
> >
> > [![Three histograms side by side. The first, for one car, is skewed to the right with a long tail. The second, for five cars, is less skewed. The third, for thirty cars, is symmetric and bell-shaped. A normal curve drawn over each fits the third closely and the first poorly.](limit-theorems_files/figure-html/fig-clt-auto-1.png)](limit-theorems_files/figure-html/fig-clt-auto-1.png "Figure 3: Histograms of 10,000 sample means of horsepower, for samples of n = 1, 5 and 30 cars drawn with replacement from the Auto data. The curve is the normal density with mean mu and standard deviation sigma over the square root of n.")
> >
> > Figure 3: Histograms of 10,000 sample means of horsepower, for samples of n = 1, 5 and 30 cars drawn with replacement from the Auto data. The curve is the normal density with mean mu and standard deviation sigma over the square root of n.
>
> The sample means for \\n = 1\\ are just single cars, so they are skewed. By \\n = 30\\ the histogram is close to the normal curve. The standard deviation of the sample means is within 1.2% of \\\sigma/\sqrt{n}\\ at every \\n\\, as [Corollary 1](#cor-sum-iid-moments) predicts. The skewness of the sample means, which is zero for a normal distribution, falls from 1.07 at \\n = 1\\ to 0.48 at \\n = 5\\ and 0.2 at \\n = 30\\.

> **NOTE:**
>
> 5MinuteAI explains [limit theorems](https://www.youtube.com/watch?v=6sQv1o-ttCw) and gives a [proof of the CLT](https://www.youtube.com/watch?v=-EI96KIYGWw), following the University of Washington’s CSE 312 ([5MinuteAI, n.d.](#ref-fiveminuteai_probstat)).

## 2 Tail bounds

> **NOTE:**
>
> **Theorem 2 (Markov’s inequality)** Let \\X\\ be a random variable with \\X \ge 0\\ and \\\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} \< \infty\\. Then for every \\a \> 0\\:
>
> \\ \Pr\mathopen{}\left(X \ge a\right)\mathclose{} \le \frac{\operatorname{E}\mathopen{}\left\[X\right\]\mathclose{}}{a} \\

> **NOTE:**
>
> *Proof*. Because \\X \ge 0\\, every outcome satisfies \\X \ge a \cdot \mathbb{1}\_{\mathopen{}\left\\X \ge a\right\\\mathclose{}}\\: when \\X \ge a\\ the right side is \\a \le X\\, and otherwise it is \\0 \le X\\. The expectation of a nonnegative random variable is nonnegative, so by [linearity of expectation](expectation.llms.md#thm-linearity-expectation), and because the expectation of an indicator is the probability of its event,
>
> \\ \operatorname{E}\mathopen{}\left\[X\right\]\mathclose{} - a \cdot \Pr\mathopen{}\left(X \ge a\right)\mathclose{} = \operatorname{E}\mathopen{}\left\[X - a \cdot \mathbb{1}\_{\mathopen{}\left\\X \ge a\right\\\mathclose{}}\right\]\mathclose{} \ge 0 \\
>
> and dividing by \\a \> 0\\ gives the claim.

> **NOTE:**
>
> *Remark*. The inequality carries Markov’s name by convention. Chebyshev’s inequality, which follows from it, is older ([Bienaymé 1853](#ref-bienayme1853); [Tchébychef 1867](#ref-tchebichef1867)); see ([Seneta 2013](#ref-seneta2013)) for the history of the attribution. A modern treatment is in ([Blitzstein and Hwang 2019](#ref-blitzstein2019introduction)).

> **NOTE:**
>
> **Theorem 3 (Chebyshev’s inequality)** Let \\X\\ be a random variable with mean \\\mu\\ and finite variance \\\sigma^2\> 0\\. Then for every \\k \> 0\\:
>
> \\ \Pr\mathopen{}\left(\mathopen{}\left\|X - \mu\right\|\mathclose{} \ge k\sigma\right)\mathclose{} \le \frac{1}{k^2} \\

> **NOTE:**
>
> *Proof*. The random variable \\(X - \mu)^2\\ is nonnegative, and its expectation is \\\sigma^2\\. Because \\\mathopen{}\left\|X - \mu\right\|\mathclose{} \ge k\sigma\\ exactly when \\(X - \mu)^2 \ge k^2\sigma^2\\, [Theorem 2](#thm-markov) gives
>
> \\ \Pr\mathopen{}\left(\mathopen{}\left\|X - \mu\right\|\mathclose{} \ge k\sigma\right)\mathclose{} = \Pr\mathopen{}\left((X - \mu)^2 \ge k^2\sigma^2\right)\mathclose{} \le \frac{\sigma^2}{k^2\sigma^2} = \frac{1}{k^2} \\

> **NOTE:**
>
> *Remark*. [Theorem 3](#thm-chebyshev) needs only a mean and a variance, not a distribution, so it holds for every distribution that has them. That generality makes it loose: for a normal distribution, the chance of landing more than two standard deviations from the mean is about 5%, but the bound at \\k = 2\\ is 25%.

> **NOTE:**
>
> *Remark*. Bienaymé derived this bound in 1853 ([Bienaymé 1853](#ref-bienayme1853)), and Chebyshev proved a more general form in 1867 ([Tchébychef 1867](#ref-tchebichef1867)). A modern treatment is in ([Blitzstein and Hwang 2019](#ref-blitzstein2019introduction)).

> **NOTE:**
>
> **Example 3 (How loose is Chebyshev’s bound for car horsepower?)** Take the 392 horsepower values in the Auto data described in [Example 2](#exm-clt-auto) as the whole population, and draw one car at random. For each \\k\\, the code below counts the share of cars whose horsepower is at least \\k\\ standard deviations from the mean, and sets it beside the bound \\1/k^2\\ from [Theorem 3](#thm-chebyshev).
>
> ``` r
> hp <- read.csv("data/auto.csv")$horsepower
> mu <- mean(hp)
> sigma <- sqrt(mean((hp - mu)^2))
>
> k <- c(1.5, 2, 3)
> share_beyond <- sapply(k, function(kk) mean(abs(hp - mu) >= kk * sigma))
> data.frame(k = k, share_of_cars = share_beyond, chebyshev_bound = 1 / k^2)
> ```
>
> The bound holds at every \\k\\, as [Theorem 3](#thm-chebyshev) guarantees. At \\k = 2\\ the share of cars is 4.3%, against a bound of 25%, and at \\k = 3\\ it is 1.3% against 11.1%. The bound is loose because it must hold for every distribution with this mean and variance.

> **NOTE:**
>
> **Exercise 1 (How many cars to estimate average fuel economy)** Let \\X_1, \ldots, X_n\\ be [IID](independence.llms.md#def-iid) draws of the fuel economy (`mpg`) of a car chosen at random from the Auto data, with mean \\\mu\\ and variance \\\sigma^2\\, and let \\\bar X_n \stackrel{\text{def}}{=}\frac{1}{n}\sum\_{i=1}^nX_i\\.
>
> 1.  Use [Corollary 1](#cor-sum-iid-moments) and [Theorem 3](#thm-chebyshev) to show that for every \\\epsilon \> 0\\,
>
>     \\ \Pr\mathopen{}\left(\mathopen{}\left\|\bar X_n - \mu\right\|\mathclose{} \ge \epsilon\right)\mathclose{} \le \frac{\sigma^2}{n\epsilon^2} \\
>
> 2.  Compute \\\sigma^2\\ for the `mpg` column of [`data/auto.csv`](data/auto.csv), treating the 392 cars as the whole population. Find the smallest \\n\\ for which the bound in (a) guarantees \\\Pr\mathopen{}\left(\mathopen{}\left\|\bar X_n - \mu\right\|\mathclose{} \ge 1\right)\mathclose{} \le 0.05\\.
>
> 3.  Simulate 10,000 samples of that size drawn with replacement, and count how many sample means miss \\\mu\\ by 1 or more. Why is the count so far below the 5% the bound allows?

> **NOTE:**
>
> *Solution 1*.
>
> 1.  By [Corollary 1](#cor-sum-iid-moments), \\\operatorname{Var}\mathopen{}\left(S_n\right)\mathclose{} = n\sigma^2\\ for \\S_n \stackrel{\text{def}}{=}\sum\_{i=1}^nX_i\\, so \\\bar X_n = S_n/n\\ has mean \\\mu\\ and variance \\\sigma^2/n\\ (a constant factor \\c\\ scales a variance by \\c^2\\). Apply [Theorem 3](#thm-chebyshev) to \\\bar X_n\\ with \\k\sigma/\sqrt{n} = \epsilon\\, that is, \\k = \epsilon\sqrt{n}/\sigma\\, so \\1/k^2 = \sigma^2/(n\epsilon^2)\\.
>
> 2.  Setting \\\sigma^2/(n \cdot 1^2) \le 0.05\\ gives \\n \ge 20\sigma^2\\.
>
> 3.  See the code below.
>
> ``` r
> mpg <- read.csv("data/auto.csv")$mpg
> mu <- mean(mpg)
> sigma2 <- mean((mpg - mu)^2)
> n_min <- ceiling(20 * sigma2)
>
> set.seed(571)
> xbar <- replicate(10000, mean(sample(mpg, n_min, replace = TRUE)))
> misses <- sum(abs(xbar - mu) >= 1)
> normal_approx <- 2 * pnorm(-1 / sqrt(sigma2 / n_min))
> c(variance = sigma2, n = n_min, misses = misses, normal_approx = normal_approx)
> #>      variance             n        misses normal_approx 
> #>  6.076274e+01  1.216000e+03  0.000000e+00  7.694705e-06
> ```
>
> The population variance of `mpg` is 60.8, so \\n = 1216\\ cars suffice. Out of 10,000 samples of that size, 0 sample means missed \\\mu\\ by 1 or more, against the 5% (500 samples) the bound allows. The bound is loose because the sample mean of this many cars is nearly normal ([Theorem 1](#thm-clt)), and the normal approximation puts the chance of a miss at about 7.7^{-6}; Chebyshev’s inequality must hold for every distribution, as in [Example 3](#exm-chebyshev-auto).

## References

5MinuteAI. n.d. *Probability & Statistics*. Video playlist on YouTube. Accessed October 12, 2026. <https://www.youtube.com/playlist?list=PLeB45KifGiuHesi4PALNZSYZFhViVGQJK>.

Bienaymé, Irénée-Jules. 1853. “Considérations à l’appui de La Découverte de Laplace Sur La Loi de Probabilité Dans La Méthode Des Moindres Carrés.” *Comptes Rendus de l’Académie Des Sciences* 37: 309–24. <https://www.numdam.org/item/JMPA_1867_2_12__158_0/>.

Billingsley, Patrick. 1995. *Probability and Measure*. 3rd ed. Wiley Series in Probability and Mathematical Statistics. Wiley.

Blitzstein, Joseph K, and Jessica Hwang. 2019. *Introduction to Probability*. 2nd ed. Chapman; Hall/CRC. <https://doi.org/10.1201/9780429428357>.

Seneta, Eugene. 2013. “A Tricentenary History of the Law of Large Numbers.” *Bernoulli* 19 (4): 1088–121. <https://doi.org/10.3150/12-BEJSP12>.

Tchébychef, P. L. 1867. “Des Valeurs Moyennes.” *Journal de Mathématiques Pures Et Appliquées*, 2nd series, vol. 12: 177–84. <https://www.numdam.org/item/JMPA_1867_2_12__177_0/>.

Back to top
