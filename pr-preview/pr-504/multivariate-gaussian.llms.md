# The multivariate Gaussian distribution

Code

Published

Last modified: 2026-11-28 01:06:01 (PST)

> **NOTE:**
>
> **Definition 1 (Multivariate normal distribution (multivariate Gaussian distribution))** A $p \times 1$ random vector $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= {(X_1, \ldots, X_p)}^{\top}$ has the **multivariate normal distribution** (or **multivariate Gaussian distribution**) with mean parameter $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}} \in \mathbb{R}^p$ and variance parameter $\mathbf{\Sigma}$, a $p \times p$ [positive definite](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-positive-definite) matrix, written $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$, if $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ has joint density:
>
> $$\mathbb{p}(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}) \stackrel{\text{def}}{=}
> \frac{1}{(2\pi)^{p/2} \det(\mathbf{\Sigma})^{1/2}}
> \text{e}^{-\frac{1}{2} {(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}^{\top} \mathbf{\Sigma}^{-1} (\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})},
> \quad \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}\in \mathbb{R}^p$$
>
> where $\det(\mathbf{\Sigma})$ is the [determinant](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-determinant) of $\mathbf{\Sigma}$ and $\mathbf{\Sigma}^{-1}$ is its [inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-matrix-inverse).

> **NOTE:**
>
> **Example 1 (A bivariate Gaussian density)** Let $p = 2$, $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{0}}\vphantom{0}}$, and $\mathbf{\Sigma} = \begin{pmatrix}1 & 0.8 \\ 0.8 & 1\end{pmatrix}$. Then $\det(\mathbf{\Sigma}) = 1 - 0.8^2 = 0.36$, so the [density](random-variables.llms.md#def-pdf) of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_2\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{0}}\vphantom{0}}, \mathbf{\Sigma}\right)\mathclose{}$ ([multivariate Gaussian](#def-mvn)) at the [mean](expectation.llms.md#def-expectation), which is also its peak, is:
>
> $$\begin{aligned}
> {\mathbb{p}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{0}}\vphantom{0}}\right)\mathclose{}}
> &= \frac{1}{2\pi \cdot 0.36^{1/2}}
> \text{e}^{0}
> && \text{(substitute into the multivariate normal density)} \\
> &= \frac{1}{0.6 \cdot 2\pi}
> && \text{(simplify)}
> \end{aligned}$$
>
> which is about 0.265. The density is a bell-shaped surface over the $(x_1, x_2)$ plane ([Figure 1](#fig-mvn-bivariate-3d)). Because $\mathbf{\Sigma}_{12} = 0.8 > 0$, the surface is stretched along the line $x_2 = x_1$.
>
> > **NOTE:**
> >
> > Show code
> >
> > ``` js
> > viewof mbMean1 = Inputs.range([-2, 2], {value: 0, step: 0.1, label: "mean of X1"})
> > viewof mbMean2 = Inputs.range([-2, 2], {value: 0, step: 0.1, label: "mean of X2"})
> > viewof mbVar1 = Inputs.range([0.2, 3], {value: 1, step: 0.05, label: "variance of X1"})
> > viewof mbVar2 = Inputs.range([0.2, 3], {value: 1, step: 0.05, label: "variance of X2"})
> > viewof mbCor = Inputs.range([-0.95, 0.95], {value: 0.8, step: 0.05, label: "correlation"})
> > ```
> >
> > Show code
> >
> > ``` js
> > mbCov = mbCor * Math.sqrt(mbVar1 * mbVar2)
> > mbPeak = 1 / (2 * Math.PI * Math.sqrt(mbVar1 * mbVar2 - mbCov * mbCov))
> > md`Covariance: ${mbCov.toFixed(3)}. Density at the mean: ${mbPeak.toFixed(3)}.`
> > ```
> >
> > Show code
> >
> > ``` js
> > mbPlotly = require("https://cdn.plot.ly/plotly-2.35.2.min.js")
> > // The grid of x1 and x2 values, from -3 to 3.
> > mbGrid = d3.range(101).map((i) => -3 + 6 * i / 100)
> > ```
> >
> > Show code
> >
> > ``` js
> > // One div that every redraw reuses, so a rotated view stays rotated.
> > mbDiv = html`<div role="img" aria-label="Surface plot of a bivariate Gaussian density over x1 and x2, redrawn for the means, variances and correlation chosen with the sliders. At the starting values it is a single bell-shaped peak of height about 0.265 at the origin, stretched along the line x2 = x1." style="width:100%;height:450px"></div>`
> > ```
> >
> > Show code
> >
> > ``` js
> > {
> >   // The density over the grid; row j holds x2 = mbGrid[j], as plotly expects.
> >   const det = mbVar1 * mbVar2 - mbCov * mbCov;
> >   const z = mbGrid.map((x2) => mbGrid.map((x1) => {
> >     const d1 = x1 - mbMean1;
> >     const d2 = x2 - mbMean2;
> >     const quad = (mbVar2 * d1 * d1 - 2 * mbCov * d1 * d2 + mbVar1 * d2 * d2) / det;
> >     return mbPeak * Math.exp(-quad / 2);
> >   }));
> >   const surface = {
> >     type: "surface", x: mbGrid, y: mbGrid, z: z,
> >     colorscale: [[0, "#CCE0F0"], [1, "#0072B2"]],
> >     showscale: false, opacity: 0.9
> >   };
> >   const layout = {
> >     // A constant uirevision keeps the reader's camera angle across redraws.
> >     uirevision: "keep",
> >     margin: {l: 0, r: 0, t: 0, b: 0},
> >     scene: {
> >       aspectmode: "cube",
> >       xaxis: {title: {text: "x1"}},
> >       yaxis: {title: {text: "x2"}},
> >       zaxis: {title: {text: "density"}},
> >       camera: {eye: {x: 1.6, y: -1.6, z: 0.9}}
> >     }
> >   };
> >   mbPlotly.react(mbDiv, [surface], layout);
> > }
> > ```
> >
> > Figure 1: The [density](random-variables.llms.md#def-pdf) of $\operatorname{N}_2\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{0}}\vphantom{0}}, \mathbf{\Sigma}\right)\mathclose{}$ in the example, with [variances](variance-covariance.llms.md#def-variance) $1$ and [covariance](variance-covariance.llms.md#def-cov) $0.8$. Its horizontal slices are ellipses stretched along $x_2 = x_1$.

> **NOTE:**
>
> *Remark*. A joint density of $p$ random variables is the $p$-variable analogue of a [joint density](random-variables.llms.md#def-joint-pdf) of two: a non-negative function on $\mathbb{R}^p$ whose integral over any region $A \subseteq \mathbb{R}^p$ is $\Pr(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\in A)$.
>
> The density is well defined because $\mathbf{\Sigma}$ is positive definite:
>
> - $\mathbf{\Sigma}^{-1}$ exists ([positive definite matrices have positive definite inverses](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#thm-pd-inverse)), and
> - $\det(\mathbf{\Sigma}) > 0$ ([positive definite matrices have positive determinants](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#cor-det-pd)), so its square root is a positive number.

> **NOTE:**
>
> **Theorem 1 (The multivariate normal density integrates to 1)** If $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$ ([Definition 1](#def-mvn)), then the density in [Definition 1](#def-mvn) integrates to 1 over $\mathbb{R}^p$.

> **NOTE:**
>
> **Theorem 2 (The mean and variance of the multivariate normal distribution)** If $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$ ([Definition 1](#def-mvn)), then $\mathbb{E}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$ (the [expectation of a random vector](expectation.llms.md#def-expectation-matrix)), and ${\operatorname{Var}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\right)\mathclose{}} = \mathbf{\Sigma}$ (the [variance of a random vector](variance-covariance.llms.md#def-cov-vec-x)).

> **NOTE:**
>
> *Remark*. The proof changes variables in a $p$-dimensional integral, which these notes do not develop; see [\[1\]](#ref-wikipedia_multivariate_normal_distribution). As with the univariate [normal distribution](random-variables.llms.md#thm-normal-moments), these facts are where the parameters’ names come from. They also show why $\mathbf{\Sigma}$ must at least be [positive semidefinite](variance-covariance.llms.md#thm-vcov-psd); requiring it to be positive definite rules out cases like [a variance matrix that is not positive definite](variance-covariance.llms.md#exm-vcov-singular), which has no joint density.

> **NOTE:**
>
> **Example 2 (The univariate normal is the case** $p = 1$) With $p = 1$, $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}} = (\mu)$, and $\mathbf{\Sigma} = (\sigma^2)$ for $\sigma^2> 0$, $\det(\mathbf{\Sigma}) = \sigma^2$ ([determinant](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-determinant), $p = 1$) and $\mathbf{\Sigma}^{-1} = (1/\sigma^2)$, so:
>
> $$\begin{aligned}
> \mathbb{p}(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})
> &= \frac{1}{(2\pi)^{1/2} (\sigma^2)^{1/2}}
> \text{e}^{-\frac{1}{2} (x - \mu) \frac{1}{\sigma^2} (x - \mu)}
> && \text{(substitute into the multivariate normal density)} \\
> &= \frac{1}{\sigma\sqrt{2\pi}} \text{e}^{-\frac{(x - \mu)^2}{2\sigma^2}}
> && \text{(simplify)}
> \end{aligned}$$
>
> which is the [normal density](random-variables.llms.md#def-normal) ${\operatorname{N}\mathopen{}\left(\mu, \sigma^2\right)\mathclose{}}$.

> **NOTE:**
>
> **Lemma 1 (The quadratic form in the multivariate normal density is non-negative)** If $\mathbf{\Sigma}$ is a $p \times p$ positive definite matrix and $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}, \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}} \in \mathbb{R}^p$, then
>
> $${(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}^{\top} \mathbf{\Sigma}^{-1} (\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}) \ge 0,$$
>
> with equality if and only if $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$.

> **NOTE:**
>
> *Proof*. $\mathbf{\Sigma}^{-1}$ is positive definite ([positive definite inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#thm-pd-inverse)). If $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}\neq \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$, then $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}} \neq \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{0}}\vphantom{0}}$, so the quadratic form is positive by the [definition of positive definite](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-positive-definite). If $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$, then $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{0}}\vphantom{0}}$, and the quadratic form is $0$.

> **NOTE:**
>
> **Definition 2 (Mahalanobis distance)** For a $p \times p$ positive definite matrix $\mathbf{\Sigma}$ and $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}, \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}} \in \mathbb{R}^p$, the **Mahalanobis distance** from $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}$ to $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$ with respect to $\mathbf{\Sigma}$ is:
>
> $$\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}) \stackrel{\text{def}}{=}\sqrt{{(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}^{\top} \mathbf{\Sigma}^{-1} (\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}$$

> **NOTE:**
>
> *Remark*. The square root is defined by [Lemma 1](#lem-mahalanobis-nonneg). See also [\[2\]](#ref-wikipedia_mahalanobis_distance).

> **NOTE:**
>
> **Corollary 1 (The multivariate normal density decreases with Mahalanobis distance)** If $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$, then:
>
> $$\mathbb{p}(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}) = \frac{1}{(2\pi)^{p/2} \det(\mathbf{\Sigma})^{1/2}} \text{e}^{-\frac{\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})^2}{2}}$$
>
> where $\Delta$ is the Mahalanobis distance to $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$ with respect to $\mathbf{\Sigma}$ ([Definition 2](#def-mahalanobis)). So the density is highest at $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$, decreases as $\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})$ increases, and is the same at every $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}$ with the same $\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})$.

> **NOTE:**
>
> *Proof*. Substitute [Definition 2](#def-mahalanobis) into [Definition 1](#def-mvn). The function $\delta\mapsto \text{e}^{-\delta^2/2}$ decreases on $\delta\ge 0$, and by [Lemma 1](#lem-mahalanobis-nonneg), $\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}) = 0$ only at $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$.

> **NOTE:**
>
> **Example 3 (Mahalanobis distance for diagonal variance matrices)** If $\mathbf{\Sigma}$ is [diagonal](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-diagonal-matrix) with diagonal elements $\sigma^2_1, \ldots, \sigma^2_p$, all positive, then $\mathbf{\Sigma}^{-1}$ is diagonal with diagonal elements $1/\sigma^2_1, \ldots, 1/\sigma^2_p$ (multiplying the two gives $\mathbf{I}_p$; [matrix inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-matrix-inverse)), so:
>
> $$\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})^2 = \sum_{i=1}^p\frac{(x_i - \mu_i)^2}{\sigma^2_i}$$
>
> Two special cases:
>
> - If $\mathbf{\Sigma} = \mathbf{I}_p$, then $\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})^2 = \sum_{i=1}^p(x_i - \mu_i)^2$, so the Mahalanobis distance is the ordinary (Euclidean) distance.
> - If $\mathbf{\Sigma} = \sigma^2\mathbf{I}_p$, then $\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})$ is the Euclidean distance divided by $\sigma$.
>
> In general, each coordinate’s difference is measured in units of that coordinate’s standard deviation.

> **NOTE:**
>
> **Theorem 3 (A multivariate normal vector with diagonal variance has independent normal components)** If $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$ and $\mathbf{\Sigma}$ is diagonal with diagonal elements $\sigma^2_1, \ldots, \sigma^2_p$, then:
>
> - the joint density of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ is the product of the [normal densities](random-variables.llms.md#def-normal) ${\operatorname{N}\mathopen{}\left(\mu_i, \sigma^2_i\right)\mathclose{}}$, $i = 1, \ldots, p$,
> - each $X_i \sim {\operatorname{N}\mathopen{}\left(\mu_i, \sigma^2_i\right)\mathclose{}}$, and
> - $X_1, \ldots, X_p$ are [independent](independence.llms.md#def-indpt).

> **NOTE:**
>
> *Proof*. By the [determinant of a diagonal matrix](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#thm-det-diagonal), $\det(\mathbf{\Sigma}) = \prod_{i=1}^p \sigma^2_i$, so $\det(\mathbf{\Sigma})^{1/2} = \prod_{i=1}^p \sigma_i$. Using [Example 3](#exm-mahalanobis-special) for the quadratic form:
>
> $$\begin{aligned}
> \mathbb{p}(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})
> &= \frac{1}{(2\pi)^{p/2} \prod_{i=1}^p \sigma_i}
> \text{e}^{-\frac{1}{2} \sum_{i=1}^p\frac{(x_i - \mu_i)^2}{\sigma^2_i}}
> && \text{(substitute)} \\
> &= \prod_{i=1}^p \frac{1}{\sigma_i \sqrt{2\pi}}
> \text{e}^{-\frac{(x_i - \mu_i)^2}{2\sigma^2_i}}
> && \text{(} \text{e}^{a + b} = \text{e}^{a}\text{e}^{b} \text{)}
> \end{aligned}$$
>
> which is the product of the ${\operatorname{N}\mathopen{}\left(\mu_i, \sigma^2_i\right)\mathclose{}}$ densities. Integrating out every coordinate except $x_i$, each other factor integrates to 1 ([the normal density integrates to 1](random-variables.llms.md#thm-normal-density)), leaving the ${\operatorname{N}\mathopen{}\left(\mu_i, \sigma^2_i\right)\mathclose{}}$ density as the density of $X_i$ ([marginal density from a joint density](random-variables.llms.md#thm-marginal-density), with $p$ variables). So the joint density is the product of the marginal densities, and the components are independent by [the factorization theorem for densities](independence.llms.md#thm-indpt-density), extended to $p$ variables as its remark describes.

> **NOTE:**
>
> **Corollary 2 (For a multivariate normal vector, uncorrelated components are independent)** If $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$, then $X_1, \ldots, X_p$ are independent if and only if $\mathbf{\Sigma}$ is diagonal, that is, if and only if ${\operatorname{Cov}\mathopen{}\left(X_i, X_j\right)\mathclose{}} = 0$ for every $i \neq j$.

> **NOTE:**
>
> *Proof*. By [Theorem 2](#thm-mvn-moments), ${\operatorname{Var}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\right)\mathclose{}} = \mathbf{\Sigma}$, whose $(i,j)$-th element is ${\operatorname{Cov}\mathopen{}\left(X_i, X_j\right)\mathclose{}}$ (by the [definition of the variance matrix](variance-covariance.llms.md#def-cov-vec-x)). If $\mathbf{\Sigma}$ is diagonal, the components are independent by [Theorem 3](#thm-mvn-diagonal-indpt). If the components are independent, then:
>
> - each pair $X_i, X_j$ with $i \neq j$ is independent,
> - each $X_i$ is continuous, with the density left after integrating out the other coordinates of the joint density ([marginal density from a joint density](random-variables.llms.md#thm-marginal-density), with $p$ variables), and
> - ${\mathbb{E}\mathopen{}\left[X_i^2\right]\mathclose{}} < \infty$, because ${\operatorname{Var}\mathopen{}\left(X_i\right)\mathclose{}}$, the $(i,i)$-th element of $\mathbf{\Sigma}$, is defined, and a [variance](variance-covariance.llms.md#def-variance) is defined only when ${\mathbb{E}\mathopen{}\left[X_i^2\right]\mathclose{}} < \infty$.
>
> So $\mathbf{\Sigma}$ is diagonal by [independent components give a diagonal variance matrix](variance-covariance.llms.md#cor-vcov-indpt-diagonal).

> **NOTE:**
>
> *Remark*. In general, uncorrelated random variables need not be independent ([an example](variance-covariance.llms.md#exm-uncorrelated-not-indpt)). [Corollary 2](#cor-mvn-uncorrelated-indpt) needs the whole vector to be multivariate normal: two random variables that are each normal and uncorrelated can still be dependent (<https://en.wikipedia.org/wiki/Normally_distributed_and_uncorrelated_does_not_imply_independent>).

> **NOTE:**
>
> **Theorem 4 (The conditional distribution of a block of a multivariate Gaussian vector)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ have the [multivariate normal distribution](#def-mvn) $\operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$, cut into $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= \begin{bmatrix} \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_1 \\ \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_2 \end{bmatrix}$ with $k$ and $m$ elements, and cut $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$ and $\mathbf{\Sigma}$ to match:
>
> $$\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}} = \begin{bmatrix} \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_1 \\ \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_2 \end{bmatrix},
> \quad
> \mathbf{\Sigma}
> = \begin{bmatrix}
> \mathbf{\Sigma}_{11} & \mathbf{\Sigma}_{12} \\
> \mathbf{\Sigma}_{21} & \mathbf{\Sigma}_{22}
> \end{bmatrix}.$$
>
> Let $\mathbf{S} = \mathbf{\Sigma}_{22} - \mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathbf{\Sigma}_{12}$. Then, given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_1 = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_1$,
>
> $$\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_2 \mid \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_1 = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_1
> \sim \operatorname{N}_m\mathopen{}\left(
> \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_2 + \mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_1 - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_1),
> \mathbf{S}\right)\mathclose{}.$$

> **NOTE:**
>
> *Proof*. $\mathbf{\Sigma}$ is positive definite, so by [the inverse of a positive definite block matrix](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#thm-block-inverse), $\mathbf{S}$ is positive definite, and ${\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}^{-1}$ has [blocks](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#def-block-matrix) $\mathbf{\Omega}_{ij}$ with
>
> $$\mathbf{\Omega}_{22} = {\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1},
> \quad
> \mathbf{\Omega}_{21} = -{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}.$$
>
> Write $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1 = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_1 - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_1$ and $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2 = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2 - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_2$. The [conditional density](random-variables.llms.md#def-cond-pdf) of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_2$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_1 = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_1$ is the [joint density](random-variables.llms.md#def-joint-pdf) divided by the [marginal density](random-variables.llms.md#def-marginal) of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_1$, and the marginal density does not depend on $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$. So as a [function](https://morrison-lab.github.io/mcs/functions.html#def-function) of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$, the conditional density equals the joint density times a factor that does not change with $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$, and the joint density is a factor that does not change with $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$ times $e$ raised to
>
> $$\begin{aligned}
> -\frac{1}{2}\mathopen{}\left(
> {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1}^{\top}\mathbf{\Omega}_{11}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1
> + 2{\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2}^{\top}\mathbf{\Omega}_{21}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1
> + {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2}^{\top}\mathbf{\Omega}_{22}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2\right)\mathclose{}.
> \end{aligned}$$
>
> The first summand does not involve $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$, so its contribution to the joint density is a factor that does not change with $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$. Substituting $\mathbf{\Omega}_{21}$ and $\mathbf{\Omega}_{22}$ into the other two summands:
>
> $$\begin{aligned}
> 2{\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2}^{\top}\mathbf{\Omega}_{21}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1
> + {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2}^{\top}\mathbf{\Omega}_{22}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2
> &= {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2}^{\top}{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2
> - 2{\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2}^{\top}{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1
> && \text{(substitute)} \\
> &= {\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2 - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}\right)\mathclose{}}^{\top}{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2 - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}\right)\mathclose{}
> - {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}}^{\top}{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}
> && \text{(complete the square, with } \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}} = \mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1 \text{)}
> \end{aligned}$$
>
> The last summand does not involve $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$ either. Since $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2 - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2 - \mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_2 + \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}\right)\mathclose{}$, the conditional density of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_2$ equals a factor that does not change with $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$, times
>
> $$\text{e}^{-\frac{1}{2}
> {\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2 - \mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_2 + \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}\right)\mathclose{}\right)\mathclose{}}^{\top}
> {\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}
> \mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2 - \mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_2 + \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}\right)\mathclose{}\right)\mathclose{}},$$
>
> which has the form of the $\operatorname{N}_m\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_2 + \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}, \mathbf{S}\right)\mathclose{}$ [density](random-variables.llms.md#def-pdf). A conditional density integrates to 1, so the factor that does not change with $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$ must be the normalizing factor of that density.

> **NOTE:**
>
> **Example 4 (The conditional distribution of one element of a bivariate Gaussian vector)**  
>
> Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= {(X_1, X_2)}^{\top} \sim \operatorname{N}_2\mathopen{}\left(\mathbf{0}, \begin{pmatrix}1 & \rho \\ \rho & 1\end{pmatrix}\right)\mathclose{}$ with $\mathopen{}\left|\rho\right|\mathclose{} < 1$. Here $\mathbf{\Sigma}_{11} = [1]$, $\mathbf{\Sigma}_{21} = [\rho]$ and $\mathbf{\Sigma}_{22} = [1]$, so $\mathbf{S} = [1 - \rho^2]$. By [Theorem 4](#thm-mvn-conditional):
>
> $$X_2 \mid X_1 = x_1 \sim {\operatorname{N}\mathopen{}\left(\rho x_1, 1 - \rho^2\right)\mathclose{}}.$$
>
> At $\rho = 0$ the conditional law of $X_2$ is ${\operatorname{N}\mathopen{}\left(0, 1\right)\mathclose{}}$ for every $x_1$, which is the [marginal distribution](random-variables.llms.md#def-marginal) of $X_2$, as it must be for [independent](independence.llms.md#def-indpt) elements ([Theorem 3](#thm-mvn-diagonal-indpt)).

> **NOTE:**
>
> **Theorem 5 (The marginal distribution of a subvector of a multivariate Gaussian vector)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$, and let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_J$ be the subvector of $k$ elements of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ whose indices are in $J$. Then $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_J \sim \operatorname{N}_k\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_J, \mathbf{\Sigma}_{JJ}\right)\mathclose{}$, where $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_J$ holds the elements of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$ with indices in $J$, and $\mathbf{\Sigma}_{JJ}$ holds the [rows](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) and [columns](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) of $\mathbf{\Sigma}$ with indices in $J$.

> **NOTE:**
>
> *Proof*. Reordering the elements of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ reorders the [rows](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) and [columns](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) of $\mathbf{\Sigma}$ in the same way, so we may take $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_J$ to be the first $k$ elements. Cut $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$, $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$ and $\mathbf{\Sigma}$ into [blocks](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#def-block-matrix) as in [Theorem 4](#thm-mvn-conditional), with $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_1 = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_J$ and $m = p - k$ elements in $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_2$, and let $\mathbf{S} = \mathbf{\Sigma}_{22} - \mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathbf{\Sigma}_{12}$. Write $\mathbf{\Omega} = {\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}^{-1}$ with blocks $\mathbf{\Omega}_{ij}$. By [the inverse of a positive definite block matrix](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#thm-block-inverse),
>
> $$\mathbf{\Omega}_{22} = {\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1},
> \quad
> \mathbf{\Omega}_{21} = -{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}.$$
>
> The first block row of $\mathbf{\Sigma}\mathbf{\Omega} = \mathbf{I}$ gives $\mathbf{\Sigma}_{11}\mathbf{\Omega}_{11} + \mathbf{\Sigma}_{12}\mathbf{\Omega}_{21} = \mathbf{I}$, so, using $\mathbf{\Sigma}_{12} = {\mathbf{\Sigma}_{21}}^{\top}$,
>
> $$\mathbf{\Omega}_{11}
> = {\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1} - {\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathbf{\Sigma}_{12}\mathbf{\Omega}_{21}
> = {\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1} + {\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathbf{\Sigma}_{12}{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}.$$
>
> Write $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1 = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_1 - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_1$, $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2 = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2 - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_2$ and $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}} = \mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1$. The [joint density](random-variables.llms.md#def-joint-pdf) in [Definition 1](#def-mvn) is a normalizing factor times $e$ raised to $-1/2$ times
>
> $$\begin{aligned}
> &{\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1}^{\top}\mathbf{\Omega}_{11}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1
> + 2{\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2}^{\top}\mathbf{\Omega}_{21}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1
> + {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2}^{\top}\mathbf{\Omega}_{22}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2 \\
> &= {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1}^{\top}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1
> + {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}}^{\top}{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}
> - 2{\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2}^{\top}{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}
> + {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2}^{\top}{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2
> && \text{(substitute } \mathbf{\Omega}_{11}\text{, } \mathbf{\Omega}_{21}\text{, } \mathbf{\Omega}_{22} \text{)} \\
> &= {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1}^{\top}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1
> + {\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2 - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}\right)\mathclose{}}^{\top}{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_2 - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{c}}\vphantom{c}}\right)\mathclose{}.
> && \text{(complete the square)}
> \end{aligned}$$
>
> The [marginal density](random-variables.llms.md#def-marginal) of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_1$ is the joint density [integrated](https://morrison-lab.github.io/mds/calculus-integration.html#def-riemann-integral) over $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$. The first summand does not involve $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$, and $\mathbf{S}$ [is positive definite](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-positive-definite), so by [Theorem 1](#thm-mvn-density-integral) integrating the factor from the second summand over $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_2$ gives a number that does not depend on $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_1$. So the marginal density of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_1$ equals a factor free of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_1$ times
>
> $$\text{e}^{-\frac{1}{2}{\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1}^{\top}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{d}}\vphantom{d}}_1},$$
>
> which has the form of the $\operatorname{N}_k\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_1, \mathbf{\Sigma}_{11}\right)\mathclose{}$ [density](random-variables.llms.md#def-pdf). A marginal density integrates to 1, so that factor must be the normalizing factor of that density.

> **NOTE:**
>
> **Example 5 (The marginal distribution of the two end elements of a chain of three Gaussian variables)**  
>
> Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= {(X_1, X_2, X_3)}^{\top}$ be the [Gaussian](#def-normal) vector of [Example 11](#exm-precision-zero-cind), with ${\mathbb{E}\mathopen{}\left[\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\right]\mathclose{}} = \mathbf{0}$ and
>
> $${\operatorname{Var}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\right)\mathclose{}} = \frac{1}{4} \begin{pmatrix}3 & 2 & 1 \\ 2 & 4 & 2 \\ 1 & 2 & 3\end{pmatrix}.$$
>
> Take $J = \{1, 3\}$. By [Theorem 5](#thm-mvn-marginal), keeping the entries in positions 1 and 3,
>
> $${(X_1, X_3)}^{\top} \sim \operatorname{N}_2\mathopen{}\left(\mathbf{0}, \frac{1}{4}\begin{pmatrix}3 & 1 \\ 1 & 3\end{pmatrix}\right)\mathclose{}.$$
>
> So $X_1$ and $X_3$ each have [variance](variance-covariance.llms.md#def-variance) $3/4$ and [covariance](variance-covariance.llms.md#def-cov) $1/4$, and they are not [independent](independence.llms.md#def-indpt), although they are [conditionally independent given](independence.llms.md#def-cind-continuous) $X_2$.

> **NOTE:**
>
> **Definition 3 (Conditional precision)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ be a $p \times 1$ [multivariate Gaussian](#def-mvn) vector, and let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i}$ be $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ without its $i$th element. The **conditional precision** of $X_i$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-i}$ is the [precision](variance-covariance.llms.md#def-precision) computed from the [conditional variance](variance-covariance.llms.md#def-cond-variance) of $X_i$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-i}$:
>
> $$\tau\mathopen{}\left(X_i \mid \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-i}\right)\mathclose{}
> \stackrel{\text{def}}{=}{\mathopen{}\left({{\operatorname{Var}\mathopen{}\left(X_i \mid\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-i}\right)\mathclose{}}}\right)\mathclose{}}^{-1}.$$

> **NOTE:**
>
> **Example 6 (The conditional precision of one element of a bivariate Gaussian vector)**  
>
> Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= {(X_1, X_2)}^{\top} \sim \operatorname{N}_2\mathopen{}\left(\mathbf{0}, \begin{pmatrix}1 & \rho \\ \rho & 1\end{pmatrix}\right)\mathclose{}$ with $\mathopen{}\left|\rho\right|\mathclose{} < 1$. By [Example 4](#exm-mvn-conditional), $X_1$ given $X_2 = x_2$ has [variance](variance-covariance.llms.md#def-variance) $1 - \rho^2$, so the [conditional precision](#def-conditional-precision) of $X_1$ given $X_2 = x_2$ is
>
> $$\frac{1}{1 - \rho^2}.$$

> **NOTE:**
>
> **Definition 4 (Coprecision)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ be a $p \times 1$ [multivariate Gaussian](#def-mvn) vector with $p \ge 2$, let $i \ne j$, and let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij}$ be $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ without its $i$th and $j$th elements. The **coprecision** of $X_i$ and $X_j$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$ is defined through their [conditional covariance](variance-covariance.llms.md#def-cond-cov) and their [conditional variances](variance-covariance.llms.md#def-cond-variance) as
>
> $$\frac{-{{\operatorname{Cov}\mathopen{}\left(X_i, X_j \mid\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}\right)\mathclose{}}}}
> {{{\operatorname{Var}\mathopen{}\left(X_i \mid\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}\right)\mathclose{}}}{{\operatorname{Var}\mathopen{}\left(X_j \mid\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}\right)\mathclose{}}}
> - \mathopen{}\left({{\operatorname{Cov}\mathopen{}\left(X_i, X_j \mid\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}\right)\mathclose{}}}\right)\mathclose{}^2}.$$

