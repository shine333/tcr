% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/diversity.R
\name{inverse.simpson}
\alias{inverse.simpson}
\alias{diversity}
\alias{gini}
\alias{chao1}
\alias{gini.simpson}
\title{Distribution evaluation.}
\usage{
inverse.simpson(.data, .do.norm = NA, .laplace = 0)

diversity(.data, .q = 5, .do.norm = NA, .laplace = 0)

gini(.data, .do.norm = NA, .laplace = 0)

gini.simpson(.data, .do.norm = NA, .laplace = 0)

chao1(.data)
}
\arguments{
\item{.data}{Numeric vector of values for proportions or for numbers of individuals.}

\item{.do.norm}{One of the three values - NA, T or F. If NA than check for distrubution (sum(.data) == 1)
and normalise if needed with the given laplace correction value. if T then do normalisation and laplace
correction. If F than don't do normalisaton and laplace correction.}

\item{.laplace}{Value for Laplace correction which will be added to every value in the .data.}

\item{.q}{q-parameter for the Diversity index.}
}
\value{
Numeric vector of length 1 with value for all functions except \code{chao1}, which returns 4 values:
estimated number of species, standart deviation of this number and two 95% confidence intervals for the species number.
}
\description{
Functions for evaluating the diversity of species or objects in the given distribution.
See the \code{repOverlap} function for working with clonesets and a general interface to
all of this functions.

Warning!
Functions will check if .data is a distribution of a random variable (sum == 1) or not.
To force normalisation and / or to prevent this, set .do.norm to TRUE (do normalisation)
or FALSE (don't do normalisation), respectively.

- True diversity, or the effective number of types, refers to the number
of equally-abundant types needed for the average proportional abundance
of the types to equal that observed in the dataset of interest 
where all types may not be equally abundant.

- Inverse Simpson index is the effective number of types that is obtained when
the weighted arithmetic mean is used to quantify average 
proportional abundance of types in the dataset of interest.

- The Gini coefficient measures the inequality among values
of a frequency distribution (for example levels of income). A Gini coefficient of zero
expresses perfect equality, where all values are the same (for example, where everyone
has the same income). A Gini coefficient of one (or 100 percents ) expresses maximal inequality
among values (for example where only one person has all the income).

- The Gini-Simpson index is the probability of interspecific encounter, i.e., probability that two entities
represent different types.

- Chao1 estimator is a nonparameteric asymptotic estimator of species richness (number of species in a population).
}
\examples{
data(twb)
# Next two are equal calls:
stopifnot(gini(twb[[1]]$Read.count, TRUE, 0) - 0.7609971 < 1e-07)
stopifnot(gini(twb[[1]]$Read.proportion, FALSE) - 0.7609971 < 1e-07)
stopifnot(chao1(twb[[1]]$Read.count)[1] == 1e+04)
}
\seealso{
\link{repOverlap}, \link{entropy}, \link{similarity}
}
