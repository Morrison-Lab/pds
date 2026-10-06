# Probability basics

Code

- [Show All Code](javascript:void(0))

- [Hide All Code](javascript:void(0))

- 

  ------------------------------------------------------------------------

- [View Source](javascript:void(0))

Published

Last modified: 2026-10-06 02:10:24 (PDT)

## 1 Defining probabilities

> **NOTE:**
>
> **Definition 1 (Sample space)** The **sample space** of a random experiment, denoted \\\Omega\\, is the [set](https://morrison-lab.github.io/mds/sets-functions.html#def-set) of all of its possible outcomes.

> **NOTE:**
>
> **Example 1 (Sample space of a die roll)** Rolling a six-sided die once has sample space \\\Omega = \mathopen{}\left\\1, 2, 3, 4, 5, 6\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 2 (Event)** An **event** is a subset of the [sample space](#def-sample-space) \\\Omega\\: a set of outcomes.

> **NOTE:**
>
> *Remark*. When \\\Omega\\ is uncountable, such as an interval of real numbers, only the subsets in a designated [\\\sigma\\-algebra](https://morrison-lab.github.io/mds/measures.html#def-sigma-algebra) \\\mathscr{S}\\ on \\\Omega\\ count as events; every set that arises in these notes is in \\\mathscr{S}\\. When \\\Omega\\ is finite or [countably infinite](https://morrison-lab.github.io/mds/sets-functions.html#def-countably-infinite), every subset of \\\Omega\\ can be an event, because the collection of all subsets of \\\Omega\\ is a \\\sigma\\-algebra ([all subsets form a \\\sigma\\-algebra](https://morrison-lab.github.io/mds/measures.html#thm-power-set-sigma-algebra)), as in [\\\sigma\\-algebras for die rolls](https://morrison-lab.github.io/mds/measures.html#exm-sigma-algebra).

> **NOTE:**
>
> **Example 2 (Rolling an even number)** In [Example 1](#exm-sample-space), the event “the roll is even” is \\A = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 3 (Occurrence of an event)** An [event](#def-event) \\A\\ **occurs** when the outcome of the experiment is in \\A\\, and does not occur when the outcome is not in \\A\\.

> **NOTE:**
>
> **Example 3 (Rolling a 4)** In [Example 2](#exm-event), if the die shows 4, the event “the roll is even”, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, occurs, because \\4 \in \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, and the event “the roll is at most 2”, \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\, does not occur.

> **NOTE:**
>
> **Definition 4 (Complement of an event)** The **complement** of an [event](#def-event) \\A\\, denoted \\\neg A\\, is the event that \\A\\ does not [occur](#def-occurs): the set of outcomes in the sample space \\\Omega\\ that are not in \\A\\.
>
> \\\neg A \stackrel{\text{def}}{=}\Omega \setminus A\\

> **NOTE:**
>
> *Remark*. Other sources write \\A^c\\ or \\\bar{A}\\.

> **NOTE:**
>
> **Example 4 (Rolling an odd number)** In [Example 2](#exm-event), the complement of the event “the roll is even”, \\A = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, is the event “the roll is odd”, \\\neg A = \mathopen{}\left\\1, 3, 5\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 5 (Mutually exclusive events)** Finitely or countably many sets \\A_1, A_2, \ldots\\, such as [events](#def-event), are **mutually exclusive** (also called **disjoint**, **pairwise disjoint**, or **mutually disjoint**) when no two of them share an element:
>
> \\A_i \cap A_j = \emptyset \quad \text{for all } i \neq j\\

> **NOTE:**
>
> *Remark*. The math notes define the same property for sets in general, as [pairwise disjoint](https://morrison-lab.github.io/mds/measures.html#def-pairwise-disjoint).

> **NOTE:**
>
> **Example 5 (Low and high rolls)** In [Example 1](#exm-sample-space), the events “the roll is at most 2”, \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\, and “the roll is at least 5”, \\\mathopen{}\left\\5, 6\right\\\mathclose{}\\, are mutually exclusive: no roll is in both. The events “the roll is even”, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, and “the roll is at most 2”, \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\, are not mutually exclusive: a roll of 2 is in both.

> **NOTE:**
>
> **Definition 6 (Partition of an event)** A **partition** of an [event](#def-event) \\A\\ is a finite or countably infinite collection of events \\A_1, A_2, \ldots\\ that satisfies:
>
> - The events \\A_1, A_2, \ldots\\ are [mutually exclusive](#def-mutually-exclusive).
> - Their union is \\A\\: \\\bigcup\_{i} A_i = A\\.
>
> A partition of the [sample space](#def-sample-space) is the case \\A = \Omega\\.

> **NOTE:**
>
> *Remark*. Some sources also require each piece \\A_i\\ to contain at least one outcome.

> **NOTE:**
>
> **Example 6 (Partitioning the die roll)** In [Example 1](#exm-sample-space), the events “the roll is even”, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, and “the roll is odd”, \\\mathopen{}\left\\1, 3, 5\right\\\mathclose{}\\, are mutually exclusive, and their union is \\\Omega\\, so they partition the sample space. So do the six single-outcome events \\\mathopen{}\left\\1\right\\\mathclose{}, \mathopen{}\left\\2\right\\\mathclose{}, \ldots, \mathopen{}\left\\6\right\\\mathclose{}\\. The events \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\ and \\\mathopen{}\left\\5, 6\right\\\mathclose{}\\ from [Example 5](#exm-mutually-exclusive) do not partition \\\Omega\\: their union leaves out 3 and 4.

> **NOTE:**
>
> **Definition 7 (Probability measure)** A **probability measure** on a [sample space](#def-sample-space) \\\Omega\\, often denoted \\\Pr()\\ or \\\operatorname{P}()\\, is a [measure](https://morrison-lab.github.io/mds/measures.html#def-measure) on the [events](#def-event) of \\\Omega\\ that gives the whole sample space probability 1:
>
> \\\Pr(\Omega) = 1\\

> **NOTE:**
>
> **Example 7 (Probability measure for a fair die)** For the die roll in [Example 1](#exm-sample-space), define \\\Pr(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{} / 6\\, where \\\mathopen{}\left\|A\right\|\mathclose{}\\ is the number of outcomes in \\A\\. This function is \\1/6\\ times the counting measure \\\mu(A) = \mathopen{}\left\|A\right\|\mathclose{}\\ on the die rolls ([counting elements is a measure](https://morrison-lab.github.io/mds/measures.html#exm-measure)), so it is a [measure](https://morrison-lab.github.io/mds/measures.html#def-measure) on the events of \\\Omega\\, and it gives \\\Pr(\Omega) = 6/6 = 1\\. The event “the roll is even” from [Example 2](#exm-event) has probability \\\Pr(\mathopen{}\left\\2, 4, 6\right\\\mathclose{}) = 3/6 = 1/2\\.

> **NOTE:**
>
> **Corollary 1 (Probability measures are finitely additive)** Every [probability measure](#def-probability) is [finitely additive](https://morrison-lab.github.io/mds/measures.html#def-finite-additivity): for any [mutually exclusive](#def-mutually-exclusive) events \\A_1, \ldots, A_n\\,
>
> \\\Pr(A_1 \cup \cdots \cup A_n) = \sum\_{i=1}^{n} \Pr(A_i)\\

> **NOTE:**
>
> *Proof*. A probability measure is a measure ([Definition 7](#def-probability)), so [measures are finitely additive](https://morrison-lab.github.io/mds/measures.html#cor-measure-finitely-additive) applies to it.

> **NOTE:**
>
> **Theorem 1 (Continuity of probability)** If \\A_1 \supseteq A_2 \supseteq \cdots\\ are events with \\\bigcap\_{i=1}^{\infty} A_i = \emptyset\\, then:
>
> \\\lim\_{n \to \infty} \Pr(A_n) = 0\\

> **NOTE:**
>
> *Proof*. For each \\i\\, let \\B_i \stackrel{\text{def}}{=}A_i \setminus A\_{i+1}\\, the outcomes in \\A_i\\ but not in \\A\_{i+1}\\. Each \\B_i = A_i \cap (\Omega \setminus A\_{i+1})\\ is an event, by [closure properties of a \\\sigma\\-algebra](https://morrison-lab.github.io/mds/measures.html#thm-sigma-algebra-closure).
>
> *The \\B_i\\ are pairwise disjoint.* For \\i \< j\\, \\B_j \subseteq A_j \subseteq A\_{i+1}\\, while \\B_i\\ has no outcomes in \\A\_{i+1}\\, so \\B_i \cap B_j = \emptyset\\.
>
> *\\A_n = \bigcup\_{i=n}^{\infty} B_i\\ for each \\n\\.* For \\i \ge n\\, \\B_i \subseteq A_i \subseteq A_n\\, so the union is contained in \\A_n\\. Conversely, let \\\omega \in A_n\\. Since \\\bigcap\_{i} A_i = \emptyset\\, \\\omega\\ is not in every \\A_i\\; since the \\A_i\\ are nested, the indices \\i\\ with \\\omega \in A_i\\ are \\1, \ldots, m\\ for some \\m \ge n\\. Then \\\omega \in A_m\\ and \\\omega \notin A\_{m+1}\\, so \\\omega \in B_m\\.
>
> *\\\Pr(A_1)\\ is finite.* The events \\A_1\\ and \\\Omega \setminus A_1\\ are disjoint with union \\\Omega\\, so [Corollary 1](#cor-probability-finitely-additive) applies to them:
>
> \\ \begin{aligned} \Pr(A_1) &\le \Pr(A_1) + \Pr(\Omega \setminus A_1) && \text{(} \Pr(\Omega \setminus A_1) \ge 0 \text{)} \\ &= \Pr(\Omega) && \text{(finite additivity of } \Pr \text{)} \\ &= 1 && \text{(definition of a probability measure)} \end{aligned} \\
>
> *The limit.* For each \\n\\:
>
> \\ \begin{aligned} \Pr(A_n) &= \Pr\\\left(\bigcup\_{i=n}^{\infty} B_i\right) && \text{(} A_n = \bigcup\_{i=n}^{\infty} B_i \text{)} \\ &= \sum\_{i=n}^{\infty} \Pr(B_i) && \text{(countable additivity; the } B_i \text{ are pairwise disjoint)} \end{aligned} \\
>
> With \\n = 1\\, this says the series \\\sum\_{i=1}^{\infty} \Pr(B_i)\\ has the finite total \\\Pr(A_1)\\. So, for \\n \ge 2\\:
>
> \\ \begin{aligned} \Pr(A_n) &= \sum\_{i=1}^{\infty} \Pr(B_i) - \sum\_{i=1}^{n-1} \Pr(B_i) && \text{(split off the first } n - 1 \text{ terms; the total is finite)} \\ &= \Pr(A_1) - \sum\_{i=1}^{n-1} \Pr(B_i) && \text{(the case } n = 1 \text{)} \end{aligned} \\
>
> As \\n \to \infty\\, the partial sums \\\sum\_{i=1}^{n-1} \Pr(B_i)\\ converge to the total \\\Pr(A_1)\\, so \\\Pr(A_n) \to \Pr(A_1) - \Pr(A_1) = 0\\.

> **NOTE:**
>
> *Remark*. Requiring countable additivity, not just finite additivity, enables results such as [Theorem 1](#thm-continuity-probability), and it is what makes sums over countably infinite [partitions](#def-partition) valid.

> **NOTE:**
>
> **Theorem 2 (Kolmogorov axioms)** A function \\\Pr\\ that assigns a real number \\\Pr(A)\\ to each [event](#def-event) \\A\\ of a sample space \\\Omega\\ is a [probability measure](#def-probability) if and only if it satisfies:
>
> 1.  For any event \\A\\, \\\Pr(A) \ge 0\\.
> 2.  The probability of the whole sample space is 1: \\\Pr(\Omega) = 1\\
> 3.  \\\Pr\\ is [countably additive](https://morrison-lab.github.io/mds/measures.html#def-countable-additivity): for any [mutually exclusive](#def-mutually-exclusive) events \\A_1, A_2, \ldots\\, \\\Pr\\\left(\bigcup\_{i=1}^{\infty} A_i\right) = \sum\_{i=1}^{\infty} \Pr(A_i)\\

> **NOTE:**
>
> *Proof*. Suppose \\\Pr\\ is a probability measure. It is a [measure](https://morrison-lab.github.io/mds/measures.html#def-measure), so its values lie in the [extended non-negative reals](https://morrison-lab.github.io/mds/sets-functions.html#def-extended-nonneg-reals) \\\[0, \infty\]\\, which gives axiom 1, and it is countably additive, which is axiom 3. Axiom 2 is the condition \\\Pr(\Omega) = 1\\ in [Definition 7](#def-probability).
>
> Conversely, suppose \\\Pr\\ satisfies the three axioms. By axiom 1, \\\Pr\\ takes values in \\\[0, \infty\]\\, so axiom 3 says \\\Pr\\ is countably additive in the sense of the [definition of countable additivity](https://morrison-lab.github.io/mds/measures.html#def-countable-additivity). Then, by [countable additivity and the empty set](https://morrison-lab.github.io/mds/measures.html#lem-countable-additivity-empty), \\\Pr(\emptyset)\\ is 0 or \\\infty\\; \\\Pr(\emptyset)\\ is a real number, so \\\Pr(\emptyset) = 0\\. So \\\Pr\\ satisfies both conditions of the [definition of a measure](https://morrison-lab.github.io/mds/measures.html#def-measure) (\\\Pr(\emptyset) = 0\\ and countable additivity) and is a measure on the events of \\\Omega\\. With axiom 2, \\\Pr\\ is a probability measure ([Definition 7](#def-probability)).

> **NOTE:**
>
> *Remark*. Many sources define a probability measure by these three axioms instead; the theorem shows that the two definitions agree. The axioms are named for Kolmogorov, who introduced them in 1933 (see [Wikipedia: Probability axioms](https://en.wikipedia.org/wiki/Probability_axioms)). The axiom form does not list \\\Pr(\emptyset) = 0\\; the proof above derives it.

> **NOTE:**
>
> **Theorem 3 (Probability of a subset’s intersection)** If \\A\\ and \\B\\ are events and \\A\subseteq B\\, then \\\Pr(A \cap B) = \Pr(A)\\.

> **NOTE:**
>
> *Proof*. Since \\A \subseteq B\\, every outcome in \\A\\ is also in \\B\\, so \\A \cap B = A\\, and therefore \\\Pr(A \cap B) = \Pr(A)\\.

> **NOTE:**
>
> **Theorem 4 (An event and its complement sum to 1)** For any event \\A\\ and its [complement](#def-complement) \\\neg A\\:
>
> \\\Pr(A) + \Pr(\neg A) = 1\\

> **NOTE:**
>
> *Proof*. The events \\A\\ and \\\neg A\\ are disjoint, and their union is \\\Omega\\.
>
> \\ \begin{aligned} \Pr(A) + \Pr(\neg A) &= \Pr(A \cup \neg A) && \text{(additivity of probability for disjoint events)} \\ &= \Pr(\Omega) && \text{(} A \cup \neg A = \Omega \text{)} \\ &= 1 && \text{(probability of the sample space is 1)} \end{aligned} \\

> **NOTE:**
>
> **Corollary 2 (Complement rule)** For any event \\A\\:
>
> \\\Pr(\neg A) = 1 - \Pr(A)\\

> **NOTE:**
>
> *Proof*. Subtract \\\Pr(A)\\ from both sides of [Theorem 4](#thm-total-prob-1).

> **NOTE:**
>
> **Corollary 3 (Complement rule in probability (\\\pi\\) notation)** If the probability of an event \\A\\ is \\\Pr(A)=\pi\\, then the probability that \\A\\ does not occur is:
>
> \\\Pr(\neg A)= 1 - \pi\\

> **NOTE:**
>
> *Proof*. \\ \begin{aligned} \Pr(\neg A) &= 1 - \Pr(A) && \text{(complement rule)} \\ &= 1 - \pi && \text{(substitute } \Pr(A) = \pi \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 8 (Probability of not rolling a six)** For a fair die, the event “the roll is a six” has probability \\\pi = 1/6\\, so by [Corollary 3](#cor-p-neg) the probability of not rolling a six is \\1 - 1/6 = 5/6\\.

## 2 Conditional probability

> **NOTE:**
>
> **Definition 8 (Conditional probability)** For two events \\A\\ and \\B\\ with \\\Pr(B) \> 0\\, the **conditional probability** of \\A\\ given \\B\\, denoted \\\Pr(A \mid B)\\, is:
>
> \\\Pr(A \mid B) \stackrel{\text{def}}{=}\frac{\Pr(A \cap B)}{\Pr(B)}\\

> **NOTE:**
>
> **Example 9 (Rolling a six, given an even roll)** For a fair die ([Example 7](#exm-probability)), let \\A = \mathopen{}\left\\6\right\\\mathclose{}\\ and \\B = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\. Then \\A \cap B = \mathopen{}\left\\6\right\\\mathclose{}\\, so:
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ &= \frac{1/6}{3/6} && \text{(substitute the probabilities)} \\ &= \frac{1}{3} && \text{(simplify)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 5 (Law of conditional probability)** For any two events \\A\\ and \\B\\ with \\\Pr(B) \> 0\\:
>
> \\\Pr(A \cap B) = \Pr(A \mid B) \cdot\Pr(B)\\

> **NOTE:**
>
> *Proof*. Rearranging [Definition 8](#def-conditional-prob):
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ \Pr(A \cap B) &= \Pr(A \mid B) \cdot\Pr(B) && \text{(multiply both sides by } \Pr(B) \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 10 (Applying the law of conditional probability)** Suppose 30% of adults exercise regularly (\\\Pr(E) = 0.30\\), and among adults who exercise regularly, 60% have low blood pressure (\\\Pr(L \mid E) = 0.60\\).
>
> Then, by [Theorem 5](#thm-law-conditional-prob), the probability that a randomly selected adult both exercises regularly and has low blood pressure is:
>
> \\ \begin{aligned} \Pr(L \cap E) &= \Pr(L \mid E) \cdot\Pr(E) && \text{(law of conditional probability)} \\ &= 0.60 \cdot 0.30 && \text{(substitute the given values)} \\ &= 0.18 && \text{(multiply)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 6 (Law of total probability)** If \\B_1, B_2, \ldots\\ is a [partition](#def-partition) of the sample space, with \\\Pr(B_i) \> 0\\ for every \\i\\, then for any event \\A\\:
>
> \\\Pr(A) = \sum\_{i} \Pr(A \mid B_i) \cdot\Pr(B_i)\\

> **NOTE:**
>
> *Proof*. Since \\B_1, B_2, \ldots\\ partition the sample space, the events \\A \cap B_1, A \cap B_2, \ldots\\ are mutually exclusive and their union is \\A\\. By [countable additivity](https://morrison-lab.github.io/mds/measures.html#def-countable-additivity), and then by [Theorem 5](#thm-law-conditional-prob):
>
> \\ \begin{aligned} \Pr(A) &= \sum\_{i} \Pr(A \cap B_i) && \text{(countable additivity for partition of } A \text{)} \\&= \sum\_{i} \Pr(A \mid B_i) \cdot\Pr(B_i) && \text{(law of conditional probability; } \Pr(B_i) \> 0 \text{)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 7 (Bayes’ theorem)** For any two events \\A\\ and \\B\\ with \\\Pr(A) \> 0\\ and \\\Pr(B) \> 0\\:
>
> \\\Pr(A \mid B) = \frac{\Pr(B \mid A) \cdot\Pr(A)}{\Pr(B)}\\

> **NOTE:**
>
> *Proof*. By [Definition 8](#def-conditional-prob) and [Theorem 5](#thm-law-conditional-prob):
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ &= \frac{\Pr(B \cap A)}{\Pr(B)} && \text{(intersection is commutative: } A \cap B = B \cap A \text{)} \\ &= \frac{\Pr(B \mid A) \cdot\Pr(A)}{\Pr(B)} && \text{(law of conditional probability applied to } \Pr(B \cap A) \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 11 (Positive predictive value of a medical test)** Suppose a disease test has 99% sensitivity and 99% specificity, and the prevalence of the disease in the population is 7%.
>
> Let \\D\\ be the event “person has the disease” and \\+\\ be the event “test is positive”. Then:
>
> - \\\Pr(+ \mid D) = 0.99\\ (sensitivity)
> - \\\Pr(\neg + \mid \neg D) = 0.99\\ (specificity), so the false positive rate is \\\Pr(+ \mid \neg D) = 1 - 0.99 = 0.01\\
> - \\\Pr(D) = 0.07\\ (prevalence)
>
> By [Theorem 7](#thm-bayes), with the denominator expanded by the [law of total probability](#thm-total-prob) over the partition \\\\D, \neg D\\\\:
>
> \\ \begin{aligned} \Pr(D \mid +) &= \frac{\Pr(+ \mid D) \cdot\Pr(D)}{\Pr(+)} && \text{(Bayes' theorem)} \\ &= \frac{\Pr(+ \mid D) \cdot\Pr(D)}{\Pr(+ \mid D) \cdot\Pr(D) + \Pr(+ \mid \neg D) \cdot\Pr(\neg D)} && \text{(law of total probability)} \\ &= \frac{0.99 \cdot 0.07}{0.99 \cdot 0.07 + 0.01 \cdot 0.93} && \text{(substitute the given values)} \\ &= \frac{0.0693}{0.0693 + 0.0093} && \text{(multiply each term in the numerator and denominator)} \\ &= \frac{0.0693}{0.0786} && \text{(add the denominator's two terms)} \\ &\approx 0.88 && \text{(divide)} \end{aligned} \\
>
> Even with a highly accurate test (99% sensitive and 99% specific), only about 88% of people who test positive actually have the disease, because the disease prevalence is relatively low (7%).

> **NOTE:**
>
> **Exercise 1 (Turn a conditional around)** [Definition 8](#def-conditional-prob) defines \\\Pr(A \mid B)\\ in terms of \\\Pr(A \cap B)\\. Write the same definition with \\A\\ and \\B\\ swapped, then eliminate \\\Pr(A \cap B)\\ between the two.
>
> Your result should express \\\Pr(A \mid B)\\ using \\\Pr(B \mid A)\\, \\\Pr(A)\\ and \\\Pr(B)\\, and none of them jointly.

> **NOTE:**
>
> *Solution 1*. Multiplying [Definition 8](#def-conditional-prob) through by its denominator, in each direction,
>
> \\\Pr(A \cap B) = \Pr(A \mid B)\\\Pr(B), \qquad \Pr(A \cap B) = \Pr(B \mid A)\\\Pr(A)\\
>
> The left-hand sides are the same quantity, so the right-hand sides are equal. Dividing by \\\Pr(B)\\ gives **Bayes’ rule** ([Theorem 7](#thm-bayes)):
>
> \\\Pr(A \mid B) = \frac{\Pr(B \mid A)\\\Pr(A)}{\Pr(B)} \tag{1}\\
>
> Nothing was assumed beyond \\\Pr(A) \> 0\\ and \\\Pr(B) \> 0\\, which the two conditionals need in order to be defined at all.
>
> As Hutchinson emphasizes ([Hutchinson 2024](#ref-hutchinson2024data471)), each component carries standard Bayesian terminology:
>
> - \\\Pr(A \mid B)\\ is the **posterior probability** of \\A\\ given the observed evidence \\B\\.
> - \\\Pr(B \mid A)\\ is the **likelihood** of the evidence \\B\\ given \\A\\.
> - \\\Pr(A)\\ is the **prior probability** of \\A\\ before seeing \\B\\.
> - \\\Pr(B)\\ is the marginal probability of the **evidence**.
>
> From this formula, the direction of effects is transparent: increasing the prior \\\Pr(A)\\ or the likelihood \\\Pr(B \mid A)\\ increases the posterior \\\Pr(A \mid B)\\, while increasing the probability of the evidence \\\Pr(B)\\ decreases it.

> **NOTE:**
>
> **Exercise 2 (A test that is right 99% of the time)** A screening test for a disease is positive for \\99\\\\ of people who have it and negative for \\99\\\\ of people who do not. One person in a thousand has the disease.
>
> A randomly screened person tests positive. What is the probability that they have the disease? Guess first, then compute it with [Equation 1](#eq-bayes).

> **NOTE:**
>
> *Solution 2*. Write \\S\\ for having the disease and \\+\\ for a positive test. The three given numbers are
>
> \\\Pr(+ \mid S) = 0.99, \qquad \Pr(+ \mid \text{not } S) = 0.01, \qquad \Pr(S) = 0.001\\
>
> [Equation 1](#eq-bayes) needs \\\Pr(+)\\, the overall chance of a positive result. Assemble it with [Theorem 6](#thm-total-prob), splitting on whether the person is sick:
>
> \\\begin{aligned} \Pr(+) &= \Pr(+ \mid S)\Pr(S) + \Pr(+ \mid \text{not } S)\Pr(\text{not } S) \\ &= (0.99)(0.001) + (0.01)(0.999) \\ &= 0.00099 + 0.00999 = 0.01098 \end{aligned}\\
>
> Then
>
> \\\Pr(S \mid +) = \frac{\Pr(+ \mid S)\\\Pr(S)}{\Pr(+)} = \frac{0.00099}{0.01098} \approx 0.0902\\
>
> About **9%**, not the \\99\\\\ most people guess.
>
> The reason is the **base rate**. Out of \\100{,}000\\ people screened, about \\100\\ have the disease and \\99\\ of them test positive, while \\99{,}900\\ do not have it and about \\999\\ of them test positive anyway. The false positives outnumber the true positives ten to one, because there are a thousand times more people available to produce them.
>
> The base rate is fundamental to evaluating screening tests and binary classifiers, and it illustrates why raw accuracy can be misleading on rare events.

Show R code

``` js
brPost = (prev) => brSens * prev / (brSens * prev + (1 - brSpec) * (1 - prev))
// The same people as counts, out of 100,000 screened.
brN = 100000
brSick = brN * brPrev
brTP = brSick * brSens
brFP = (brN - brSick) * (1 - brSpec)
```

Show R code

``` js
viewof brSens = Inputs.range([0.5, 1], {value: 0.99, step: 0.001, label: "P(+ | S), sensitivity"})
viewof brSpec = Inputs.range([0.5, 1], {value: 0.99, step: 0.001, label: "P(\u2212 | not S), specificity"})
viewof brPrev = Inputs.range([0.0001, 0.5], {value: 0.001, transform: Math.log, format: d3.format(".4~f"), label: "P(S), prevalence"})
```

Show R code

``` js
{
  const n = (v) => Math.round(v).toLocaleString("en-US");
  return md`Out of ${n(brN)} people screened, ${n(brSick)} have the disease and ${n(brTP)} of them test positive;
of the ${n(brN - brSick)} who do not, ${n(brFP)} test positive anyway.
So of the ${n(brTP + brFP)} positives, ${n(brTP)} are sick:
P(S | +) = **${(100 * brPost(brPrev)).toFixed(1)}%**.`;
}
```

Show R code

``` js
Plot.plot({
  ariaLabel: 'Of 100,000 people screened, ' +
    'the ones who test positive, ' +
    'as one bar split into the sick, ' +
    'in orange, ' +
    'and the healthy, ' +
    'in blue.',
  width: 380, height: 120, marginLeft: 10, marginRight: 20,
  x: {label: "people who test positive, out of 100,000 screened"},
  color: {domain: ["sick", "not sick"], range: ["#ff7f0e", "#1f77b4"], legend: true},
  marks: [
    Plot.barX([{who: "sick", n: brTP}, {who: "not sick", n: brFP}],
              {x: "n", fill: "who", insetTop: 10, insetBottom: 10}),
    Plot.ruleX([0])
  ]
})
```

Show R code

``` js
Plot.plot({
  ariaLabel: 'The chance of disease after a positive test, ' +
    'plotted against the prevalence on a log scale, ' +
    'for the chosen sensitivity and specificity, ' +
    'with the chosen prevalence marked.',
  width: 380, height: 230, grid: true,
  x: {type: "log", domain: [0.0001, 0.5], label: "P(S), prevalence (log scale)",
      ticks: [0.0001, 0.001, 0.01, 0.1, 0.5], tickFormat: d3.format(".2~%")},
  y: {domain: [0, 1], label: "P(S | +)"},
  marks: [
    Plot.line(d3.range(-4, Math.log10(0.5) + 0.001, 0.02).map((e) => 10 ** e),
              {x: (p) => p, y: brPost, stroke: "#555"}),
    Plot.dot([brPrev], {x: (p) => p, y: brPost, r: 5, fill: "#ff7f0e"})
  ]
})
```

Figure 1: The chance of disease after a positive test, as counts out of 100,000 people screened and as a function of the prevalence.

> **TIP:**
>
> Hutchinson’s [Probability Refresher](https://facultyweb.cs.wwu.edu/~hutchib2/video_lectures/data371/#probability_refresher) (27 min) covers conditional distributions, the law of total probability, the chain rule of probability, and Bayes’ rule ([Hutchinson, n.d.](#ref-hutchinson_wwu_ml_videos)). The login for the video site is posted [on Canvas](https://wwu.instructure.com/courses/1906010/modules#module_3922392).

## References

Hutchinson, Brian. 2024. *DATA 471/571: Machine Learning*. Western Washington University.

Hutchinson, Brian. n.d. *DATA 471/571 (Machine Learning) and CSCI 481/581 (Deep Learning) Video Lectures*. Western Washington University. Accessed September 28, 2026. <https://facultyweb.cs.wwu.edu/~hutchib2/video_lectures/data371/>.

Back to top
