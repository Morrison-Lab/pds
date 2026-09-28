# Probability basics

Code

Published

Last modified: 2026-09-28 16:32:36 (PDT)

## 1 Defining probabilities

> **NOTE:**
>
> **Definition 1 (Sample space)** The **sample space** of a random experiment, denoted \\\Omega\\, is the set of all of its possible outcomes.

> **NOTE:**
>
> **Example 1 (Sample space of a die roll)** Rolling a six-sided die once has sample space \\\Omega = \mathopen{}\left\\1, 2, 3, 4, 5, 6\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 2 (Empty set)** The **empty set**, denoted \\\emptyset\\, is the set that has no elements.

> **NOTE:**
>
> *Remark*. Other sources write \\\mathopen{}\left\\\right\\\mathclose{}\\ (see [Wikipedia: Empty set](https://en.wikipedia.org/wiki/Empty_set)). Some sources call it the **null set**, but in measure theory a “null set” usually means a set of measure zero, which need not be empty.

> **NOTE:**
>
> **Example 2 (Impossible die rolls)** For the die roll in [Example 1](#exm-sample-space), no outcome in \\\Omega = \mathopen{}\left\\1, 2, 3, 4, 5, 6\right\\\mathclose{}\\ is greater than 6, so the set of outcomes greater than 6 is \\\emptyset\\. Likewise, no roll is both even and odd, so \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{} \cap \mathopen{}\left\\1, 3, 5\right\\\mathclose{} = \emptyset\\.

> **NOTE:**
>
> **Definition 3 (\\\sigma\\-algebra)** A **\\\sigma\\-algebra** on a set \\S\\ is a collection \\\mathscr{S}\\ of subsets of \\S\\ that satisfies:
>
> - \\\mathscr{S}\\ contains \\S\\ itself.
> - For each set \\A\\ in \\\mathscr{S}\\, \\\mathscr{S}\\ contains its complement \\S \setminus A\\.
> - For each sequence \\A_1, A_2, \ldots\\ of sets in \\\mathscr{S}\\, \\\mathscr{S}\\ contains their union \\\bigcup\_{i=1}^{\infty} A_i\\.

> **NOTE:**
>
> *Remark*. Other sources call it a **\\\sigma\\-field** (see [Wikipedia: \\\sigma\\-algebra](https://en.wikipedia.org/wiki/%CE%A3-algebra)).

> **NOTE:**
>
> **Example 3 (\\\sigma\\-algebras for a die roll)** For the die roll in [Example 1](#exm-sample-space), the collection of all subsets of \\\Omega = \mathopen{}\left\\1, 2, 3, 4, 5, 6\right\\\mathclose{}\\ is a \\\sigma\\-algebra on \\\Omega\\, since complements and unions of subsets of \\\Omega\\ are again subsets of \\\Omega\\. So is the smaller collection
>
> \\\mathopen{}\left\\\emptyset, \mathopen{}\left\\2, 4, 6\right\\\mathclose{}, \mathopen{}\left\\1, 3, 5\right\\\mathclose{}, \Omega\right\\\mathclose{}\\
>
> which contains \\\Omega\\, the complement of each of its sets, and every union of its sets: for example, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{} \cup \mathopen{}\left\\1, 3, 5\right\\\mathclose{} = \Omega\\.

> **NOTE:**
>
> **Theorem 1 (Closure properties of a \\\sigma\\-algebra)** If \\\mathscr{S}\\ is a [\\\sigma\\-algebra](#def-sigma-algebra) on a set \\S\\, then \\\mathscr{S}\\ contains:
>
> - the [empty set](#def-empty-set) \\\emptyset\\;
> - the union \\A_1 \cup \cdots \cup A_n\\ of any finitely many sets \\A_1, \ldots, A_n\\ in \\\mathscr{S}\\;
> - the intersection \\\bigcap\_{i=1}^{\infty} A_i\\ of any sequence \\A_1, A_2, \ldots\\ of sets in \\\mathscr{S}\\.

> **NOTE:**
>
> *Proof*. *Empty set.* \\\mathscr{S}\\ contains \\S\\, so it contains the complement of \\S\\, which is \\S \setminus S = \emptyset\\.
>
> *Finite unions.* Extend \\A_1, \ldots, A_n\\ to a sequence by setting \\A\_{n+1} = A\_{n+2} = \cdots = \emptyset\\; each of these sets is in \\\mathscr{S}\\, by the first part. Then:
>
> \\ \begin{aligned} A_1 \cup \cdots \cup A_n &= A_1 \cup \cdots \cup A_n \cup \emptyset \cup \emptyset \cup \cdots && \text{(a union with } \emptyset \text{ adds no elements)} \\ &= \bigcup\_{i=1}^{\infty} A_i && \text{(} A_i = \emptyset \text{ for } i \> n \text{)} \end{aligned} \\
>
> and \\\mathscr{S}\\ contains \\\bigcup\_{i=1}^{\infty} A_i\\ by the union rule of [Definition 3](#def-sigma-algebra).
>
> *Countable intersections.* An element of \\S\\ is in every \\A_i\\ exactly when it is in none of the complements \\S \setminus A_i\\, so:
>
> \\ \begin{aligned} \bigcap\_{i=1}^{\infty} A_i &= S \setminus \bigcup\_{i=1}^{\infty} (S \setminus A_i) && \text{(De Morgan's law)} \end{aligned} \\
>
> Each \\S \setminus A_i\\ is in \\\mathscr{S}\\ by the complement rule, so their union is in \\\mathscr{S}\\ by the union rule, and the complement of that union is in \\\mathscr{S}\\ by the complement rule again.

> **NOTE:**
>
> **Theorem 2 (All subsets form a \\\sigma\\-algebra)** For any set \\S\\, the collection of all subsets of \\S\\ is a [\\\sigma\\-algebra](#def-sigma-algebra) on \\S\\.

> **NOTE:**
>
> *Proof*. Each condition of [Definition 3](#def-sigma-algebra) holds:
>
> - \\S\\ is a subset of itself.
> - For each subset \\A\\ of \\S\\, the complement \\S \setminus A\\ contains only elements of \\S\\, so it is a subset of \\S\\.
> - For each sequence \\A_1, A_2, \ldots\\ of subsets of \\S\\, every element of \\\bigcup\_{i=1}^{\infty} A_i\\ is in some \\A_i\\ and so in \\S\\; the union is a subset of \\S\\.

> **NOTE:**
>
> **Definition 4 (Event)** An **event** is a subset of the [sample space](#def-sample-space) \\\Omega\\: a set of outcomes.

> **NOTE:**
>
> *Remark*. When \\\Omega\\ is uncountable, such as an interval of real numbers, only the subsets in a designated [\\\sigma\\-algebra](#def-sigma-algebra) \\\mathscr{S}\\ on \\\Omega\\ count as events; every set that arises in these notes is in \\\mathscr{S}\\. When \\\Omega\\ is finite or countably infinite, every subset of \\\Omega\\ can be an event, because the collection of all subsets of \\\Omega\\ is a \\\sigma\\-algebra ([Theorem 2](#thm-power-set-sigma-algebra)), as in [Example 3](#exm-sigma-algebra).

> **NOTE:**
>
> **Example 4 (Rolling an even number)** In [Example 1](#exm-sample-space), the event “the roll is even” is \\A = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 5 (Occurrence of an event)** An [event](#def-event) \\A\\ **occurs** when the outcome of the experiment is in \\A\\, and does not occur when the outcome is not in \\A\\.

> **NOTE:**
>
> **Example 5 (Rolling a 4)** In [Example 4](#exm-event), if the die shows 4, the event “the roll is even”, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, occurs, because \\4 \in \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, and the event “the roll is at most 2”, \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\, does not occur.

> **NOTE:**
>
> **Definition 6 (Complement of an event)** The **complement** of an [event](#def-event) \\A\\, denoted \\\neg A\\, is the event that \\A\\ does not [occur](#def-occurs): the set of outcomes in the sample space \\\Omega\\ that are not in \\A\\.
>
> \\\neg A \stackrel{\text{def}}{=}\Omega \setminus A\\

> **NOTE:**
>
> *Remark*. Other sources write \\A^c\\ or \\\bar{A}\\.

> **NOTE:**
>
> **Example 6 (Rolling an odd number)** In [Example 4](#exm-event), the complement of the event “the roll is even”, \\A = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, is the event “the roll is odd”, \\\neg A = \mathopen{}\left\\1, 3, 5\right\\\mathclose{}\\.

> **NOTE:**
>
> **Definition 7 (Mutually exclusive events)** Finitely or countably many sets \\A_1, A_2, \ldots\\, such as [events](#def-event), are **mutually exclusive** (also called **disjoint**, **pairwise disjoint**, or **mutually disjoint**) when no two of them share an element:
>
> \\A_i \cap A_j = \emptyset \quad \text{for all } i \neq j\\

> **NOTE:**
>
> **Example 7 (Low and high rolls)** In [Example 1](#exm-sample-space), the events “the roll is at most 2”, \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\, and “the roll is at least 5”, \\\mathopen{}\left\\5, 6\right\\\mathclose{}\\, are mutually exclusive: no roll is in both. The events “the roll is even”, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, and “the roll is at most 2”, \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\, are not mutually exclusive: a roll of 2 is in both.

> **NOTE:**
>
> **Definition 8 (Partition of an event)** A **partition** of an [event](#def-event) \\A\\ is a finite or countably infinite collection of events \\A_1, A_2, \ldots\\ that satisfies:
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
> **Example 8 (Partitioning the die roll)** In [Example 1](#exm-sample-space), the events “the roll is even”, \\\mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\, and “the roll is odd”, \\\mathopen{}\left\\1, 3, 5\right\\\mathclose{}\\, are mutually exclusive, and their union is \\\Omega\\, so they partition the sample space. So do the six single-outcome events \\\mathopen{}\left\\1\right\\\mathclose{}, \mathopen{}\left\\2\right\\\mathclose{}, \ldots, \mathopen{}\left\\6\right\\\mathclose{}\\. The events \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\ and \\\mathopen{}\left\\5, 6\right\\\mathclose{}\\ from [Example 7](#exm-mutually-exclusive) do not partition \\\Omega\\: their union leaves out 3 and 4.

> **NOTE:**
>
> **Definition 9 (Finite additivity)** Let \\\mathscr{S}\\ be a [\\\sigma\\-algebra](#def-sigma-algebra) on a set \\S\\. A function \\\mu : \mathscr{S} \to \[0, \infty\]\\ is **finitely additive** if, for every finite collection of [pairwise disjoint](#def-mutually-exclusive) sets \\A_1, \ldots, A_n\\ in \\\mathscr{S}\\, the value of their union is the sum of their values:
>
> \\\mu(A_1 \cup \cdots \cup A_n) = \sum\_{i=1}^{n} \mu(A_i)\\

> **NOTE:**
>
> **Example 9 (Counting outcomes is finitely additive)** For the die roll in [Example 1](#exm-sample-space), let \\\mu(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{}\\, the number of outcomes in \\A\\, for each set \\A\\ in the \\\sigma\\-algebra of all subsets of \\\Omega\\ ([Example 3](#exm-sigma-algebra)). The events \\\mathopen{}\left\\1, 2\right\\\mathclose{}\\ and \\\mathopen{}\left\\5, 6\right\\\mathclose{}\\ are mutually exclusive ([Example 7](#exm-mutually-exclusive)), and:
>
> \\ \begin{aligned} \mu(\mathopen{}\left\\1, 2\right\\\mathclose{} \cup \mathopen{}\left\\5, 6\right\\\mathclose{}) &= \mu(\mathopen{}\left\\1, 2, 5, 6\right\\\mathclose{}) && \text{(take the union)} \\ &= 4 && \text{(count the outcomes)} \\ &= 2 + 2 && \text{(write 4 as a sum)} \\ &= \mu(\mathopen{}\left\\1, 2\right\\\mathclose{}) + \mu(\mathopen{}\left\\5, 6\right\\\mathclose{}) && \text{(count each event's outcomes)} \end{aligned} \\
>
> The same holds for any mutually exclusive events, because the sizes of disjoint sets add, so \\\mu\\ is finitely additive.

> **NOTE:**
>
> **Definition 10 (Countable additivity)** Let \\\mathscr{S}\\ be a [\\\sigma\\-algebra](#def-sigma-algebra) on a set \\S\\. A function \\\mu : \mathscr{S} \to \[0, \infty\]\\ is **countably additive** (also called **\\\sigma\\-additive**) if, for every sequence of [pairwise disjoint](#def-mutually-exclusive) sets \\A_1, A_2, \ldots\\ in \\\mathscr{S}\\, the value of their union is the sum of their values:
>
> \\\mu\\\left(\bigcup\_{i=1}^{\infty} A_i\right) = \sum\_{i=1}^{\infty} \mu(A_i)\\

> **NOTE:**
>
> **Example 10 (Counting outcomes is countably additive)** For the counting function \\\mu(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{}\\ of [Example 9](#exm-finite-additivity), take any sequence of pairwise disjoint events \\A_1, A_2, \ldots\\. No two of them share an outcome, and \\\Omega\\ has only six outcomes, so at most six of the \\A_i\\ contain any outcomes; the rest are \\\emptyset\\, with \\\mu(\emptyset) = 0\\. The infinite sum therefore has at most six nonzero terms, and finite additivity ([Example 9](#exm-finite-additivity)) shows that those terms add up to \\\mu\\ of the union. So \\\mu\\ is countably additive.

> **NOTE:**
>
> **Lemma 1 (Sums of non-negative terms)** Let \\a_1, a_2, \ldots\\ be values in \\\[0, \infty\]\\, with partial sums \\s_n \stackrel{\text{def}}{=}\sum\_{i=1}^{n} a_i\\, where \\x + \infty = \infty\\ for every \\x\\ in \\\[0, \infty\]\\. Then the partial sums are non-decreasing, \\s_1 \le s_2 \le \cdots\\, so their limit, the sum \\\sum\_{i=1}^{\infty} a_i = \lim\_{n \to \infty} s_n\\, always exists, and it is either a finite number or \\\infty\\.

> **NOTE:**
>
> *Proof*. For each \\n\\:
>
> \\ \begin{aligned} s\_{n+1} &= s_n + a\_{n+1} && \text{(definition of } s\_{n+1} \text{)} \\ &\ge s_n && \text{(} a\_{n+1} \ge 0 \text{)} \end{aligned} \\
>
> If some partial sum \\s_N\\ is \\\infty\\, then \\s_n = \infty\\ for every \\n \ge N\\, so the limit is \\\infty\\. Otherwise, the partial sums form a non-decreasing sequence of real numbers. If that sequence is bounded above, it converges to a finite number (see [Wikipedia: Monotone convergence theorem](https://en.wikipedia.org/wiki/Monotone_convergence_theorem)). If it is not bounded above, then for every number \\M\\ some \\s_N\\ exceeds \\M\\, and so does every later \\s_n \ge s_N\\; the limit is \\\infty\\.

> **NOTE:**
>
> *Remark*. By [Lemma 1](#lem-nonneg-series), the right-hand side of the equation in [Definition 10](#def-countable-additivity) always has a value.

> **NOTE:**
>
> **Lemma 2 (Countable additivity and the empty set)** If \\\mu\\ is a [countably additive](#def-countable-additivity) function on a [\\\sigma\\-algebra](#def-sigma-algebra) \\\mathscr{S}\\, then \\\mu(\emptyset) = 0\\ or \\\mu(\emptyset) = \infty\\.

> **NOTE:**
>
> *Proof*. The set \\\emptyset = S \setminus S\\ is in \\\mathscr{S}\\, as the complement of \\S\\, and the sequence \\\emptyset, \emptyset, \ldots\\ is pairwise disjoint with union \\\emptyset\\, so:
>
> \\ \begin{aligned} \mu(\emptyset) &= \mu\\\left(\bigcup\_{i=1}^{\infty} \emptyset\right) && \text{(the union of copies of } \emptyset \text{ is } \emptyset \text{)} \\ &= \sum\_{i=1}^{\infty} \mu(\emptyset) && \text{(countable additivity)} \end{aligned} \\
>
> If \\\mu(\emptyset) = c\\ for a finite \\c \> 0\\, the right-hand side is \\c + c + \cdots = \infty \neq c\\, a contradiction. So \\\mu(\emptyset)\\ is 0 or \\\infty\\.

> **NOTE:**
>
> **Example 11 (A countably additive function with \\\mu(\emptyset) = 0\\)** The counting function \\\mu(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{}\\ of [Example 10](#exm-countable-additivity) is countably additive, and:
>
> \\ \begin{aligned} \mu(\emptyset) &= \mathopen{}\left\|\emptyset\right\|\mathclose{} && \text{(definition of } \mu \text{)} \\ &= 0 && \text{(} \emptyset \text{ has no outcomes)} \end{aligned} \\

> **NOTE:**
>
> **Example 12 (A countably additive function with \\\mu(\emptyset) = \infty\\)** For the die roll in [Example 1](#exm-sample-space), let \\\mu(A) \stackrel{\text{def}}{=}\infty\\ for every set \\A\\ in the \\\sigma\\-algebra of all subsets of \\\Omega\\ ([Example 3](#exm-sigma-algebra)), including \\A = \emptyset\\. For any sequence of pairwise disjoint events \\A_1, A_2, \ldots\\, the left-hand side of the countable additivity equation is:
>
> \\ \begin{aligned} \mu\\\left(\bigcup\_{i=1}^{\infty} A_i\right) &= \infty && \text{(definition of } \mu \text{)} \end{aligned} \\
>
> and the right-hand side, the limit of its partial sums ([Lemma 1](#lem-nonneg-series)), is:
>
> \\ \begin{aligned} \sum\_{i=1}^{\infty} \mu(A_i) &= \infty + \infty + \cdots && \text{(definition of } \mu \text{)} \\ &= \infty && \text{(every partial sum is } \infty \text{)} \end{aligned} \\
>
> The two sides agree, so \\\mu\\ is countably additive, and \\\mu(\emptyset) = \infty\\.

> **NOTE:**
>
> *Remark*. [Example 11](#exm-empty-set-zero) and [Example 12](#exm-empty-set-infinity) show that both values allowed by [Lemma 2](#lem-countable-additivity-empty) occur. So \\\mu(\emptyset) = 0\\ is an extra requirement, not a consequence of countable additivity.

> **NOTE:**
>
> **Theorem 3 (Countable additivity implies finite additivity)** If \\\mu\\ is a [countably additive](#def-countable-additivity) function on a [\\\sigma\\-algebra](#def-sigma-algebra) \\\mathscr{S}\\, and \\\mu(\emptyset) = 0\\, then \\\mu\\ is [finitely additive](#def-finite-additivity).

> **NOTE:**
>
> *Proof*. Let \\A_1, \ldots, A_n\\ be pairwise disjoint sets in \\\mathscr{S}\\, and extend them to a sequence by setting \\A\_{n+1} = A\_{n+2} = \cdots = \emptyset\\. The extended sequence is still pairwise disjoint, since \\\emptyset\\ shares no element with any set, and its union is \\A_1 \cup \cdots \cup A_n\\. So:
>
> \\ \begin{aligned} \mu(A_1 \cup \cdots \cup A_n) &= \mu\\\left(\bigcup\_{i=1}^{\infty} A_i\right) && \text{(} A_i = \emptyset \text{ for } i \> n \text{)} \\ &= \sum\_{i=1}^{\infty} \mu(A_i) && \text{(countable additivity)} \\ &= \sum\_{i=1}^{n} \mu(A_i) + \sum\_{i=n+1}^{\infty} \mu(\emptyset) && \text{(} A_i = \emptyset \text{ for } i \> n \text{)} \\ &= \sum\_{i=1}^{n} \mu(A_i) && \text{(} \mu(\emptyset) = 0 \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 13 (Finitely additive but not countably additive)** Let \\S = \mathopen{}\left\\0, 1, 2, \ldots\right\\\mathclose{}\\, with the \\\sigma\\-algebra of all subsets of \\S\\ ([Theorem 2](#thm-power-set-sigma-algebra)), and define:
>
> \\ \mu(A) \stackrel{\text{def}}{=}\begin{cases} 0 & \text{if } A \text{ is finite} \\ \infty & \text{if } A \text{ is infinite} \end{cases} \\
>
> *\\\mu\\ is finitely additive.* Let \\A_1, \ldots, A_n\\ be pairwise disjoint subsets of \\S\\. If every \\A_i\\ is finite, then so is their union, and:
>
> \\ \begin{aligned} \mu(A_1 \cup \cdots \cup A_n) &= 0 && \text{(a finite union of finite sets is finite)} \\ &= \sum\_{i=1}^{n} 0 && \text{(a sum of zeros is 0)} \\ &= \sum\_{i=1}^{n} \mu(A_i) && \text{(each } A_i \text{ is finite)} \end{aligned} \\
>
> If some \\A_k\\ is infinite, then the union, which contains \\A_k\\, is infinite too, and:
>
> \\ \begin{aligned} \mu(A_1 \cup \cdots \cup A_n) &= \infty && \text{(the union is infinite)} \\ &= \mu(A_k) + \sum\_{i \neq k} \mu(A_i) && \text{(} \mu(A_k) = \infty \text{, and } \infty + x = \infty \text{)} \\ &= \sum\_{i=1}^{n} \mu(A_i) && \text{(regroup the terms)} \end{aligned} \\
>
> *\\\mu\\ is not countably additive.* The single-element sets \\\mathopen{}\left\\0\right\\\mathclose{}, \mathopen{}\left\\1\right\\\mathclose{}, \mathopen{}\left\\2\right\\\mathclose{}, \ldots\\ are pairwise disjoint, and their union is \\S\\, which is infinite. So:
>
> \\ \begin{aligned} \mu\\\left(\bigcup\_{k=0}^{\infty} \mathopen{}\left\\k\right\\\mathclose{}\right) &= \mu(S) && \text{(the union is } S \text{)} \\ &= \infty && \text{(} S \text{ is infinite)} \end{aligned} \\
>
> but:
>
> \\ \begin{aligned} \sum\_{k=0}^{\infty} \mu(\mathopen{}\left\\k\right\\\mathclose{}) &= 0 + 0 + \cdots && \text{(each } \mathopen{}\left\\k\right\\\mathclose{} \text{ is finite)} \\ &= 0 && \text{(every partial sum is 0)} \end{aligned} \\

> **NOTE:**
>
> *Remark*. [Example 13](#exm-finite-not-countable) shows that the converse of [Theorem 3](#thm-countable-implies-finite) fails, even when \\\mu(\emptyset) = 0\\: a finitely additive function need not be countably additive (see [Wikipedia: Sigma-additive set function — An additive function which is not \\\sigma\\-additive](https://en.wikipedia.org/wiki/Sigma-additive_set_function#An_additive_function_which_is_not_%CF%83-additive)).

> **NOTE:**
>
> **Definition 11 (Measure)** A **measure** on a set \\S\\ with a [\\\sigma\\-algebra](#def-sigma-algebra) \\\mathscr{S}\\ is a function \\\mu : \mathscr{S} \to \[0, \infty\]\\ that satisfies:
>
> - \\\mu(\emptyset) = 0\\.
> - \\\mu\\ is [countably additive](#def-countable-additivity).

> **NOTE:**
>
> **Example 14 (Counting outcomes is a measure)** The counting function \\\mu(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{}\\ of [Example 9](#exm-finite-additivity), defined on the \\\sigma\\-algebra of all subsets of the die’s sample space ([Example 3](#exm-sigma-algebra)), takes values in \\\[0, \infty\]\\, is countably additive ([Example 10](#exm-countable-additivity)), and gives \\\mu(\emptyset) = 0\\, so it is a measure.

> **NOTE:**
>
> **Corollary 1 (Measures are finitely additive)** Every [measure](#def-measure) is [finitely additive](#def-finite-additivity).

> **NOTE:**
>
> *Proof*. A measure \\\mu\\ is countably additive and has \\\mu(\emptyset) = 0\\ ([Definition 11](#def-measure)), so [Theorem 3](#thm-countable-implies-finite) applies to it.

> **NOTE:**
>
> **Definition 12 (Counting measure)** The **counting measure** on a set \\S\\ is the [measure](#def-measure) on the [\\\sigma\\-algebra of all subsets of \\S\\](#thm-power-set-sigma-algebra) that assigns each finite set its number of elements, and each infinite set the value \\\infty\\:
>
> \\ \mu(A) \stackrel{\text{def}}{=}\begin{cases} \mathopen{}\left\|A\right\|\mathclose{} & \text{if } A \text{ is finite} \\ \infty & \text{if } A \text{ is infinite} \end{cases} \\

> **NOTE:**
>
> **Example 15 (Counting measure on the non-negative integers)** For the counting measure \\\mu\\ on \\\mathopen{}\left\\0, 1, 2, \ldots\right\\\mathclose{}\\, \\\mu(\mathopen{}\left\\0, 1, 2\right\\\mathclose{}) = 3\\, and the set of even numbers has \\\mu(\mathopen{}\left\\0, 2, 4, \ldots\right\\\mathclose{}) = \infty\\. The even numbers are the union of the pairwise disjoint sets \\\mathopen{}\left\\0\right\\\mathclose{}, \mathopen{}\left\\2\right\\\mathclose{}, \mathopen{}\left\\4\right\\\mathclose{}, \ldots\\, and countable additivity agrees: \\\sum\_{k=0}^{\infty} \mu(\mathopen{}\left\\2k\right\\\mathclose{}) = 1 + 1 + \cdots = \infty\\.

> **NOTE:**
>
> *Remark*. A [measure](#def-measure) generalizes size: it can measure how many elements a set has, as in [Definition 12](#def-counting-measure), or how long a set of real numbers is, as [Lebesgue measure](https://en.wikipedia.org/wiki/Lebesgue_measure) does, assigning each interval \\\[a, b\]\\ its length \\b - a\\. Both appear as reference measures in the [joint-distribution form of Fubini–Tonelli](expectation.llms.md#cor-fubini-joint).

> **NOTE:**
>
> **Definition 13 (Probability measure)** A **probability measure** on a [sample space](#def-sample-space) \\\Omega\\, often denoted \\\Pr()\\ or \\\operatorname{P}()\\, is a [measure](#def-measure) on the [events](#def-event) of \\\Omega\\ that gives the whole sample space probability 1:
>
> \\\Pr(\Omega) = 1\\

> **NOTE:**
>
> **Example 16 (Probability measure for a fair die)** For the die roll in [Example 1](#exm-sample-space), define \\\Pr(A) \stackrel{\text{def}}{=}\mathopen{}\left\|A\right\|\mathclose{} / 6\\, where \\\mathopen{}\left\|A\right\|\mathclose{}\\ is the number of outcomes in \\A\\. This function is \\1/6\\ times the measure of [Example 14](#exm-measure), so it is a [measure](#def-measure) on the events of \\\Omega\\, and it gives \\\Pr(\Omega) = 6/6 = 1\\. The event “the roll is even” from [Example 4](#exm-event) has probability \\\Pr(\mathopen{}\left\\2, 4, 6\right\\\mathclose{}) = 3/6 = 1/2\\.

> **NOTE:**
>
> **Corollary 2 (Probability measures are finitely additive)** Every [probability measure](#def-probability) is [finitely additive](#def-finite-additivity): for any [mutually exclusive](#def-mutually-exclusive) events \\A_1, \ldots, A_n\\,
>
> \\\Pr(A_1 \cup \cdots \cup A_n) = \sum\_{i=1}^{n} \Pr(A_i)\\

> **NOTE:**
>
> *Proof*. A probability measure is a measure ([Definition 13](#def-probability)), so [Corollary 1](#cor-measure-finitely-additive) applies to it.

> **NOTE:**
>
> **Theorem 4 (Continuity of probability)** If \\A_1 \supseteq A_2 \supseteq \cdots\\ are events with \\\bigcap\_{i=1}^{\infty} A_i = \emptyset\\, then:
>
> \\\lim\_{n \to \infty} \Pr(A_n) = 0\\

> **NOTE:**
>
> *Proof*. For each \\i\\, let \\B_i \stackrel{\text{def}}{=}A_i \setminus A\_{i+1}\\, the outcomes in \\A_i\\ but not in \\A\_{i+1}\\. Each \\B_i = A_i \cap (\Omega \setminus A\_{i+1})\\ is an event, by [Theorem 1](#thm-sigma-algebra-closure).
>
> *The \\B_i\\ are pairwise disjoint.* For \\i \< j\\, \\B_j \subseteq A_j \subseteq A\_{i+1}\\, while \\B_i\\ has no outcomes in \\A\_{i+1}\\, so \\B_i \cap B_j = \emptyset\\.
>
> *\\A_n = \bigcup\_{i=n}^{\infty} B_i\\ for each \\n\\.* For \\i \ge n\\, \\B_i \subseteq A_i \subseteq A_n\\, so the union is contained in \\A_n\\. Conversely, let \\\omega \in A_n\\. Since \\\bigcap\_{i} A_i = \emptyset\\, \\\omega\\ is not in every \\A_i\\; since the \\A_i\\ are nested, the indices \\i\\ with \\\omega \in A_i\\ are \\1, \ldots, m\\ for some \\m \ge n\\. Then \\\omega \in A_m\\ and \\\omega \notin A\_{m+1}\\, so \\\omega \in B_m\\.
>
> *\\\Pr(A_1)\\ is finite.* The events \\A_1\\ and \\\Omega \setminus A_1\\ are disjoint with union \\\Omega\\, so [Corollary 2](#cor-probability-finitely-additive) applies to them:
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
> *Remark*. Requiring countable additivity, not just finite additivity, enables results such as [Theorem 4](#thm-continuity-probability), and it is what makes sums over countably infinite [partitions](#def-partition) valid.

> **NOTE:**
>
> **Theorem 5 (Kolmogorov axioms)** A function \\\Pr\\ that assigns a real number \\\Pr(A)\\ to each [event](#def-event) \\A\\ of a sample space \\\Omega\\ is a [probability measure](#def-probability) if and only if it satisfies:
>
> 1.  For any event \\A\\, \\\Pr(A) \ge 0\\.
> 2.  The probability of the whole sample space is 1: \\\Pr(\Omega) = 1\\
> 3.  \\\Pr\\ is [countably additive](#def-countable-additivity): for any [mutually exclusive](#def-mutually-exclusive) events \\A_1, A_2, \ldots\\, \\\Pr\\\left(\bigcup\_{i=1}^{\infty} A_i\right) = \sum\_{i=1}^{\infty} \Pr(A_i)\\

> **NOTE:**
>
> *Proof*. Suppose \\\Pr\\ is a probability measure. It is a [measure](#def-measure), so its values lie in \\\[0, \infty\]\\, which gives axiom 1, and it is countably additive, which is axiom 3. Axiom 2 is the condition \\\Pr(\Omega) = 1\\ in [Definition 13](#def-probability).
>
> Conversely, suppose \\\Pr\\ satisfies the three axioms. By axiom 1, \\\Pr\\ takes values in \\\[0, \infty\]\\, so axiom 3 says \\\Pr\\ is countably additive in the sense of [Definition 10](#def-countable-additivity). Then, by [Lemma 2](#lem-countable-additivity-empty), \\\Pr(\emptyset)\\ is 0 or \\\infty\\; \\\Pr(\emptyset)\\ is a real number, so \\\Pr(\emptyset) = 0\\. So \\\Pr\\ satisfies both conditions of [Definition 11](#def-measure) (\\\Pr(\emptyset) = 0\\ and countable additivity) and is a measure on the events of \\\Omega\\. With axiom 2, \\\Pr\\ is a probability measure ([Definition 13](#def-probability)).

> **NOTE:**
>
> *Remark*. Many sources define a probability measure by these three axioms instead; the theorem shows that the two definitions agree. The axioms are named for Kolmogorov, who introduced them in 1933 (see [Wikipedia: Probability axioms](https://en.wikipedia.org/wiki/Probability_axioms)). The axiom form does not list \\\Pr(\emptyset) = 0\\; the proof above derives it.

> **NOTE:**
>
> **Theorem 6 (Probability of a subset’s intersection)** If \\A\\ and \\B\\ are events and \\A\subseteq B\\, then \\\Pr(A \cap B) = \Pr(A)\\.

> **NOTE:**
>
> *Proof*. Since \\A \subseteq B\\, every outcome in \\A\\ is also in \\B\\, so \\A \cap B = A\\, and therefore \\\Pr(A \cap B) = \Pr(A)\\.

> **NOTE:**
>
> **Theorem 7 (An event and its complement sum to 1)** For any event \\A\\ and its [complement](#def-complement) \\\neg A\\:
>
> \\\Pr(A) + \Pr(\neg A) = 1\\

> **NOTE:**
>
> *Proof*. The events \\A\\ and \\\neg A\\ are disjoint, and their union is \\\Omega\\.
>
> \\ \begin{aligned} \Pr(A) + \Pr(\neg A) &= \Pr(A \cup \neg A) && \text{(additivity of probability for disjoint events)} \\ &= \Pr(\Omega) && \text{(} A \cup \neg A = \Omega \text{)} \\ &= 1 && \text{(probability of the sample space is 1)} \end{aligned} \\

> **NOTE:**
>
> **Corollary 3 (Complement rule)** For any event \\A\\:
>
> \\\Pr(\neg A) = 1 - \Pr(A)\\

> **NOTE:**
>
> *Proof*. Subtract \\\Pr(A)\\ from both sides of [Theorem 7](#thm-total-prob-1).

> **NOTE:**
>
> **Corollary 4 (Complement rule in probability (\\\pi\\) notation)** If the probability of an event \\A\\ is \\\Pr(A)=\pi\\, then the probability that \\A\\ does not occur is:
>
> \\\Pr(\neg A)= 1 - \pi\\

> **NOTE:**
>
> *Proof*. \\ \begin{aligned} \Pr(\neg A) &= 1 - \Pr(A) && \text{(complement rule)} \\ &= 1 - \pi && \text{(substitute } \Pr(A) = \pi \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 17 (Probability of not rolling a six)** For a fair die, the event “the roll is a six” has probability \\\pi = 1/6\\, so by [Corollary 4](#cor-p-neg) the probability of not rolling a six is \\1 - 1/6 = 5/6\\.

## 2 Conditional probability

> **NOTE:**
>
> **Definition 14 (Conditional probability)** For two events \\A\\ and \\B\\ with \\\Pr(B) \> 0\\, the **conditional probability** of \\A\\ given \\B\\, denoted \\\Pr(A \mid B)\\, is:
>
> \\\Pr(A \mid B) \stackrel{\text{def}}{=}\frac{\Pr(A \cap B)}{\Pr(B)}\\

> **NOTE:**
>
> **Example 18 (Rolling a six, given an even roll)** For a fair die ([Example 16](#exm-probability)), let \\A = \mathopen{}\left\\6\right\\\mathclose{}\\ and \\B = \mathopen{}\left\\2, 4, 6\right\\\mathclose{}\\. Then \\A \cap B = \mathopen{}\left\\6\right\\\mathclose{}\\, so:
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ &= \frac{1/6}{3/6} && \text{(substitute the probabilities)} \\ &= \frac{1}{3} && \text{(simplify)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 8 (Law of conditional probability)** For any two events \\A\\ and \\B\\ with \\\Pr(B) \> 0\\:
>
> \\\Pr(A \cap B) = \Pr(A \mid B) \cdot\Pr(B)\\

> **NOTE:**
>
> *Proof*. Rearranging [Definition 14](#def-conditional-prob):
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ \Pr(A \cap B) &= \Pr(A \mid B) \cdot\Pr(B) && \text{(multiply both sides by } \Pr(B) \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 19 (Applying the law of conditional probability)** Suppose 30% of adults exercise regularly (\\\Pr(E) = 0.30\\), and among adults who exercise regularly, 60% have low blood pressure (\\\Pr(L \mid E) = 0.60\\).
>
> Then, by [Theorem 8](#thm-law-conditional-prob), the probability that a randomly selected adult both exercises regularly and has low blood pressure is:
>
> \\ \begin{aligned} \Pr(L \cap E) &= \Pr(L \mid E) \cdot\Pr(E) && \text{(law of conditional probability)} \\ &= 0.60 \cdot 0.30 && \text{(substitute the given values)} \\ &= 0.18 && \text{(multiply)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 9 (Law of total probability)** If \\B_1, B_2, \ldots\\ is a [partition](#def-partition) of the sample space, with \\\Pr(B_i) \> 0\\ for every \\i\\, then for any event \\A\\:
>
> \\\Pr(A) = \sum\_{i} \Pr(A \mid B_i) \cdot\Pr(B_i)\\

> **NOTE:**
>
> *Proof*. Since \\B_1, B_2, \ldots\\ partition the sample space, the events \\A \cap B_1, A \cap B_2, \ldots\\ are mutually exclusive and their union is \\A\\. By countable additivity ([Definition 10](#def-countable-additivity)), and then by [Theorem 8](#thm-law-conditional-prob):
>
> \\ \begin{aligned} \Pr(A) &= \sum\_{i} \Pr(A \cap B_i) && \text{(countable additivity for partition of } A \text{)} \\&= \sum\_{i} \Pr(A \mid B_i) \cdot\Pr(B_i) && \text{(law of conditional probability; } \Pr(B_i) \> 0 \text{)} \end{aligned} \\

> **NOTE:**
>
> **Theorem 10 (Bayes’ theorem)** For any two events \\A\\ and \\B\\ with \\\Pr(A) \> 0\\ and \\\Pr(B) \> 0\\:
>
> \\\Pr(A \mid B) = \frac{\Pr(B \mid A) \cdot\Pr(A)}{\Pr(B)}\\

> **NOTE:**
>
> *Proof*. By [Definition 14](#def-conditional-prob) and [Theorem 8](#thm-law-conditional-prob):
>
> \\ \begin{aligned} \Pr(A \mid B) &= \frac{\Pr(A \cap B)}{\Pr(B)} && \text{(definition of conditional probability)} \\ &= \frac{\Pr(B \cap A)}{\Pr(B)} && \text{(intersection is commutative: } A \cap B = B \cap A \text{)} \\ &= \frac{\Pr(B \mid A) \cdot\Pr(A)}{\Pr(B)} && \text{(law of conditional probability applied to } \Pr(B \cap A) \text{)} \end{aligned} \\

> **NOTE:**
>
> **Example 20 (Positive predictive value of a medical test)** Suppose a disease test has 99% sensitivity and 99% specificity, and the prevalence of the disease in the population is 7%.
>
> Let \\D\\ be the event “person has the disease” and \\+\\ be the event “test is positive”. Then:
>
> - \\\Pr(+ \mid D) = 0.99\\ (sensitivity)
> - \\\Pr(\neg + \mid \neg D) = 0.99\\ (specificity), so the false positive rate is \\\Pr(+ \mid \neg D) = 1 - 0.99 = 0.01\\
> - \\\Pr(D) = 0.07\\ (prevalence)
>
> By [Theorem 10](#thm-bayes), with the denominator expanded by the [law of total probability](#thm-total-prob) over the partition \\\\D, \neg D\\\\:
>
> \\ \begin{aligned} \Pr(D \mid +) &= \frac{\Pr(+ \mid D) \cdot\Pr(D)}{\Pr(+)} && \text{(Bayes' theorem)} \\ &= \frac{\Pr(+ \mid D) \cdot\Pr(D)}{\Pr(+ \mid D) \cdot\Pr(D) + \Pr(+ \mid \neg D) \cdot\Pr(\neg D)} && \text{(law of total probability)} \\ &= \frac{0.99 \cdot 0.07}{0.99 \cdot 0.07 + 0.01 \cdot 0.93} && \text{(substitute the given values)} \\ &= \frac{0.0693}{0.0693 + 0.0093} && \text{(multiply each term in the numerator and denominator)} \\ &= \frac{0.0693}{0.0786} && \text{(add the denominator's two terms)} \\ &\approx 0.88 && \text{(divide)} \end{aligned} \\
>
> Even with a highly accurate test (99% sensitive and 99% specific), only about 88% of people who test positive actually have the disease, because the disease prevalence is relatively low (7%).

> **TIP:**
>
> Hutchinson’s [Probability Refresher](https://facultyweb.cs.wwu.edu/~hutchib2/video_lectures/data371/#probability_refresher) (27 min) covers conditional distributions, the law of total probability, the chain rule of probability, and Bayes’ rule ([Hutchinson, n.d.](#ref-hutchinson_wwu_ml_videos)). The login for the video site is posted [on Canvas](https://wwu.instructure.com/courses/1906010/modules#module_3922392).

## References

Hutchinson, Brian. n.d. *DATA 471/571 (Machine Learning) and CSCI 481/581 (Deep Learning) Video Lectures*. Western Washington University. Accessed September 28, 2026. <https://facultyweb.cs.wwu.edu/~hutchib2/video_lectures/data371/>.

Back to top
