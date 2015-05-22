\name{tts_google}
\alias{tts_google}

\title{
Convert text into speech (voice files in mp3 format)
}
\description{
Convert text into speech (voice files in mp3 format) using the API offered by Google Translate
}
\usage{
tts_google(content = "hello world", destfile = paste(getwd(), "Rtts_test.mp3", sep = "/"))
}

\arguments{
  \item{content}{
  The content to convert into speech. In string format
}
  \item{destfile}{
  where to save the voice file generated. Default path is the current working path.
}
}
\details{
  Convert text into speech (voice files in mp3 format) using the API offered by Google Translate. No other softwares are required to use this function.
}
\references{
http://stackoverflow.com/questions/9893175/google-text-to-speech-api

}
\author{
  DENG, Xiaodong
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
