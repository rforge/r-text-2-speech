\name{tts_google}
\alias{tts_google}

\title{
Convert Text into Speech (voice files in .mp3 format)
}
\description{
Convert text into speech (voice files in .mp3 format) using the trial API offered by Google Translate (https://translate.google.com). Note that this function can only help convert restricted-length text (roughly nchar(text)<=100).
}
\usage{
tts_google(content = "hello world", destfile = location)
}

\arguments{
  \item{content}{
  The content to convert into speech. In string format
}
  \item{destfile}{
  where to save the voice file generated and the voice file name. Default path is the current working path.
}
}
\details{
  Convert text into speech (voice files in mp3 format) using the API offered by Google Translate. No other softwares are required to use this function.
}
\references{
https://translate.google.com
}
\author{
  DENG Xiaodong
}
\note{

}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
  tts_google("Hello world, this is Xiaodong")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ text}
\keyword{ speech }% __ONLY ONE__ keyword per line