> **NOTE:**
>
> **Example 7 (The coprecision of a bivariate Gaussian vector)**  
>
> Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= {(X_1, X_2)}^{\top} \sim \operatorname{N}_2\mathopen{}\left(\mathbf{0}, \begin{pmatrix}1 & \rho \\ \rho & 1\end{pmatrix}\right)\mathclose{}$ with $\mathopen{}\left|\rho\right|\mathclose{} < 1$. With no other elements to condition on, the [conditional variances](variance-covariance.llms.md#def-cond-variance) of $X_1$ and $X_2$ are both 1 and their [conditional covariance](variance-covariance.llms.md#def-cond-cov) is $\rho$, so the [coprecision](#def-coprecision) of $X_1$ and $X_2$ is
>
> $$\frac{-\rho}{1 \cdot 1 - \rho^2}
> = \frac{-\rho}{1 - \rho^2}.$$

> **NOTE:**
>
> **Definition 5 (Precision matrix)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ be a $p \times 1$ [multivariate Gaussian](#def-mvn) vector. The **precision matrix** $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})$ of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ is the $p \times p$ [matrix](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) whose $i$th [diagonal](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-diagonal-entry) element is the [conditional precision](#def-conditional-precision) of $X_i$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i}$, and whose $(i, j)$ element, for $i \ne j$, is the [coprecision](#def-coprecision) of $X_i$ and $X_j$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij}$.

> **NOTE:**
>
> **Theorem 6 (The precision matrix is the inverse of the variance matrix)** If $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ has the [multivariate normal distribution](#def-mvn) $\operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$, then $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}) = {\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}^{-1}$.

> **NOTE:**
>
> *Proof*. Let $\mathbf{\Omega} = {\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}^{-1}$. Reordering the elements of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ reorders the [rows](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) and [columns](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) of $\mathbf{\Sigma}$ and of $\mathbf{\Omega}$ in the same way, so for each $i$ and $j$ we may take $X_i$ and $X_j$ to be the last two elements.
>
> Cut $\mathbf{\Sigma}$ into [blocks](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#def-block-matrix) with the first $p - 2$ elements in the first block. By [the inverse of a positive definite block matrix](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#thm-block-inverse), the last $2 \times 2$ block of $\mathbf{\Omega}$ is ${\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}$, where $\mathbf{S}$ is the [Schur complement](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#def-schur-complement) of the first block of $\mathbf{\Sigma}$. By [Theorem 4](#thm-mvn-conditional), $\mathbf{S}$ is the [variance matrix](variance-covariance.llms.md#def-cov-vec-x) of ${(X_i, X_j)}^{\top}$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$, so the [diagonal](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-diagonal-entry) elements $v_i$ and $v_j$ of $\mathbf{S}$ are the [conditional variances](variance-covariance.llms.md#def-cond-variance) of $X_i$ and $X_j$, and its off-diagonal element $c_{ij}$ is their [conditional covariance](variance-covariance.llms.md#def-cond-cov). The [inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-matrix-inverse) of a $2 \times 2$ [matrix](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) gives the off-diagonal element of $\mathbf{\Omega}$:
>
> $$\begin{aligned}
> \mathbf{\Omega}_{ij}
> &= \mathopen{}\left({\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\right)\mathclose{}_{12}
> && \text{(last block of } \mathbf{\Omega} \text{)} \\
> &= \frac{-c_{ij}}{v_i v_j - c_{ij}^2}
> && \text{(inverse of a } 2 \times 2 \text{ matrix)}
> \end{aligned}$$
>
> which is the [coprecision](#def-coprecision) of $X_i$ and $X_j$.
>
> Taking $X_i$ alone as the last element, the last $1 \times 1$ block of $\mathbf{\Omega}$ is ${\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}$, where by [Theorem 4](#thm-mvn-conditional) $\mathbf{S}$ is the [conditional variance](variance-covariance.llms.md#def-cond-variance) of $X_i$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-i}$. So $\mathbf{\Omega}_{ii}$ is the inverse of that conditional variance, which is the [conditional precision](#def-conditional-precision) of $X_i$.

> **NOTE:**
>
> **Example 8 (The precision matrix of a bivariate Gaussian vector)**  
>
> Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= {(X_1, X_2)}^{\top} \sim \operatorname{N}_2\mathopen{}\left(\mathbf{0}, \begin{pmatrix}1 & \rho \\ \rho & 1\end{pmatrix}\right)\mathclose{}$ with $\mathopen{}\left|\rho\right|\mathclose{} < 1$. By [Example 6](#exm-conditional-precision) and [Example 7](#exm-coprecision), the [conditional precision](#def-conditional-precision) of each element is $1 / (1 - \rho^2)$, and the [coprecision](#def-coprecision) of $X_1$ and $X_2$ is $-\rho / (1 - \rho^2)$, so
>
> $$\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}) = \frac{1}{1 - \rho^2} \begin{pmatrix}1 & -\rho \\ -\rho & 1\end{pmatrix}.$$
>
> This [matrix](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) is the [inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-matrix-inverse) of $\begin{pmatrix}1 & \rho \\ \rho & 1\end{pmatrix}$, as [the precision matrix is the inverse of the variance matrix](#thm-precision-matrix-inverse) says, because
>
> $$\begin{aligned}
> \begin{pmatrix}1 & \rho \\ \rho & 1\end{pmatrix} \cdot \frac{1}{1 - \rho^2} \begin{pmatrix}1 & -\rho \\ -\rho & 1\end{pmatrix}
> &= \frac{1}{1 - \rho^2} \begin{pmatrix}1 - \rho^2 & -\rho + \rho \\ \rho - \rho & -\rho^2 + 1\end{pmatrix} \\
> &= \mathbf{I}_2.
> \end{aligned}$$
>
> The [off-diagonal entries](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-off-diagonal-entry) have the opposite sign of $\rho$. Each [diagonal entry](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-diagonal-entry), $1 / (1 - \rho^2)$, is at least the [precision](#def-precision) $1 / {\operatorname{Var}\mathopen{}\left(X_1\right)\mathclose{}} = 1$ of $X_1$ alone, and it grows indefinitely as $\mathopen{}\left|\rho\right|\mathclose{} \to 1$. If $\rho = 0$, then $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})$ is the [identity matrix](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-identity-matrix), which is [diagonal](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-diagonal-matrix) like ${\operatorname{Var}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\right)\mathclose{}}$ (compare [independent components give a diagonal variance matrix](variance-covariance.llms.md#cor-vcov-indpt-diagonal)).

> **NOTE:**
>
> **Theorem 7 (The multivariate Gaussian density in terms of the precision matrix)** If $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ has the [multivariate Gaussian distribution](#def-mvn) $\operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$, and $\mathbf{\Lambda} = \tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})$ is its [precision matrix](#def-precision-matrix), then $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ has [joint density](random-variables.llms.md#def-joint-pdf):
>
> $$\mathbb{p}(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}) =
> \frac{{\det\mathopen{}\left(\mathbf{\Lambda}\right)\mathclose{}}^{1/2}}{(2\pi)^{p/2}}
> \text{e}^{-\frac{1}{2} {(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}^{\top} \mathbf{\Lambda} (\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})},
> \quad \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}\in \mathbb{R}^p.$$

> **NOTE:**
>
> *Proof*. By [Theorem 6](#thm-precision-matrix-inverse), $\mathbf{\Lambda} = {\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}^{-1}$, so ${\det\mathopen{}\left(\mathbf{\Lambda}\right)\mathclose{}} = 1 / {\det\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}$ (the [determinant](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-determinant) of an [inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-matrix-inverse) is the [reciprocal](https://morrison-lab.github.io/mcs/number-systems.html#def-reciprocal) of the determinant). Substituting both into the [joint density](random-variables.llms.md#def-joint-pdf) of [Definition 1](#def-mvn):
>
> $$\begin{aligned}
> \mathbb{p}(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})
> &= \frac{1}{(2\pi)^{p/2} {\det\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}^{1/2}}
> \text{e}^{-\frac{1}{2} {(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}^{\top} {\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}^{-1} (\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}
> && \text{(the multivariate Gaussian density)} \\
> &= \frac{{\det\mathopen{}\left(\mathbf{\Lambda}\right)\mathclose{}}^{1/2}}{(2\pi)^{p/2}}
> \text{e}^{-\frac{1}{2} {(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}^{\top} \mathbf{\Lambda} (\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}
> && \text{(substitute } {\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}^{-1} = \mathbf{\Lambda} \text{ and } 1 / {\det\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}} = {\det\mathopen{}\left(\mathbf{\Lambda}\right)\mathclose{}} \text{)}
> \end{aligned}$$

> **NOTE:**
>
> **Example 9 (A bivariate Gaussian density from its precision matrix)**  
>
> Take the [Gaussian](#def-mvn) vector $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_2\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{0}}\vphantom{0}}, \mathbf{\Sigma}\right)\mathclose{}$ of [Example 1](#exm-mvn-bivariate), with $\mathbf{\Sigma} = \begin{pmatrix}1 & 0.8 \\ 0.8 & 1\end{pmatrix}$. By [Example 8](#exm-precision-matrix) with $\rho = 0.8$, its [precision matrix](#def-precision-matrix) is
>
> $$\mathbf{\Lambda} = \frac{1}{0.36} \begin{pmatrix}1 & -0.8 \\ -0.8 & 1\end{pmatrix},$$
>
> so ${\det\mathopen{}\left(\mathbf{\Lambda}\right)\mathclose{}} = (1 - 0.8^2) / 0.36^2 = 1 / 0.36$. At $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}= {(1, 1)}^{\top}$, the [quadratic form](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-quadratic-form) is
>
> $$\begin{aligned}
> {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}}^{\top} \mathbf{\Lambda} \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}
> &= \frac{1}{0.36} (1 - 0.8 - 0.8 + 1)
> && \text{(multiply out)} \\
> &= \frac{0.4}{0.36} = \frac{10}{9}
> && \text{(simplify)}
> \end{aligned}$$
>
> so by [Theorem 7](#thm-mvn-density-precision) the [density](random-variables.llms.md#def-pdf) there is
>
> $$\begin{aligned}
> {\mathbb{p}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}\right)\mathclose{}}
> &= \frac{(1 / 0.36)^{1/2}}{2\pi} \text{e}^{-\frac{1}{2} \cdot\frac{10}{9}}
> && \text{(substitute into the precision form)} \\
> &= \frac{1}{0.6 \cdot 2\pi} \text{e}^{-\frac{5}{9}}
> && \text{(simplify)}
> \end{aligned}$$
>
> which is about 0.152. At $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{0}}\vphantom{0}}$ the [exponent](https://morrison-lab.github.io/mds/algebra-basics.html#def-power-exponent) is $0$, and the density is $1 / (0.6 \cdot 2\pi)$, the peak value that [Example 1](#exm-mvn-bivariate) found from $\mathbf{\Sigma}$. Written with the precision matrix, the density needs no [matrix inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-matrix-inverse), because $\mathbf{\Lambda}$ appears in the density as it is.

> **NOTE:**
>
> **Corollary 3 (The Gaussian density in terms of the precision)** If $X$ has the [Gaussian distribution](random-variables.llms.md#def-normal) ${\operatorname{N}\mathopen{}\left(\mu, \sigma^2\right)\mathclose{}}$, and $\tau= 1 / \sigma^2$, then $\tau$ is the [precision](variance-covariance.llms.md#def-precision) of $X$, and $X$ has [density](random-variables.llms.md#def-pdf):
>
> $$\mathbb{p}(X = x) = \sqrt{\frac{\tau}{2\pi}} \text{e}^{-\frac{\tau}{2} (x - \mu)^2}, \quad x \in \mathbb{R}.$$

> **NOTE:**
>
> *Proof*. By [Example 2](#exm-mvn-univariate), $X$ is the case $p = 1$ of the [multivariate Gaussian distribution](#def-mvn), with $\mathbf{\Sigma} = (\sigma^2)$. By [the mean and variance of the Gaussian distribution](random-variables.llms.md#thm-normal-moments), ${\operatorname{Var}\mathopen{}\left(X\right)\mathclose{}} = \sigma^2$, so the [precision](variance-covariance.llms.md#def-precision) of $X$ is $1 / \sigma^2= \tau$. By [Theorem 6](#thm-precision-matrix-inverse), the [precision matrix](#def-precision-matrix) of $X$ is the $1 \times 1$ [inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-matrix-inverse) of $(\sigma^2)$, which is $\mathbf{\Lambda} = (\tau)$, so by [Theorem 7](#thm-mvn-density-precision) with $p = 1$:
>
> $$\begin{aligned}
> \mathbb{p}(X = x)
> &= \frac{\tau^{1/2}}{(2\pi)^{1/2}} \text{e}^{-\frac{1}{2} (x - \mu) \tau(x - \mu)}
> && \text{(substitute into the precision form)} \\
> &= \sqrt{\frac{\tau}{2\pi}} \text{e}^{-\frac{\tau}{2} (x - \mu)^2}
> && \text{(simplify)}
> \end{aligned}$$

> **NOTE:**
>
> **Example 10 (A Gaussian density with precision 4)**  
>
> Let $X \sim {\operatorname{N}\mathopen{}\left(0, 1/4\right)\mathclose{}}$, the [Gaussian distribution](random-variables.llms.md#def-normal) with [variance](variance-covariance.llms.md#def-variance) $1/4$, so its [precision](variance-covariance.llms.md#def-precision) is $\tau= 4$. By [Corollary 3](#cor-normal-density-precision), its [density](random-variables.llms.md#def-pdf) at $x = 1$ is
>
> $$\begin{aligned}
> \mathbb{p}(X = 1)
> &= \sqrt{\frac{4}{2\pi}} \text{e}^{-\frac{4}{2} (1 - 0)^2}
> && \text{(substitute into the precision form)} \\
> &= \sqrt{\frac{2}{\pi}} \text{e}^{-2}
> && \text{(simplify)}
> \end{aligned}$$
>
> which is about 0.108. The variance form of the [Gaussian density](random-variables.llms.md#def-normal) gives the same value, since $\sigma= 1/2$ makes $\frac{1}{\sigma\sqrt{2\pi}} = \frac{2}{\sqrt{2\pi}} = \sqrt{\frac{2}{\pi}}$ and $\frac{(1 - 0)^2}{2 \cdot(1/4)} = 2$. R’s `dnorm()` takes the [standard deviation](variance-covariance.llms.md#def-sd), $1/\sqrt{\tau} = 1/2$: `dnorm(1, mean = 0, sd = 1 / 2)` is 0.108.

> **NOTE:**
>
> **Theorem 8 (A zero off-diagonal element of the precision matrix means conditional independence)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$ with $p \ge 2$, and let $i \ne j$. The $(i, j)$ element of the [precision matrix](#def-precision-matrix) $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})$ is zero [if and only if](https://morrison-lab.github.io/mcs/proof-writing.html#def-iff) $X_i$ and $X_j$ are [conditionally independent given the continuous random vector](independence.llms.md#def-cind-continuous) $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij}$, that is, $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ without its $i$th and $j$th elements.

> **NOTE:**
>
> *Proof*. By [Theorem 6](#thm-precision-matrix-inverse), the $(i, j)$ element of $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})$ is the [coprecision](#def-coprecision) of $X_i$ and $X_j$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$. Write $v_i$ and $v_j$ for the [conditional variances](variance-covariance.llms.md#def-cond-variance) of $X_i$ and $X_j$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$, and $c_{ij}$ for their [conditional covariance](variance-covariance.llms.md#def-cond-cov). By [Theorem 4](#thm-mvn-conditional), given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$, ${(X_i, X_j)}^{\top}$ has a bivariate [Gaussian distribution](#def-normal) whose [variance matrix](variance-covariance.llms.md#def-cov-vec-x) $\mathbf{S}$ [is positive definite](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-positive-definite), with diagonal elements $v_i$ and $v_j$ and off-diagonal element $c_{ij}$, and $\mathbf{S}$ does not depend on $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$. A [positive definite matrix](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-positive-definite) has a positive [determinant](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-determinant), so $v_i v_j - c_{ij}^2 > 0$, and the coprecision $-c_{ij} / (v_i v_j - c_{ij}^2)$ is zero exactly when $c_{ij} = 0$.
>
> If $c_{ij} = 0$, then $\mathbf{S}$ is diagonal, so by [Corollary 2](#cor-mvn-uncorrelated-indpt) $X_i$ and $X_j$ are [independent](independence.llms.md#def-indpt) given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$, for every $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$. That is, the [conditional density](random-variables.llms.md#def-cond-pdf) of ${(X_i, X_j)}^{\top}$ equals the conditional density of $X_i$ times the conditional density of $X_j$, which is the factorization in the definition of [conditional independence](independence.llms.md#def-cind-continuous). Conversely, if $X_i$ and $X_j$ are [conditionally independent](independence.llms.md#def-cind-continuous), then they are independent given each $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$, so by [Corollary 2](#cor-mvn-uncorrelated-indpt) $c_{ij} = 0$.

> **NOTE:**
>
> **Example 11 (A chain of three Gaussian variables)**  
>
> Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= {(X_1, X_2, X_3)}^{\top}$ have ${\mathbb{E}\mathopen{}\left[\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\right]\mathclose{}} = \mathbf{0}$ and [precision matrix](#def-precision-matrix)
>
> $$\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}) = \begin{pmatrix}2 & -1 & 0 \\ -1 & 2 & -1 \\ 0 & -1 & 2\end{pmatrix}.$$
>
> By [Theorem 6](#thm-precision-matrix-inverse), the [variance matrix](variance-covariance.llms.md#def-cov-vec-x) is the [inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-matrix-inverse) of this [matrix](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix),
>
> $${\operatorname{Var}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\right)\mathclose{}} = \frac{1}{4} \begin{pmatrix}3 & 2 & 1 \\ 2 & 4 & 2 \\ 1 & 2 & 3\end{pmatrix},$$
>
> which one can check by multiplying the two matrices to get $\mathbf{I}_3$. So ${\operatorname{Cov}\mathopen{}\left(X_1, X_3\right)\mathclose{}} = 1/4 \ne 0$, and $X_1$ and $X_3$ are not [independent](independence.llms.md#def-indpt). But the $(1, 3)$ element of the precision matrix is 0, so by [Theorem 8](#thm-precision-zero-cind), $X_1$ and $X_3$ are [conditionally independent given](independence.llms.md#def-cind-continuous) $X_2$: once $X_2$ is known, $X_1$ carries no further information about $X_3$.

> **NOTE:**
>
> **Theorem 9 (A zero off-diagonal element of the variance matrix means independence)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$ with $p \ge 2$, and let $i \ne j$. The $(i, j)$ element of $\mathbf{\Sigma}$ is zero [if and only if](https://morrison-lab.github.io/mcs/proof-writing.html#def-iff) $X_i$ and $X_j$ are [independent](independence.llms.md#def-indpt).

> **NOTE:**
>
> *Proof*. By [Theorem 5](#thm-mvn-marginal), ${(X_i, X_j)}^{\top}$ has a bivariate [Gaussian distribution](#def-normal), whose [variance matrix](variance-covariance.llms.md#def-cov-vec-x) has off-diagonal element ${\operatorname{Cov}\mathopen{}\left(X_i, X_j\right)\mathclose{}}$, which by the [definition of the variance matrix](variance-covariance.llms.md#def-cov-vec-x) is the $(i, j)$ element of $\mathbf{\Sigma}$. By [Corollary 2](#cor-mvn-uncorrelated-indpt) with $p = 2$, $X_i$ and $X_j$ are [independent](independence.llms.md#def-indpt) [if and only if](https://morrison-lab.github.io/mcs/proof-writing.html#def-iff) this element is zero.

> **NOTE:**
>
> **Example 12 (Independent but not conditionally independent Gaussian variables)**  
>
> Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= {(X_1, X_2, X_3)}^{\top}$ be a [Gaussian](#def-normal) vector with ${\mathbb{E}\mathopen{}\left[\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\right]\mathclose{}} = \mathbf{0}$ and
>
> $${\operatorname{Var}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\right)\mathclose{}} = \begin{pmatrix}1 & 0 & 1/2 \\ 0 & 1 & 1/2 \\ 1/2 & 1/2 & 1\end{pmatrix}.$$
>
> The $(1, 2)$ element is 0, so by [Theorem 9](#thm-vcov-zero-indpt), $X_1$ and $X_2$ are [independent](independence.llms.md#def-indpt). By [Theorem 6](#thm-precision-matrix-inverse), the [precision matrix](#def-precision-matrix) is the [inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-matrix-inverse) of this [matrix](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix),
>
> $$\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}) = \begin{pmatrix}3/2 & 1/2 & -1 \\ 1/2 & 3/2 & -1 \\ -1 & -1 & 2\end{pmatrix},$$
>
> which one can check by multiplying the two matrices to get $\mathbf{I}_3$. Its $(1, 2)$ element is $1/2 \ne 0$, so by [Theorem 8](#thm-precision-zero-cind), $X_1$ and $X_2$ are not [conditionally independent given](independence.llms.md#def-cind-continuous) $X_3$. So a zero in the [variance matrix](variance-covariance.llms.md#def-cov-vec-x) does not give a zero in the precision matrix. [Example 11](#exm-precision-zero-cind) shows the reverse case: a zero in the precision matrix, with a nonzero [covariance](variance-covariance.llms.md#def-cov).

> **NOTE:**
>
> **Definition 6 (Partial correlation)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ be a $p \times 1$ [multivariate Gaussian](#def-mvn) vector with $p \ge 2$, let $i \ne j$, and let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij}$ be $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ without its $i$th and $j$th elements. The **partial correlation** of $X_i$ and $X_j$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij}$ is their [conditional covariance](variance-covariance.llms.md#def-cond-cov) given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$ for a fixed value $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$, divided by the [square root](https://morrison-lab.github.io/mds/algebra-basics.html#def-square-root) of the [conditional variance](variance-covariance.llms.md#def-cond-variance) of $X_i$ times that of $X_j$:
>
> $$\frac{{{\operatorname{Cov}\mathopen{}\left(X_i, X_j \mid\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}\right)\mathclose{}}}}
> {\sqrt{{{\operatorname{Var}\mathopen{}\left(X_i \mid\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}\right)\mathclose{}}}{{\operatorname{Var}\mathopen{}\left(X_j \mid\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}\right)\mathclose{}}}}}.$$

> **NOTE:**
>
> **Theorem 10 (The partial correlation from the precision matrix)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$ with $p \ge 2$, and let $i \ne j$. Then the [partial correlation](#def-partial-correlation) of $X_i$ and $X_j$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij}$ is
>
> $$\frac{-\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ij}}{\sqrt{\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ii}\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{jj}}},$$
>
> where $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})$ is the [precision matrix](#def-precision-matrix) of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$.

> **NOTE:**
>
> *Proof*. Reordering the elements of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ reorders the [rows](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) and [columns](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) of $\mathbf{\Sigma}$ and of $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})$ in the same way, so we may take $X_i$ and $X_j$ to be the last two elements. Cut $\mathbf{\Sigma}$ into [blocks](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#def-block-matrix) with the first $p - 2$ elements in the first block. By [Theorem 6](#thm-precision-matrix-inverse), $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}) = {\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}^{-1}$, and by [the inverse of a positive definite block matrix](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#thm-block-inverse), the last $2 \times 2$ block of $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})$ is ${\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}$, where $\mathbf{S}$ is the [Schur complement](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#def-schur-complement) of the first block of $\mathbf{\Sigma}$. By [Theorem 4](#thm-mvn-conditional), $\mathbf{S}$ is the [variance matrix](variance-covariance.llms.md#def-cov-vec-x) of ${(X_i, X_j)}^{\top}$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-ij} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-ij}$, so its diagonal elements $v_i$ and $v_j$ are the [conditional variances](variance-covariance.llms.md#def-cond-variance) of $X_i$ and $X_j$, and its off-diagonal element $c_{ij}$ is their [conditional covariance](variance-covariance.llms.md#def-cond-cov). Let $d = v_i v_j - c_{ij}^2$, the [determinant](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-determinant) of $\mathbf{S}$. The [inverse](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-matrix-inverse) of a $2 \times 2$ [matrix](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) gives
>
> $${\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1} = \frac{1}{d}\begin{pmatrix}v_j & -c_{ij} \\ -c_{ij} & v_i\end{pmatrix},$$
>
> so $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ii} = v_j / d$, $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{jj} = v_i / d$ and $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ij} = -c_{ij} / d$. Since $\mathbf{S}$ [is positive definite](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-positive-definite), $d > 0$, so
>
> $$\begin{aligned}
> \frac{-\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ij}}{\sqrt{\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ii}\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{jj}}}
> &= \frac{c_{ij} / d}{\sqrt{v_i v_j} / d}
> && \text{(substitute)} \\
> &= \frac{c_{ij}}{\sqrt{v_i v_j}},
> && \text{(cancel } d > 0 \text{)}
> \end{aligned}$$
>
> which is the [partial correlation](#def-partial-correlation) of $X_i$ and $X_j$.

> **NOTE:**
>
> **Example 13 (The partial correlations of a chain of three Gaussian variables)**  
>
> Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= {(X_1, X_2, X_3)}^{\top}$ be the [Gaussian](#def-normal) vector of [Example 11](#exm-precision-zero-cind), with
>
> $$\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}) = \begin{pmatrix}2 & -1 & 0 \\ -1 & 2 & -1 \\ 0 & -1 & 2\end{pmatrix}.$$
>
> By [Theorem 10](#thm-partial-correlation-precision), the [partial correlation](#def-partial-correlation) of $X_1$ and $X_2$ given $X_3$ is
>
> $$\frac{-\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{12}}{\sqrt{\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{11}\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{22}}}
> = \frac{1}{\sqrt{2 \cdot 2}}
> = \frac{1}{2},$$
>
> and the partial correlation of $X_1$ and $X_3$ given $X_2$ is $-0 / \sqrt{2 \cdot 2} = 0$, as [Theorem 8](#thm-precision-zero-cind) says for a zero element, although their [correlation](variance-covariance.llms.md#def-correlation) is not zero.

> **NOTE:**
>
> **Theorem 11 (The conditional mean of one element from the precision matrix)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\sim \operatorname{N}_p\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}, \mathbf{\Sigma}\right)\mathclose{}$ with $p \ge 2$, let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i}$ be $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ without its $i$th element, and let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-i}$ be a fixed value of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i}$. Then
>
> $${{\mathbb{E}\mathopen{}\left[X_i \mid\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-i}\right]\mathclose{}}}
> = \mu_i - \sum_{j \ne i} \frac{\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ij}}{\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ii}} \mathopen{}\left(x_j - \mu_j\right)\mathclose{},$$
>
> and ${{\operatorname{Var}\mathopen{}\left(X_i \mid\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-i}\right)\mathclose{}}} = 1 / \tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ii}$, where $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})$ is the [precision matrix](#def-precision-matrix) of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$.

> **NOTE:**
>
> *Proof*. Reordering the elements of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$ reorders the [rows](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) and [columns](https://morrison-lab.github.io/mds/linear-algebra-matrices.html#def-matrix) of $\mathbf{\Sigma}$ and of $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})$ in the same way, so we may take $X_i$ to be the last element. Cut $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}$, $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$ and $\mathbf{\Sigma}$ into [blocks](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#def-block-matrix) with $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i}$ first and $X_i$ last, as in [Theorem 4](#thm-mvn-conditional) with $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_1 = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i}$ and $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_2 = X_i$, and let $\mathbf{S} = \mathbf{\Sigma}_{22} - \mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathbf{\Sigma}_{12}$. By [Theorem 4](#thm-mvn-conditional), the [conditional mean](#def-cond-expectation-function) and [conditional variance](variance-covariance.llms.md#def-cond-variance) of $X_i$ given $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}_{-i} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-i}$ are
>
> $$\mu_i + \mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}_{-i} - \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}_{-i}\right)\mathclose{}
> \quad \text{and} \quad
> \mathbf{S}.$$
>
> By [Theorem 6](#thm-precision-matrix-inverse), $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}) = {\mathopen{}\left(\mathbf{\Sigma}\right)\mathclose{}}^{-1}$, and by [the inverse of a positive definite block matrix](https://morrison-lab.github.io/mds/linear-algebra-diagonalization.html#thm-block-inverse), its blocks $\mathbf{\Omega}_{21}$ and $\mathbf{\Omega}_{22}$ satisfy
>
> $$\mathbf{\Omega}_{22} = {\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1},
> \quad
> \mathbf{\Omega}_{21} = -{\mathopen{}\left(\mathbf{S}\right)\mathclose{}}^{-1}\mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}.$$
>
> Here $\mathbf{\Omega}_{22} = \tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ii}$ is a [scalar](https://morrison-lab.github.io/mds/linear-algebra-vectors.html#def-scalar), so the conditional variance is $\mathbf{S} = 1 / \tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ii}$, and multiplying the second equation by $\mathbf{S}$ gives
>
> $$\begin{aligned}
> \mathbf{\Sigma}_{21}{\mathopen{}\left(\mathbf{\Sigma}_{11}\right)\mathclose{}}^{-1}
> &= -\mathbf{S}\mathbf{\Omega}_{21}
> && \text{(multiply by } \mathbf{S} \text{)} \\
> &= -\frac{\mathbf{\Omega}_{21}}{\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ii}}.
> && \text{(} \mathbf{S} = 1 / \tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ii} \text{)}
> \end{aligned}$$
>
> The elements of $\mathbf{\Omega}_{21}$ are $\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ij}$ for $j \ne i$, so the conditional mean is
>
> $$\mu_i - \sum_{j \ne i} \frac{\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ij}}{\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{ii}} \mathopen{}\left(x_j - \mu_j\right)\mathclose{}.$$

