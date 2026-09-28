# Probability basics

Code

Published

Last modified: 2026-09-28 11:50:39 (PDT)

## 1 Defining probabilities

> **NOTE:**
>
> **Definition 1 (Sample space)** The **sample space** of a random experiment, denoted \\\Omega\\, is the set of all of its possible outcomes.

> **NOTE:**
>
> **Example 1 (Sample space of a die roll)** Rolling a six-sided die once has sample space \\\Omega = \mathopen{}\left\\1, 2, 3, 4, 5, 6\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 2 (\\\sigma\\-algebra)** A **\\\sigma\\-algebra** on a set \\S\\ is a collection \\\mathscr{S}\\ of subsets of \\S\\ that satisfies:
>
> - \\\mathscr{S}\\ contains \\S\\ itself.
> - For each set \\A\\ in \\\mathscr{S}\\, \\\mathscr{S}\\ contains its complement \\S \setminus A\\.
> - For each sequence \\A_1, A_2, \ldots\\ of sets in \\\mathscr{S}\\, \\\mathscr{S}\\ contains their union \\\bigcup\_{i=1}^{\infty} A_i\\.

Other sources call it a **\\\sigma\\-field** (see [Wikipedia: \\\sigma\\-algebra](https://en.wikipedia.org/wiki/%CE%A3-algebra)). A \\\sigma\\-algebra also contains \\\emptyset = S \setminus S\\, every finite union of its sets (pad the sequence with copies of \\\emptyset\\), and every countable intersection of its sets (take complements, apply the union rule, and take the complement again).

> **NOTE:**
>
> **Example 2 (\\\sigma\\-algebras for a die roll)** For the die roll in [Example 1](#exm-sample-space), the collection of all subsets of \\\Omega = \mathopen{}\left\\1, 2, 3, 4, 5, 6\right\\\mathclose{}\\ is a \\\sigma\\-algebra on \\\Omega\\, since complements and unions of subsets of \\\Omega\\ are again subsets of \\\Omega\\. So is the smaller collection
>
> \\\mathopen{}\left\\\emptyset, \mathopen{}\left\\2, 4, 6\right\\\mathclose{}, \mathopen{}\left\\1, 3, 5\right\\\mathclose{}, \Omega\right\\\mathclose{}\\
>
> which contains \\\Omega\\, the complement of each of its sets, and every union of its sets: for example, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{} \cup \mathopen{}\left\\1, 3, 5\right\\\mathclose{} = \Omega\\.

> **NOTE:**
>
> **Definition 3 (Event)** An **event** is a subset of the [sample space](#def-sample-space) \\\Omega\\: a set of outcomes.

When \\\Omega\\ is uncountable, such as an interval of real numbers, only the subsets in a designated [\\\sigma\\-algebra](#def-sigma-algebra) \\\mathscr{S}\\ on \\\Omega\\ count as events; every set that arises in these notes is in \\\mathscr{S}\\. When \\\Omega\\ is finite or countably infinite, every subset of \\\Omega\\ can be an event, as in [Example 2](#exm-sigma-algebra).

> **NOTE:**
>
> **Example 3 (Rolling an even number)** In [Example 1](#exm-sample-space), the event “the roll is even” is \\A = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 4 (Occurrence of an event)** An [event](#def-event) \\A\\ **occurs** when the outcome of the experiment is in \\A\\, and does not occur when the outcome is not in \\A\\.

> **NOTE:**
>
> **Example 4 (Rolling a 4)** In [Example 3](#exm-event), if the die shows 4, the event “the roll is even”, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, occurs, because \\4 \in \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, and the event “the roll is at most 2”, \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\, does not occur.

> **NOTE:**
>
> **Definition 5 (Complement of an event)** The **complement** of an [event](#def-event) \\A\\, denoted \\\neg A\\, is the event that \\A\\ does not [occur](#def-occurs): the set of outcomes in the sample space \\\Omega\\ that are not in \\A\\.
>
> \\\neg A \stackrel{\text{def}}{=}\Omega \setminus A\\

Other sources write \\A^c\\ or \\\bar{A}\\.

> **NOTE:**
>
> **Example 5 (Rolling an odd number)** In [Example 3](#exm-event), the complement of the event “the roll is even”, \\A = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, is the event “the roll is odd”, \\\neg A = \mathopen{}\left\\1, 3, 5\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 6 (Mutually exclusive events)** Finitely or countably many sets \\A_1, A_2, \ldots\\, such as [events](#def-event), are **mutually exclusive** (also called **disjoint**, **pairwise disjoint**, or **mutually disjoint**) when no two of them share an element:
>
> \\A_i \cap A_j = \emptyset \quad \text{for all } i \neq j\\

> **NOTE:**
>
> **Example 6 (Low and high rolls)** In [Example 1](#exm-sample-space), the events “the roll is at most 2”, \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\, and “the roll is at least 5”, \\\mathopen{}\left\\5, 6\right\\\mathclose{}\\, are mutually exclusive: no roll is in both. The events “the roll is even”, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, and “the roll is at most 2”, \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\, are not mutually exclusive: a roll of 2 is in both.

> **NOTE:**
>
> **Definition 7 (Partition of an event)** A **partition** of an [event](#def-event) \\A\\ is a finite or countably infinite collection of events \\A_1, A_2, \ldots\\ that satisfies:
>
> - The events \\A_1, A_2, \ldots\\ are [mutually exclusive](#def-mutually-exclusive).
> - Their union is \\A\\: \\\bigcup\_{i} A_i = A\\.
>
> A partition of the [sample space](#def-sample-space) is the case \\A = \Omega\\.

Some sources also require each piece \\A_i\\ to contain at least one outcome.

> **NOTE:**
>
> **Example 7 (Partitioning the die roll)** In [Example 1](#exm-sample-space), the events “the roll is even”, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, and “the roll is odd”, \\\mathopen{}\left\\1, 3, 5\right\\\mathclose{}\\, are mutually exclusive, and their union is \\\Omega\\, so they partition the sample space. So do the six single-outcome events \\\mathopen{}\left\\1\right\\\mathclose{}, \mathopen{}\left\\2\right\\\mathclose{}, \ldots, \mathopen{}\left\\6\right\\\mathclose{}\\. The events \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\ and \\\mathopen{}\left\\5, 6\right\\\mathclose{}\\ from [Example 6](#exm-mutually-exclusive) do not partition \\\Omega\\: their union leaves out 3 and 4.

> **NOTE:**
>
> **Definition 8 (Finite additivity)** Let \\\mathscr{S}\\ be a [\\\sigma\\-algebra](#def-sigma-algebra) on a set \\S\\. A function \\\mu\\ that assigns a value \\\mu(A) \in \[0, \infty\]\\ to each set \\A\\ in \\\mathscr{S}\\ is **finitely additive** if, for every finite collection of [pairwise disjoint](#def-mutually-exclusive) sets \\A_1, \ldots, A_n\\ in \\\mathscr{S}\\, the value of their union is the sum of their values:
>
> \\\mu(A_1 \cup \cdots \cup A_n) = \sum\_{i=1}^{n} \mu(A_i)\\

> **NOTE:**
>
> **Example 8 (Counting outcomes is finitely additive)** For the die roll in [Example 1](#exm-sample-space), let \\\mu(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{}\\, the number of outcomes in \\A\\, for each set \\A\\ in the \\\sigma\\-algebra of all subsets of \\\Omega\\ ([Example 2](#exm-sigma-algebra)). The events \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\ and \\\mathopen{}\left\\5, 6\right\\\mathclose{}\\ are mutually exclusive ([Example 6](#exm-mutually-exclusive)), and:
>
> \\ \begin{aligned} \mu(\mathopen{}\left\\1, 2\right\\\mathclose{} \cup \mathopen{}\left\\5, 6\right\\\mathclose{}) &= \mu(\mathopen{}\left\\1, 2, 5, 6\right\\\mathclose{}) && \text{(take the union)} \\ &= 4 && \text{(count the outcomes)} \\ &= 2 + 2 && \text{(write 4 as a sum)} \\ &= \mu(\mathopen{}\left\\1, 2\right\\\mathclose{}) + \mu(\mathopen{}\left\\5, 6\right\\\mathclose{}) && \text{(count each event's outcomes)} \end{aligned} \\
>
> The same holds for any mutually exclusive events, because the sizes of disjoint sets add, so \\\mu\\ is finitely additive.

> **NOTE:**
>
> **Definition 9 (Countable additivity)** Let \\\mathscr{S}\\ be a [\\\sigma\\-algebra](#def-sigma-algebra) on a set \\S\\. A function \\\mu\\ that assigns a value \\\mu(A) \in \[0, \infty\]\\ to each set \\A\\ in \\\mathscr{S}\\ is **countably additive** (also called **\\\sigma\\-additive**) if, for every sequence of [pairwise disjoint](#def-mutually-exclusive) sets \\A_1, A_2, \ldots\\ in \\\mathscr{S}\\, the value of their union is the sum of their values:
>
> \\\mu\\\left(\bigcup\_{i=1}^{\infty} A_i\right) = \sum\_{i=1}^{\infty} \mu(A_i)\\

A sum of values in \\\[0, \infty\]\\ is either a finite number or \\\infty\\, so the right-hand side always has a value.

> **NOTE:**
>
> **Example 9 (Counting outcomes is countably additive)** For the counting function \\\mu(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{}\\ of [Example 8](#exm-finite-additivity), take any sequence of pairwise disjoint events \\A_1, A_2, \ldots\\. No two of them share an outcome, and \\\Omega\\ has only six outcomes, so at most six of the \\A_i\\ contain any outcomes; the rest are \\\emptyset\\, with \\\mu(\emptyset) = 0\\. The infinite sum therefore has at most six nonzero terms, and finite additivity ([Example 8](#exm-finite-additivity)) shows that those terms add up to \\\mu\\ of the union. So \\\mu\\ is countably additive.

> **NOTE:**
>
> **Lemma 1 (Countable additivity and the empty set)** If \\\mu\\ is a [countably additive](#def-countable-additivity) function on a [\\\sigma\\-algebra](#def-sigma-algebra) \\\mathscr{S}\\, then \\\mu(\emptyset) = 0\\ or \\\mu(\emptyset) = \infty\\.

> **NOTE:**
>
> *Proof*. The set \\\emptyset = S \setminus S\\ is in \\\mathscr{S}\\, as the complement of \\S\\, and the sequence \\\emptyset, \emptyset, \ldots\\ is pairwise disjoint with union \\\emptyset\\, so:
>
> \\ \begin{aligned} \mu(\emptyset) &= \mu\\\left(\bigcup\_{i=1}^{\infty} \emptyset\right) && \text{(the union of copies of } \emptyset \text{ is } \emptyset \text{)} \\ &= \sum\_{i=1}^{\infty} \mu(\emptyset) && \text{(countable additivity)} \end{aligned} \\
>
> If \\\mu(\emptyset) = c\\ for a finite \\c \> 0\\, the right-hand side is \\c + c + \cdots = \infty \neq c\\, a contradiction. So \\\mu(\emptyset)\\ is 0 or \\\infty\\.

Both values occur. The counting function of [Example 9](#exm-countable-additivity) has \\\mu(\emptyset) = 0\\, while the function with \\\mu(A) = \infty\\ for every \\A\\, including \\\emptyset\\, is countably additive, since both sides of the defining equation are \\\infty\\. So \\\mu(\emptyset) = 0\\ is an extra requirement, not a consequence of countable additivity.

> **NOTE:**
>
> **Theorem 1 (Countable additivity implies finite additivity)** If \\\mu\\ is a [countably additive](#def-countable-additivity) function on a [\\\sigma\\-algebra](#def-sigma-algebra) \\\mathscr{S}\\, and \\\mu(\emptyset) = 0\\, then \\\mu\\ is [finitely additive](#def-finite-additivity).

> **NOTE:**
>
> *Proof*. Let \\A_1, \ldots, A_n\\ be pairwise disjoint sets in \\\mathscr{S}\\, and extend them to a sequence by setting \\A\_{n+1} = A\_{n+2} = \cdots = \emptyset\\. The extended sequence is still pairwise disjoint, since \\\emptyset\\ shares no element with any set, and its union is \\A_1 \cup \cdots \cup A_n\\. So:
>
> \\ \begin{aligned} \mu(A_1 \cup \cdots \cup A_n) &= \mu\\\left(\bigcup\_{i=1}^{\infty} A_i\right) && \text{(} A_i = \emptyset \text{ for } i \> n \text{)} \\ &= \sum\_{i=1}^{\infty} \mu(A_i) && \text{(countable additivity)} \\ &= \sum\_{i=1}^{n} \mu(A_i) + \sum\_{i=n+1}^{\infty} \mu(\emptyset) && \text{(} A_i = \emptyset \text{ for } i \> n \text{)} \\ &= \sum\_{i=1}^{n} \mu(A_i) && \text{(} \mu(\emptyset) = 0 \text{)} \end{aligned} \\

The converse fails: there exist set functions that satisfy finite additivity but fail countable additivity (see [Wikipedia: Sigma-additive set function — An additive function which is not \\\sigma\\-additive](https://en.wikipedia.org/wiki/Sigma-additive_set_function#An_additive_function_which_is_not_%CF%83-additive)).

> **NOTE:**
>
> **Definition 10 (Measure)** A **measure** on a set \\S\\ with a [\\\sigma\\-algebra](#def-sigma-algebra) \\\mathscr{S}\\ is a function \\\mu\\ that assigns a value \\\mu(A) \in \[0, \infty\]\\ to each set \\A\\ in \\\mathscr{S}\\ and satisfies:
>
> - \\\mu(\emptyset) = 0\\.
> - \\\mu\\ is [countably additive](#def-countable-additivity).

A measure is also [finitely additive](#def-finite-additivity), by [Theorem 1](#thm-countable-implies-finite). A measure generalizes size: it can measure how many elements a set has, as in [Definition 11](#def-counting-measure), or how long a set of real numbers is, as [Lebesgue measure](https://en.wikipedia.org/wiki/Lebesgue_measure) does, assigning each interval \\\[a, b\]\\ its length \\b - a\\. Both appear as reference measures in the [joint-distribution form of Fubini–Tonelli](expectation.llms.md#cor-fubini-joint).

> **NOTE:**
>
> **Example 10 (Counting outcomes is a measure)** The counting function \\\mu(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{}\\ of [Example 8](#exm-finite-additivity), defined on the \\\sigma\\-algebra of all subsets of the die’s sample space ([Example 2](#exm-sigma-algebra)), takes values in \\\[0, \infty\]\\, is countably additive ([Example 9](#exm-countable-additivity)), and gives \\\mu(\emptyset) = 0\\, so it is a measure.

> **NOTE:**
>
> **Definition 11 (Counting measure)** The **counting measure** on a set \\S\\ is the [measure](#def-measure) on the \\\sigma\\-algebra of all subsets of \\S\\ that assigns each finite set its number of elements, and each infinite set the value \\\infty\\:
>
> \\ \mu(A) \stackrel{\text{def}}{=}\begin{cases} \mathopen{}\left\|A\right\|\mathclose{} & \text{if } A \text{ is finite} \\ \infty & \text{if } A \text{ is infinite} \end{cases} \\

> **NOTE:**
>
> **Example 11 (Counting measure on the non-negative integers)** For the counting measure \\\mu\\ on \\\mathopen{}\left\\0, 1, 2, \ldots\right\\\mathclose{}\\, \\\mu(\mathopen{}\left\\0, 1, 2\right\\\mathclose{}) = 3\\, and the set of even numbers has \\\mu(\mathopen{}\left\\0, 2, 4, \ldots\right\\\mathclose{}) = \infty\\. The even numbers are the union of the pairwise disjoint sets \\\mathopen{}\left\\0\right\\\mathclose{}, \mathopen{}\left\\2\right\\\mathclose{}, \mathopen{}\left\\4\right\\\mathclose{}, \ldots\\, and countable additivity agrees: \\\sum\_{k=0}^{\infty} \mu(\mathopen{}\left\\2k\right\\\mathclose{}) = 1 + 1 + \cdots = \infty\\.

> **NOTE:**
>
> **Definition 12 (Probability measure)** A **probability measure** on a [sample space](#def-sample-space) \\\Omega\\, often denoted \\\Pr()\\ or \\\operatorname{P}()\\, is a function that assigns a number \\\Pr(A)\\ to each [event](#def-event) \\A\\ and satisfies:
>
> - \\\Pr\\ is a [measure](#def-measure) on the events of \\\Omega\\.
> - The whole sample space has probability 1: \\\Pr(\Omega) = 1\\.

Many sources state this definition as three axioms instead (the Kolmogorov axioms):

1.  For any event \\A\\, \\\Pr(A) \ge 0\\.
2.  The probability of the whole sample space is 1: \\\Pr(\Omega) = 1\\
3.  \\\Pr\\ is [countably additive](#def-countable-additivity): for any [mutually exclusive](#def-mutually-exclusive) events \\A_1, A_2, \ldots\\, \\\Pr\\\left(\bigcup\_{i=1}^{\infty} A_i\right) = \sum\_{i=1}^{\infty} \Pr(A_i)\\

The two forms are equivalent. The axioms do not list \\\Pr(\emptyset) = 0\\, but they imply it: applying property 3 to \\\Omega, \emptyset, \emptyset, \ldots\\ gives \\1 = 1 + \sum\_{i=2}^{\infty} \Pr(\emptyset)\\, so \\\Pr(\emptyset) = 0\\. A probability measure is also [finitely additive](#def-finite-additivity), by [Theorem 1](#thm-countable-implies-finite). Requiring countable additivity, not just finite additivity, enables results such as the continuity of probability (if \\A_1 \supseteq A_2 \supseteq \cdots\\ with \\\bigcap_i A_i = \emptyset\\, then \\\Pr(A_i) \to 0\\), and it is what makes sums over countably infinite [partitions](#def-partition) valid.

> **NOTE:**
>
> **Example 12 (Probability measure for a fair die)** For the die roll in [Example 1](#exm-sample-space), define \\\Pr(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{} / 6\\, where \\\mathopen{}\left\|A\right\|\mathclose{}\\ is the number of outcomes in \\A\\. This function is \\1/6\\ times the measure of [Example 10](#exm-measure), so it is a [measure](#def-measure) on the events of \\\Omega\\, and it gives \\\Pr(\Omega) = 6/6 = 1\\. The event “the roll is even” from [Example 3](#exm-event) has probability \\\Pr(\mathopen{}\left\\2, 4, 6\right\\\mathclose{}) = 3/6 = 1/2\\.

> **NOTE:**
>
> **Theorem 2 (Probability of a subset’s intersection)** If \\A\\ and \\B\\ are events and \\A\subseteq B\\, then \\\Pr(A \cap B) = \Pr(A)\\.

> **NOTE:**
>
> *Proof*. Since \\A \subseteq B\\, every outcome in \\A\\ is also in \\B\\, so \\A \cap B = A\\, and therefore \\\Pr(A \cap B) = \Pr(A)\\.

> **NOTE:**
>
> **Theorem 3 (An event and its complement sum to 1)** For any event \\A\\ and its [complement](#def-complement) \\\neg A\\:
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
> *Proof*. Subtract \\\Pr(A)\\ from both sides of [Theorem 3](#thm-total-prob-1).

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
> **Example 13 (Probability of not rolling a six)** For a fair die, the event “the roll is a six” has probability \\\pi = 1/6\\, so by [Corollary 2](#cor-p-neg) the probability of not rolling a six is \\1 - 1/6 = 5/6\\.

## 2 Conditional probability

> **NOTE:**
>
> **Definition 13 (Conditional probability)** For two events \\A\\ and \\B\\ with \\\Pr(B) \> 0\\, the **conditional probability** of \\A\\ given \\B\\, denoted \\\Pr(A \mid B)\\, is:
>
> \\\Pr(A \mid B) \stackrel{\text{def}}{=}\frac{\Pr(A \cap B)}{\Pr(B)}\\

> **NOTE:**
>
> **Example 14 (Rolling a six, given an even roll)** For a fair die ([Example 12](#exm-probability)), let \\A = \mathopen{}\left\\6\right\\\mathclose{}\\ and \\B = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\. Then \\A \cap B = \mathopen{}\left\\6\right\\\mathclose{}\\, so:
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ &= \frac{1/6}{3/6} && \text{(substitute the probabilities)} \\ &= \frac{1}{3} && \text{(simplify)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 4 (Law of conditional probability)** For any two events \\A\\ and \\B\\ with \\\Pr(B) \> 0\\:
>
> \\\Pr(A \cap B) = \Pr(A \mid B) \cdot\Pr(B)\\

> **NOTE:**
>
> *Proof*. Rearranging [Definition 13](#def-conditional-prob):
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ \Pr(A \cap B) &= \Pr(A \mid B) \cdot\Pr(B) && \text{(multiply both sides by } \Pr(B) \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 15 (Applying the law of conditional probability)** Suppose 30% of adults exercise regularly (\\\Pr(E) = 0.30\\), and among adults who exercise regularly, 60% have low blood pressure (\\\Pr(L \mid E) = 0.60\\).
>
> Then, by [Theorem 4](#thm-law-conditional-prob), the probability that a randomly selected adult both exercises regularly and has low blood pressure is:
>
> \\ \begin{aligned} \Pr(L \cap E) &= \Pr(L \mid E) \cdot\Pr(E) && \text{(law of conditional probability)} \\ &= 0.60 \cdot 0.30 && \text{(substitute the given values)} \\ &= 0.18 && \text{(multiply)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 5 (Law of total probability)** If \\B_1, B_2, \ldots\\ is a [partition](#def-partition) of the sample space, with \\\Pr(B_i) \> 0\\ for every \\i\\, then for any event \\A\\:
>
> \\\Pr(A) = \sum\_{i} \Pr(A \mid B_i) \cdot\Pr(B_i)\\

> **NOTE:**
>
> *Proof*. Since \\B_1, B_2, \ldots\\ partition the sample space, the events \\A \cap B_1, A \cap B_2, \ldots\\ are mutually exclusive and their union is \\A\\. By countable additivity ([Definition 9](#def-countable-additivity)), and then by [Theorem 4](#thm-law-conditional-prob):
>
> \\ \begin{aligned} \Pr(A) &= \sum\_{i} \Pr(A \cap B_i) && \text{(countable additivity for partition of } A \text{)} \\&= \sum\_{i} \Pr(A \mid B_i) \cdot\Pr(B_i) && \text{(law of conditional probability; } \Pr(B_i) \> 0 \text{)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 6 (Bayes’ theorem)** For any two events \\A\\ and \\B\\ with \\\Pr(A) \> 0\\ and \\\Pr(B) \> 0\\:
>
> \\\Pr(A \mid B) = \frac{\Pr(B \mid A) \cdot\Pr(A)}{\Pr(B)}\\

> **NOTE:**
>
> *Proof*. By [Definition 13](#def-conditional-prob) and [Theorem 4](#thm-law-conditional-prob):
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ &= \frac{\Pr(B \cap A)}{\Pr(B)} && \text{(intersection is commutative: } A \cap B = B \cap A \text{)} \\ &= \frac{\Pr(B \mid A) \cdot\Pr(A)}{\Pr(B)} && \text{(law of conditional probability applied to } \Pr(B \cap A) \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 16 (Positive predictive value of a medical test)** Suppose a disease test has 99% sensitivity and 99% specificity, and the prevalence of the disease in the population is 7%.
>
> Let \\D\\ be the event “person has the disease” and \\+\\ be the event “test is positive”. Then:
>
> - \\\Pr(+ \mid D) = 0.99\\ (sensitivity)
> - \\\Pr(\neg + \mid \neg D) = 0.99\\ (specificity), so the false positive rate is \\\Pr(+ \mid \neg D) = 1 - 0.99 = 0.01\\
> - \\\Pr(D) = 0.07\\ (prevalence)
>
> By [Theorem 6](#thm-bayes), with the denominator expanded by the [law of total probability](#thm-total-prob) over the partition \\\\D, \neg D\\\\:
>
> \\ \begin{aligned} \Pr(D \mid +) &= \frac{\Pr(+ \mid D) \cdot\Pr(D)}{\Pr(+)} && \text{(Bayes' theorem)} \\ &= \frac{\Pr(+ \mid D) \cdot\Pr(D)}{\Pr(+ \mid D) \cdot\Pr(D) + \Pr(+ \mid \neg D) \cdot\Pr(\neg D)} && \text{(law of total probability)} \\ &= \frac{0.99 \cdot 0.07}{0.99 \cdot 0.07 + 0.01 \cdot 0.93} && \text{(substitute the given values)} \\ &= \frac{0.0693}{0.0693 + 0.0093} && \text{(multiply each term in the numerator and denominator)} \\ &= \frac{0.0693}{0.0786} && \text{(add the denominator's two terms)} \\ &\approx 0.88 && \text{(divide)} \end{aligned} \\
>
> Even with a highly accurate test (99% sensitive and 99% specific), only about 88% of people who test positive actually have the disease, because the disease prevalence is relatively low (7%).

Back to top
