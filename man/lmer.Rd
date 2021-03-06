% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lmer.R
\name{lmer}
\alias{lmer}
\title{Fit Linear Mixed-Effects Models}
\usage{
lmer(formula, data = NULL, REML = TRUE, control = lmerControl(),
  start = NULL, verbose = 0L, subset, weights, na.action, offset,
  contrasts = NULL, devFunOnly = FALSE, ...)
}
\arguments{
\item{formula}{a two-sided linear formula object describing both the
    fixed-effects and random-effects part of the model, with the
    response on the left of a \code{~} operator and the terms, separated
    by \code{+} operators, on the right.  Random-effects terms are
    distinguished by vertical bars (\code{|}) separating expressions
    for design matrices from grouping factors.  Two vertical bars
    (\code{||}) can be used to specify multiple uncorrelated random
    effects for the same grouping variable. (Because of the way it is
    implemented, the \code{||}-syntax \emph{works
    only for design matrices containing
    numeric (continuous) predictors}; to fit models with independent
  categorical effects, see \code{\link{dummy}} or the \code{lmer_alt}
  function from the \code{afex} package.) 
}

\item{data}{an optional data frame containing the variables named in
    \code{formula}.  By default the variables are taken from the
    environment from which \code{lmer} is called. While \code{data} is
    optional, the package authors \emph{strongly} recommend its use,
    especially when later applying methods such as \code{update} and
    \code{drop1} to the fitted model (\emph{such methods are not
    guaranteed to work properly if \code{data} is omitted}). If
    \code{data} is omitted, variables will be taken from the environment
    of \code{formula} (if specified as a formula) or from the parent
    frame (if specified as a character vector).}

\item{REML}{logical scalar - Should the estimates be chosen to
    optimize the REML criterion (as opposed to the log-likelihood)?}

\item{control}{a list (of correct class, resulting from
    \code{\link{lmerControl}()} or \code{\link{glmerControl}()}
    respectively) containing control parameters, including the nonlinear
    optimizer to be used and parameters to be passed through to the
    nonlinear optimizer, see the \code{*lmerControl} documentation for
    details.}

\item{start}{a named \code{\link{list}} of starting values for the
    parameters in the model.  For \code{lmer} this can be a numeric
    vector or a list with one component named \code{"theta"}.}

\item{verbose}{integer scalar.  If \code{> 0} verbose output is
    generated during the optimization of the parameter estimates.  If
    \code{> 1} verbose output is generated during the individual
    penalized iteratively reweighted least squares (PIRLS) steps.}

\item{subset}{an optional expression indicating the subset of the rows
    of \code{data} that should be used in the fit. This can be a logical
    vector, or a numeric vector indicating which observation numbers are
    to be included, or a character vector of the row names to be
    included.  All observations are included by default.}

\item{weights}{an optional vector of \sQuote{prior weights} to be used
    in the fitting process.  Should be \code{NULL} or a numeric vector.
    Prior \code{weights} are \emph{not} normalized or standardized in
    any way.  In particular, the diagonal of the residual covariance
    matrix is the squared residual standard deviation parameter
    \code{\link{sigma}} times the vector of inverse \code{weights}.
    Therefore, if the \code{weights} have relatively large magnitudes,
    then in order to compensate, the \code{\link{sigma}} parameter will
    also need to have a relatively large magnitude.}

\item{na.action}{a function that indicates what should happen when the
    data contain \code{NA}s.  The default action (\code{na.omit},
    inherited from the 'factory fresh' value of
    \code{getOption("na.action")}) strips any observations with any
    missing values in any variables.}

\item{offset}{this can be used to specify an \emph{a priori} known
    component to be included in the linear predictor during
    fitting. This should be \code{NULL} or a numeric vector of length
    equal to the number of cases.  One or more \code{\link{offset}}
    terms can be included in the formula instead or as well, and if more
    than one is specified their sum is used.  See
    \code{\link{model.offset}}.}

\item{contrasts}{an optional list. See the \code{contrasts.arg} of
    \code{model.matrix.default}.}

\item{devFunOnly}{logical - return only the deviance evaluation
    function. Note that because the deviance function operates on
    variables stored in its environment, it may not return
    \emph{exactly} the same values on subsequent calls (but the results
    should always be within machine tolerance).}

\item{...}{other potential arguments.  A \code{method} argument was
    used in earlier versions of the package.  Its functionality has been
    replaced by the \code{REML} argument.}
}
\value{
an S4 object of class \code{"lmerModLmerTest"}
}
\description{
This function overloads \code{\link[lme4]{lmer}} from the \pkg{lme4}-package
(\code{lme4::lmer}) and adds a couple of slots needed for the computation of
Satterthwaite denominator degrees of freedom. All arguments are the same as
for \code{lme4::lmer} and all the usual \code{lmer}-methods work.
}
\details{
For details about \code{lmer} see \code{\link[lme4]{lmer}}
(\code{help(lme4::lmer)}). The description of all arguments is taken
unedited from the \pkg{lme4}-package.

In cases when a valid \code{lmer}-object
(\code{lmerMod}) is produced, but when the computations needed for
Satterthwaite df fails, the \code{lmerMod} object is returned - not an
\code{lmerModLmerTest} object.
}
\examples{

data("sleepstudy", package="lme4")
m <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
class(m) # lmerModLmerTest

}
\seealso{
\code{\link[lme4]{lmer}} and \code{\link{lmerModLmerTest}}
}
\author{
Rune Haubo B. Christensen and Alexandra Kuznetsova for the overload
in \pkg{lmerTest} -- \pkg{lme4}-authors for the underlying implementation
in \pkg{lme4}.
}