> **NOTE:**
>
> **Example 14 (The conditional mean and variance of the middle element of a chain of three Gaussian variables)**  
>
> Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}= {(X_1, X_2, X_3)}^{\top}$ be the [Gaussian](#def-normal) vector of [Example 11](#exm-precision-zero-cind), with ${\mathbb{E}\mathopen{}\left[\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}\right]\mathclose{}} = \mathbf{0}$ and
>
> $$\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}}) = \begin{pmatrix}2 & -1 & 0 \\ -1 & 2 & -1 \\ 0 & -1 & 2\end{pmatrix}.$$
>
> By [Theorem 11](#thm-conditional-mean-precision) with $i = 2$, using the second row of the [precision matrix](#def-precision-matrix),
>
> $${{\mathbb{E}\mathopen{}\left[X_2 \mid X_1 = x_1, X_3 = x_3\right]\mathclose{}}}
> = -\frac{-1}{2}x_1 - \frac{-1}{2}x_3
> = \frac{x_1 + x_3}{2},$$
>
> and ${{\operatorname{Var}\mathopen{}\left(X_2 \mid X_1 = x_1, X_3 = x_3\right)\mathclose{}}} = 1 / 2$. So the [conditional mean](#def-cond-expectation-function) of $X_2$ is the midpoint of its two neighbors’ values. The coefficient of $x_1$ is $-\tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{21} / \tau(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{X}}\vphantom{X}})_{22} = 1/2$, and the coefficient of a neighbor with a zero off-diagonal element would be zero, as [Theorem 8](#thm-precision-zero-cind) says.

> **NOTE:**
>
> **Theorem 12 (Mahalanobis distance in eigenvector coordinates)** Let $\mathbf{\Sigma}$ be positive definite, with [eigendecomposition](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#def-eigendecomposition) $\mathbf{\Sigma} = \mathbf{Q}\mathbf{\Lambda}{\mathbf{Q}}^{\top}$, where $\mathbf{Q}$ has columns $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_1, \ldots, \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_p$ and $\mathbf{\Lambda}$ has diagonal elements $\lambda_1, \ldots, \lambda_p$. Then:
>
> $$\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})^2 = \sum_{i=1}^p\frac{\mathopen{}\left({\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_i}^{\top}(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})\right)\mathclose{}^2}{\lambda_i}$$

