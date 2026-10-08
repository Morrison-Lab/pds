# Probability for Data Science

Code

Published

Last modified: 2026-10-07 20:19:59 (PDT)

## Welcome

Probability theory is the branch of mathematics concerned with formalizing and quantifying uncertainty. It is the foundation on which statistical inference is built: before we can reason about what data tell us about the world, we need a precise language for describing random phenomena.

These notes collect the probability that data science courses assume. Some key results are listed here, organized by topic:

- [Notation](notation.llms.md)
- [Probability basics](probability-basics.llms.md): sample spaces and events, probability axioms, conditional probability, and Bayes’ theorem
- [Random variables](random-variables.llms.md): PMF, PDF, CDF, quantile function, and survival, hazard, and cumulative hazard functions
- [Independence](independence.llms.md): independence, conditional independence, and (conditionally) IID random variables
- [Expectation](expectation.llms.md): expectation, LOTUS, conditional expectation, Fubini-Tonelli, and the law of iterated expectations
- [Variance and covariance](variance-covariance.llms.md): deviation, variance, conditional variance, homoskedasticity, and covariance
- [Key distributions](distributions.llms.md): Bernoulli, Poisson, negative binomial, and Weibull distributions
- [Limit theorems](limit-theorems.llms.md): the Central Limit Theorem

Most of this material should be review from an introductory probability or mathematical statistics course (e.g., UC Davis’s Epi 202). These notes began as the probability chapter of the Morrison Lab’s [*Regression Models for Epidemiology*](https://morrison-lab.github.io/rme/), which applies them to regression and survival models (see [Additional resources](#sec-additional-resources)).

## Using these notes in another site

Course sites link to these pages by URL; they do not include this repository as a git submodule. A host site that keeps a copy of this repository at its root, named `pds`, can still include fragments with paths that start with `pds/`, for example `{{< include pds/_subfiles/_thm-bayes.qmd >}}`. This site includes its own fragments the same way, through a `pds` symlink that points at the repository root.

Quarto resolves `@id` cross-references only within one rendered page, so a host site that links to a result here uses an explicit link, `[text](expectation.qmd#thm-lotus)`.

## Additional resources

### Comparable courses

Several universities offer open-access courses with comparable or complementary coverage of probability for data science, computer science, and statistics:

- **Stanford University CS 109**: [*Probability for Computer Scientists*](https://web.stanford.edu/class/cs109/) (Chris Piech, Mehran Sahami, and David Varodayan) introduces counting, probability axioms, random variables, joint distributions, limit theorems, and machine learning applications.
- **Stanford University STATS 116**: [*Theory of Probability*](https://web.stanford.edu/class/stats116/) (John Duchi) provides a rigorous mathematical treatment of probability spaces, conditioning, random variables, transform methods, and limit theorems (see also [lecture notes](https://adembo.su.domains/math-136/nnotes.pdf) by Amir Dembo).
- **UC Berkeley Data 140 / Stat 140**: [*Probability for Data Science*](https://data140.org/textbook/) (Ani Adhikari and Jim Pitman) blends mathematical probability theory with Python simulations and computational data science applications.
- **Harvard University Stat 110**: [*Introduction to Probability*](https://www.youtube.com/playlist?list=PL2SOU6wwxF0uwwH80KTQ6ht66KWxbzTIo) (Joseph K. Blitzstein; companion textbook Blitzstein and Hwang ([2019](#ref-blitzstein2019introduction)), online at [probabilitybook.net](https://www.probabilitybook.net)) covers conditioning, distributions, transform methods, and Markov chains with an emphasis on intuitive storytelling.
- **MIT 18.05**: [*Introduction to Probability and Statistics*](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2022/) (Jeremy Orloff and Jonathan Bloom, MIT OpenCourseWare) bridges probability, discrete and continuous random variables, and both Bayesian and frequentist statistical inference.
- **MIT 6.041 / 6.431**: [*Probabilistic Systems Analysis and Applied Probability*](https://ocw.mit.edu/courses/6-041-probabilistic-systems-analysis-and-applied-probability-fall-2010/) (John Tsitsiklis, MIT OpenCourseWare) covers probability spaces, conditioning, independence, transform methods, and Bernoulli and Poisson processes.
- **Cal Poly / Kevin Ross**: [*An Introduction to Probability and Simulation*](https://bookdown.org/kevin_davisross/probsim-book/) (Ross ([2022](#ref-ross-probsim))) develops probability concepts through simulation in R and Python, providing intuitive frameworks including conditioning as “slicing and renormalizing” and “taking out what is known” in conditional expectation.

### Textbooks and companion notes

- Miller ([2017](#ref-problifesaver))
- Blitzstein and Hwang ([2019](#ref-blitzstein2019introduction))
- Hastie et al. ([2009](#ref-hastie2009elements))
- James et al. ([2021](#ref-james2021islr2e))
- Amir Dembo and Kevin Ross, [*Stochastic Processes*](https://adembo.su.domains/math-136/nnotes.pdf) lecture notes (Dembo and Ross ([2021](#ref-dembo-notes)), Stanford MATH 136 / STAT 219)
- Morrison Lab’s [*Regression Models for Epidemiology*](https://morrison-lab.github.io/rme/), which applies this material to regression and survival analysis

## References

Blitzstein, Joseph K, and Jessica Hwang. 2019. *Introduction to Probability*. 2nd ed. Chapman; Hall/CRC. <https://doi.org/10.1201/9780429428357>.

Dembo, Amir, and Kevin Ross. 2021. *Stochastic Processes*. Stanford University. <https://adembo.su.domains/math-136/nnotes.pdf>.

Hastie, Trevor, Robert Tibshirani, and Jerome Friedman. 2009. *The Elements of Statistical Learning: Data Mining, Inference, and Prediction*. 2nd ed. Springer. <https://doi.org/10.1007/978-0-387-84858-7>.

James, Gareth, Daniela Witten, Trevor Hastie, and Robert Tibshirani. 2021. *An Introduction to Statistical Learning: With Applications in R*. 2nd ed. Springer. <https://doi.org/10.1007/978-1-0716-1418-1>.

Miller, Steven J. 2017. *The Probability Lifesaver: All the Tools You Need to Understand Chance*. A Princeton Lifesaver Study Guide. Princeton University Press. <https://doi.org/10.1515/9781400885381>.

Ross, Kevin. 2022. *An Introduction to Probability and Simulation*. Bookdown. <https://bookdown.org/kevin_davisross/probsim-book/>.

Back to top
