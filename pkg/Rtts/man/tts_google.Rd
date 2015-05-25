\name{tts_google}
\alias{tts_google}

\title{
Convert Text into Speech (voice files in .mp3 format)
}
\description{
Convert text into speech (voice files in .mp3 format) using the API offered by Google Translate (https://translate.google.com). 
Note that this function can only help convert restricted-length text (roughly nchar(text)<=100).
}
\usage{
tts_google(content = "hello world", destfile = paste(getwd(),"r.mp3",sep="/"))
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
\note{
   This function can only help convert restricted-length text (roughly nchar(text)<=100).
}
\references{
https://translate.google.com
}
\author{
  DENG Xiaodong
}
\examples{
  tts_google("Hello.")
}
