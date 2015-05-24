\name{tts_MS}
\alias{tts_MS}

\title{
Convert Text into Speech (voice files in .mp3 format)
}
\description{
Convert text into speech (voice files in .mp3 format) using the trial API offered by MicroSoft (http://www.projectoxford.ai/demo/speech#text2speech).
}
\usage{
tts_MS(text = "hello world", destfile = location)
}

\arguments{
  \item{text}{
  The text to convert into speech. In string format
}
  \item{destfile}{
  where to save the voice file generated and the voice file name. Default path is the current working path.
}
}
\details{
  Convert text into speech (voice files in mp3 format) using the API offered by MicroSoft. No other softwares are required to use this function.
}
\references{
http://www.projectoxford.ai
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
  tts_MS("Hello world.")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ text}
\keyword{ speech }% __ONLY ONE__ keyword per line
