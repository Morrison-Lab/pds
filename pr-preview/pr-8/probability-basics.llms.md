# Probability basics

Code

Published

Last modified: 2026-09-28 00:54:47 (PDT)

# 1 Core properties of probabilities

## 1.1 Defining probabilities

> **NOTE:**
>
> **Definition 1 (Sample space)** The **sample space** of a random experiment, denoted \\\Omega\\, is the set of all of its possible outcomes.

> **NOTE:**
>
> **Example 1 (Sample space of a die roll)** Rolling a six-sided die once has sample space \\\Omega = \mathopen{}\left\\1, 2, 3, 4, 5, 6\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 2 (Event)** An **event** is a subset of the [sample space](#def-sample-space) \\\Omega\\: a set of outcomes. An event \\A\\ **occurs** when the experiment’s outcome is in \\A\\.

We write \\\neg A\\ for the **complement** of \\A\\, the event that \\A\\ does not occur: \\\neg A \stackrel{\text{def}}{=}\Omega \setminus A\\. Other sources write \\A^c\\ or \\\bar{A}\\. When \\\Omega\\ is uncountable, such as an interval of real numbers, only the subsets in a designated collection \\\mathscr{S}\\ (a [\\\sigma\\-algebra](https://en.wikipedia.org/wiki/%CE%A3-algebra): a collection that contains \\\Omega\\ and is closed under complements and countable unions) count as events; every set that arises in these notes is in \\\mathscr{S}\\.

> **NOTE:**
>
> **Example 2 (Rolling an even number)** In [Example 1](#exm-sample-space), the event “the roll is even” is \\A = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, and its complement is \\\neg A = \mathopen{}\left\\1, 3, 5\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 3 (Probability measure)** A **probability measure** on a [sample space](#def-sample-space) \\\Omega\\, often denoted \\\Pr()\\ or \\\operatorname{P}()\\, is a function that assigns a number \\\Pr(A)\\ to each [event](#def-event) \\A\\ and satisfies:
>
> 1.  For any event \\A\\, \\\Pr(A) \ge 0\\.
> 2.  The probability of the whole sample space is 1: \\\Pr(\Omega) = 1\\
> 3.  For countably many mutually disjoint events \\A_1, A_2, \ldots\\ (where \\A_i \cap A_j = \emptyset\\ for all \\i \neq j\\), the probability of their union is the sum of their probabilities (*countable additivity*): \\\Pr\\\left(\bigcup\_{i=1}^{\infty} A_i\right) = \sum\_{i=1}^{\infty} \Pr(A_i)\\

Property 3 (*countable additivity*) is stronger than *finite additivity*, which only requires

\\\Pr(A_1 \cup \cdots \cup A_n) = \sum\_{i=1}^{n} \Pr(A_i)\\

for every finite collection of mutually disjoint events. Countable additivity implies finite additivity (set \\A\_{n+1} = A\_{n+2} = \cdots = \emptyset\\ in property 3, using \\\Pr(\emptyset) = 0\\, which itself follows from property 3 applied to \\\Omega, \emptyset, \emptyset, \ldots\\), but not vice versa: there exist set functions that satisfy finite additivity but fail countable additivity (see [Wikipedia: Sigma-additive set function — An additive function which is not \\\sigma\\-additive](https://en.wikipedia.org/wiki/Sigma-additive_set_function#An_additive_function_which_is_not_%CF%83-additive)). Requiring countable additivity enables results such as the continuity of probability (if \\A_1 \supseteq A_2 \supseteq \cdots\\ with \\\bigcap_i A_i = \emptyset\\, then \\\Pr(A_i) \to 0\\), and it is what makes sums over countably infinite partitions valid.

> **NOTE:**
>
> **Example 3 (Probability measure for a fair die)** For the die roll in [Example 1](#exm-sample-space), define \\\Pr(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{} / 6\\, where \\\mathopen{}\left\|A\right\|\mathclose{}\\ is the number of outcomes in \\A\\. This function is non-negative, gives \\\Pr(\Omega) = 6/6 = 1\\, and is additive over disjoint events, because the sizes of disjoint sets add. The event “the roll is even” from [Example 2](#exm-event) has probability \\\Pr(\mathopen{}\left\\2, 4, 6\right\\\mathclose{}) = 3/6 = 1/2\\.

> **NOTE:**
>
> **Theorem 1 (Probability of a subset’s intersection)** If \\A\\ and \\B\\ are events and \\A\subseteq B\\, then \\\Pr(A \cap B) = \Pr(A)\\.

> **NOTE:**
>
> *Proof*. Since \\A \subseteq B\\, every outcome in \\A\\ is also in \\B\\, so \\A \cap B = A\\, and therefore \\\Pr(A \cap B) = \Pr(A)\\.

> **NOTE:**
>
> **Theorem 2 (An event and its complement sum to 1)** For any event \\A\\:
>
> \\\Pr(A) + \Pr(\neg A) = 1\\

> **NOTE:**
>
> *Proof*. The events \\A\\ and \\\neg A\\ are disjoint, and their union is \\\Omega\\.
>
> \\ \begin{aligned} \Pr(A) + \Pr(\neg A) &= \Pr(A \cup \neg A) && \text{(additivity of probability for disjoint events)} \\ &= \Pr(\Omega) && \text{(} A \cup \neg A = \Omega \text{)} \\ &= 1 && \text{(probability of the sample space is 1)} \end{aligned} \\

> **NOTE:**
>
> **Corollary 1 (Complement rule)** For any event \\A\\:
>
> \\\Pr(\neg A) = 1 - \Pr(A)\\

> **NOTE:**
>
> *Proof*. Subtract \\\Pr(A)\\ from both sides of [Theorem 2](#thm-total-prob-1).

> **NOTE:**
>
> **Corollary 2 (Complement rule in probability (\\\pi\\) notation)** If the probability of an event \\A\\ is \\\Pr(A)=\pi\\, then the probability that \\A\\ does not occur is:
>
> \\\Pr(\neg A)= 1 - \pi\\

> **NOTE:**
>
> *Proof*. \\ \begin{aligned} \Pr(\neg A) &= 1 - \Pr(A) && \text{(complement rule)} \\ &= 1 - \pi && \text{(substitute } \Pr(A) = \pi \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 4 (Probability of not rolling a six)** For a fair die, the event “the roll is a six” has probability \\\pi = 1/6\\, so by [Corollary 2](#cor-p-neg) the probability of not rolling a six is \\1 - 1/6 = 5/6\\.

## 1.2 Conditional probability

> **NOTE:**
>
> **Definition 4 (Conditional probability)** For two events \\A\\ and \\B\\ with \\\Pr(B) \> 0\\, the **conditional probability** of \\A\\ given \\B\\, denoted \\\Pr(A \mid B)\\, is:
>
> \\\Pr(A \mid B) \stackrel{\text{def}}{=}\frac{\Pr(A \cap B)}{\Pr(B)}\\

> **NOTE:**
>
> **Example 5 (Rolling a six, given an even roll)** For a fair die ([Example 3](#exm-probability)), let \\A = \mathopen{}\left\\6\right\\\mathclose{}\\ and \\B = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\. Then \\A \cap B = \mathopen{}\left\\6\right\\\mathclose{}\\, so:
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ &= \frac{1/6}{3/6} && \text{(substitute the probabilities)} \\ &= \frac{1}{3} && \text{(simplify)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 3 (Law of conditional probability)** For any two events \\A\\ and \\B\\ with \\\Pr(B) \> 0\\:
>
> \\\Pr(A \cap B) = \Pr(A \mid B) \cdot\Pr(B)\\

> **NOTE:**
>
> *Proof*. Rearranging [Definition 4](#def-conditional-prob):
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ \Pr(A \cap B) &= \Pr(A \mid B) \cdot\Pr(B) && \text{(multiply both sides by } \Pr(B) \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 6 (Applying the law of conditional probability)** Suppose 30% of adults exercise regularly (\\\Pr(E) = 0.30\\), and among adults who exercise regularly, 60% have low blood pressure (\\\Pr(L \mid E) = 0.60\\).
>
> Then, by [Theorem 3](#thm-law-conditional-prob), the probability that a randomly selected adult both exercises regularly and has low blood pressure is:
>
> \\ \begin{aligned} \Pr(L \cap E) &= \Pr(L \mid E) \cdot\Pr(E) && \text{(law of conditional probability)} \\ &= 0.60 \cdot 0.30 && \text{(substitute the given values)} \\ &= 0.18 && \text{(multiply)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 4 (Law of total probability)** If \\B_1, B_2, \ldots\\ is a finite or countably infinite partition of the sample space (mutually exclusive events whose union is the entire sample space), with \\\Pr(B_i) \> 0\\ for every \\i\\, then for any event \\A\\:
>
> \\\Pr(A) = \sum\_{i} \Pr(A \mid B_i) \cdot\Pr(B_i)\\

> **NOTE:**
>
> *Proof*. Since \\B_1, B_2, \ldots\\ partition the sample space, the events \\A \cap B_1, A \cap B_2, \ldots\\ are mutually exclusive and their union is \\A\\. By countable additivity ([Definition 3](#def-probability)), and then by [Theorem 3](#thm-law-conditional-prob):
>
> \\ \begin{aligned} \Pr(A) &= \sum\_{i} \Pr(A \cap B_i) && \text{(countable additivity for partition of } A \text{)} \\&= \sum\_{i} \Pr(A \mid B_i) \cdot\Pr(B_i) && \text{(law of conditional probability; } \Pr(B_i) \> 0 \text{)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 5 (Bayes’ theorem)** For any two events \\A\\ and \\B\\ with \\\Pr(A) \> 0\\ and \\\Pr(B) \> 0\\:
>
> \\\Pr(A \mid B) = \frac{\Pr(B \mid A) \cdot\Pr(A)}{\Pr(B)}\\

> **NOTE:**
>
> *Proof*. By [Definition 4](#def-conditional-prob) and [Theorem 3](#thm-law-conditional-prob):
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ &= \frac{\Pr(B \cap A)}{\Pr(B)} && \text{(intersection is commutative: } A \cap B = B \cap A \text{)} \\ &= \frac{\Pr(B \mid A) \cdot\Pr(A)}{\Pr(B)} && \text{(law of conditional probability applied to } \Pr(B \cap A) \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 7 (Positive predictive value of a medical test)** Suppose a disease test has 99% sensitivity and 99% specificity, and the prevalence of the disease in the population is 7%.
>
> Let \\D\\ be the event “person has the disease” and \\+\\ be the event “test is positive”. Then:
>
> - \\\Pr(+ \mid D) = 0.99\\ (sensitivity)
> - \\\Pr(\neg + \mid \neg D) = 0.99\\ (specificity), so the false positive rate is \\\Pr(+ \mid \neg D) = 1 - 0.99 = 0.01\\
> - \\\Pr(D) = 0.07\\ (prevalence)
>
> By [Theorem 5](#thm-bayes), with the denominator expanded by the [law of total probability](#thm-total-prob) over the partition \\\\D, \neg D\\\\:
>
> \\ \begin{aligned} \Pr(D \mid +) &= \frac{\Pr(+ \mid D) \cdot\Pr(D)}{\Pr(+)} && \text{(Bayes' theorem)} \\ &= \frac{\Pr(+ \mid D) \cdot\Pr(D)}{\Pr(+ \mid D) \cdot\Pr(D) + \Pr(+ \mid \neg D) \cdot\Pr(\neg D)} && \text{(law of total probability)} \\ &= \frac{0.99 \cdot 0.07}{0.99 \cdot 0.07 + 0.01 \cdot 0.93} && \text{(substitute the given values)} \\ &= \frac{0.0693}{0.0693 + 0.0093} && \text{(multiply each term in the numerator and denominator)} \\ &= \frac{0.0693}{0.0786} && \text{(add the denominator's two terms)} \\ &\approx 0.88 && \text{(divide)} \end{aligned} \\
>
> Even with a highly accurate test (99% sensitive and 99% specific), only about 88% of people who test positive actually have the disease, because the disease prevalence is relatively low (7%).

# References

Back to top
