\name{tts_ITRI}
\alias{tts_ITRI}

\title{
Convert Text into Speech (voice files in .flv format)
}
\description{
Convert text into speech (voice files in .flv format) using the trial API offered by ITRI TTS @web (https://tts.itri.org.tw). English and Chinese (both traditional and simplified) are supported. PHP is required on user's machine.
}
\usage{
tts_ITRI(text = "hello", account="test-for-r", password ="test1for1r", ...)
}

\arguments{
  \item{text}{
  The text to convert into speech. In string format.
}
  \item{account}{
  ITRI TTS @web account. You can register freely on ITRI TTS @web website (http://tts.itri.org.tw)
}
  \item{password}{
  ITRI TTS @web account password.
}
  \item{destfile}{
  The path to save the audio files generated plus the file name (including the postfix).
}
}
\details{
  Convert text into speech (voice files in flv format) using the API offered by ITRI TTS @web. PHP is required on user's machine.
}
\references{
http://tts.itri.org.tw

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
  tts_ITRI("Let us do it", "test-for-r", "test1for1r")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ text}
\keyword{ speech }% __ONLY ONE__ keyword per line