> **NOTE:**
>
> *Proof*. Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{y}}\vphantom{y}} = {\mathbf{Q}}^{\top}(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})$, whose $i$-th element is $y_i = {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_i}^{\top}(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})$. By the [inverse of a positive definite matrix](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#thm-pd-inverse), $\mathbf{\Sigma}^{-1} = \mathbf{Q}\mathbf{\Lambda}^{-1}{\mathbf{Q}}^{\top}$, with every $\lambda_i > 0$. So:
>
> $$\begin{aligned}
> \Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})^2
> &= {(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}^{\top} \mathbf{Q}\mathbf{\Lambda}^{-1}{\mathbf{Q}}^{\top} (\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})
> && \text{(definition; substitute } \mathbf{\Sigma}^{-1} \text{)} \\
> &= {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{y}}\vphantom{y}}}^{\top} \mathbf{\Lambda}^{-1} \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{y}}\vphantom{y}}
> && \text{(} {(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}})}^{\top}\mathbf{Q} = {\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{y}}\vphantom{y}}}^{\top} \text{)} \\
> &= \sum_{i=1}^p\frac{y_i^2}{\lambda_i}
> && \text{(} \mathbf{\Lambda}^{-1} \text{ is diagonal)}
> \end{aligned}$$

> **NOTE:**
>
> *Remark*. $y_i$ is the coordinate of $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}- \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$ along the eigenvector $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_i$. So the set of points at Mahalanobis distance $\delta$ from $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$, where the multivariate normal density is constant ([Corollary 1](#cor-mvn-mahalanobis)), is an ellipse ($p = 2$) or ellipsoid centered at $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}}$, with axes along the eigenvectors of $\mathbf{\Sigma}$ and half-length $\delta\sqrt{\lambda_i}$ along $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_i$.

> **NOTE:**
>
> **Example 15 (Elliptical contours of a bivariate normal density)** Let $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{\mu}}\vphantom{\mu}} = \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{0}}\vphantom{0}}$ and $\mathbf{\Sigma} = \begin{pmatrix}2 & 1 \\ 1 & 2\end{pmatrix}$, which has eigenvalues $3$ and $1$, with eigenvectors $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_1 = \frac{1}{\sqrt{2}}{(1, 1)}^{\top}$ and $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_2 = \frac{1}{\sqrt{2}}{(1, -1)}^{\top}$ ([an eigendecomposition example](https://morrison-lab.github.io/mds/linear-algebra-special-matrices.html#exm-spectral)). By [Theorem 12](#thm-mahalanobis-eigen):
>
> $$\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})^2 = \frac{(x_1 + x_2)^2}{2 \cdot 3} + \frac{(x_1 - x_2)^2}{2 \cdot 1}$$
>
> The point
>
> $$\begin{aligned}
> \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}&= \sqrt{3}\,\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_1 \\
> &= \sqrt{3/2}\,{(1, 1)}^{\top}
> \end{aligned}$$
>
> has $x_1 + x_2 = \sqrt{6}$ and $x_1 - x_2 = 0$, so
>
> $$\begin{aligned}
> \Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})^2 &= 6/6 \\
> &= 1;
> \end{aligned}$$
>
> the point $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}= \mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_2$ has $x_1 + x_2 = 0$ and $x_1 - x_2 = \sqrt{2}$, so
>
> $$\begin{aligned}
> \Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}})^2 &= 2/2 \\
> &= 1.
> \end{aligned}$$
>
> So the contour $\Delta(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{x}}\vphantom{x}}) = 1$ of the $\operatorname{N}_2\mathopen{}\left(\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{0}}\vphantom{0}}, \mathbf{\Sigma}\right)\mathclose{}$ density is an ellipse stretched along ${(1, 1)}^{\top}$, with half-length $\sqrt{3}$, and squeezed along ${(1, -1)}^{\top}$, with half-length $1$: $X_1$ and $X_2$ are positively correlated ([Figure 2](#fig-mahalanobis-eigen)).
>
> > **NOTE:**
> >
> > Show code
> >
> > ``` r
> > # The covariance matrix of the example and its eigendecomposition.
> > mh_entries <- c(2, 1, 1, 2)
> > mh_covmat <- matrix(mh_entries, nrow = 2)
> > mh_eig <- eigen(mh_covmat)
> > mh_values <- mh_eig$values
> > mh_expected <- c(3, 1)
> > mh_matches <- all.equal(mh_values, mh_expected)
> > stopifnot(mh_matches)
> >
> > # The Mahalanobis distance of each grid point from the mean zero.
> > mh_axis <- seq(-3.5, 3.5, length.out = 200)
> > mh_grid <- tidyr::expand_grid(x1 = mh_axis, x2 = mh_axis)
> > mh_points <- as.matrix(mh_grid)
> > mh_inverse <- solve(mh_covmat)
> > mh_quad <- (mh_points %*% mh_inverse) * mh_points
> > mh_sums <- rowSums(mh_quad)
> > mh_dist <- sqrt(mh_sums)
> > mh_grid <- dplyr::mutate(mh_grid, mahal = mh_dist)
> >
> > # The points of the example: sqrt(3) q1 and q2, each at distance 1.
> > mh_long <- sqrt(3 / 2)
> > mh_short <- 1 / sqrt(2)
> > mh_marks_x1 <- c(mh_long, mh_short)
> > mh_marks_x2 <- c(mh_long, -mh_short)
> > mh_marks <- tibble::tibble(x1 = mh_marks_x1, x2 = mh_marks_x2)
> >
> > mh_contour_aes <- ggplot2::aes(z = mahal, colour = ggplot2::after_stat(level))
> > mh_breaks <- c(1, 2)
> > mh_contours <- ggplot2::geom_contour(mh_contour_aes, breaks = mh_breaks)
> > mh_dots <- ggplot2::geom_point(data = mh_marks, size = 2.5)
> > mh_colours <- ggplot2::scale_colour_viridis_c(
> >   name = "Mahalanobis distance",
> >   end = 0.7,
> >   breaks = mh_breaks,
> >   guide = "legend"
> > )
> > mh_plot <- mh_grid |>
> >   ggplot2::ggplot() +
> >   ggplot2::aes(x1, x2) +
> >   mh_contours +
> >   mh_dots +
> >   mh_colours +
> >   ggplot2::coord_fixed(expand = FALSE) +
> >   ggplot2::labs(x = "x1", y = "x2") +
> >   ggplot2::theme(legend.position = "bottom")
> >
> > mh_is_html <- knitr::is_html_output()
> > if (mh_is_html) {
> >   mh_legend <- list(
> >     orientation = "h",
> >     x = 0.5,
> >     xanchor = "center",
> >     y = -0.25
> >   )
> >   mh_widget <- plotly::ggplotly(mh_plot) |>
> >     plotly::layout(legend = mh_legend) |>
> >     plotly::config(displaylogo = FALSE, responsive = TRUE)
> >   htmltools::div(
> >     role = "img",
> >     `aria-label` = fig_alt_mahal_eigen,
> >     mh_widget
> >   )
> > } else {
> >   mh_plot
> > }
> > ```
> >
> > Figure 2: The contours of the Mahalanobis distance at $1$ and $2$ for the example. The dots are the points $\sqrt{3}\,\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_1$ and $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_2$ of the example on the inner ellipse.
>
> > **NOTE:**
> >
> > Show code
> >
> > ``` r
> > mh3_entries <- c(2, 1, 1, 2)
> > mh3_covmat <- matrix(mh3_entries, nrow = 2)
> > mh3_inverse <- solve(mh3_covmat)
> > mh3_x1 <- seq(-3.5, 3.5, length.out = 101)
> > mh3_x2 <- seq(-3.5, 3.5, length.out = 101)
> > mh3_grid <- tidyr::expand_grid(x1 = mh3_x1, x2 = mh3_x2)
> > mh3_points <- as.matrix(mh3_grid)
> > mh3_quad <- (mh3_points %*% mh3_inverse) * mh3_points
> > mh3_sums <- rowSums(mh3_quad)
> > mh3_dist <- sqrt(mh3_sums)
> > mh3_n_x2 <- length(mh3_x2)
> > mh3_z <- matrix(mh3_dist, nrow = mh3_n_x2)
> >
> > # The points of the example: sqrt(3) q1 and q2, each at distance 1.
> > mh3_long <- sqrt(3 / 2)
> > mh3_short <- 1 / sqrt(2)
> > mh3_marks_x1 <- c(mh3_long, mh3_short)
> > mh3_marks_x2 <- c(mh3_long, -mh3_short)
> > mh3_marks_z <- c(1, 1)
> > mh3_marks <- tibble::tibble(
> >   x1 = mh3_marks_x1,
> >   x2 = mh3_marks_x2,
> >   z = mh3_marks_z
> > )
> > mh3_marker <- list(color = "black", size = 5)
> > mh3_contours_z <- list(
> >   show = TRUE,
> >   start = 1,
> >   end = 2,
> >   size = 1,
> >   color = "red"
> > )
> > mh3_contours <- list(z = mh3_contours_z)
> > mh3_stops <- c(0, 1)
> > mh3_cols <- c("#CCE0F0", "#0072B2")
> > mh3_scale <- list(mh3_stops, mh3_cols)
> > mh3_eye <- list(x = 1.6, y = -1.6, z = 0.9)
> > mh3_camera <- list(eye = mh3_eye)
> > mh3_xaxis <- list(title = "x1")
> > mh3_yaxis <- list(title = "x2")
> > mh3_zaxis <- list(title = "Mahalanobis distance")
> > mh3_scene <- list(
> >   xaxis = mh3_xaxis,
> >   yaxis = mh3_yaxis,
> >   zaxis = mh3_zaxis,
> >   camera = mh3_camera
> > )
> > mh3_widget <- plotly::plot_ly() |>
> >   plotly::add_surface(
> >     x = mh3_x1,
> >     y = mh3_x2,
> >     z = mh3_z,
> >     contours = mh3_contours,
> >     colorscale = mh3_scale,
> >     showscale = FALSE,
> >     opacity = 0.8
> >   ) |>
> >   plotly::add_markers(
> >     data = mh3_marks,
> >     x = ~x1,
> >     y = ~x2,
> >     z = ~z,
> >     showlegend = FALSE,
> >     marker = mh3_marker
> >   ) |>
> >   plotly::layout(scene = mh3_scene)
> > htmltools::div(
> >   role = "img",
> >   `aria-label` = fig_alt_mahal_surf,
> >   mh3_widget
> > )
> > ```
> >
> > Figure 3: The [Mahalanobis distance](#def-mahalanobis) is a surface over the plane, a cone whose horizontal slices are the ellipses of [Figure 2](#fig-mahalanobis-eigen). The red lines are the contours at $1$ and $2$, and the dots are the points $\sqrt{3}\,\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_1$ and $\mathord{\smash[b]{\underset{\raise.3ex\hbox{$\scriptstyle\sim$}}{q}}\vphantom{q}}_2$ of the example on the inner one.

# Definitions on this page

- [Definition 1 (Multivariate normal distribution (multivariate Gaussian distribution))](#def-mvn)
- [Definition 2 (Mahalanobis distance)](#def-mahalanobis)
- [Definition 3 (Conditional precision)](#def-conditional-precision)
- [Definition 4 (Coprecision)](#def-coprecision)
- [Definition 5 (Precision matrix)](#def-precision-matrix)
- [Definition 6 (Partial correlation)](#def-partial-correlation)

# References

\[1\]

Wikipedia contributors, “Multivariate normal distribution — Wikipedia, the free encyclopedia.” 2026. Available: <https://en.wikipedia.org/wiki/Multivariate_normal_distribution>

\[2\]

Wikipedia contributors, “Mahalanobis distance — Wikipedia, the free encyclopedia.” 2026. Available: <https://en.wikipedia.org/wiki/Mahalanobis_distance>

Back to top
