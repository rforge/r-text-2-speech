tts_ITRI <- function(text="hello",
                     account="test-for-r",
                     password="test1for1r",
                     destfile=paste(getwd(),"/RTTS.flv",sep=""),
                     warning.off=FALSE){
  
  # Remind the users of the potential risk.
  if(warning.off==FALSE & account=="test-for-r"){
    cat("REMINDER:\n")
    cat("Please not that you're using the default test account.\n")
    cat("This is a public account, which means that the text you submitted may be released.\n")
    cat("You may want to register a private ITRI account for free:\n")
    cat("http://tts.itri.org.tw\n\n")
    
    reminder="initial"
    while(!reminder %in% c("Y","N")){
      reminder <- readline("Proceed(Y) or Quit(N)?\n")
    }
    if(reminder=="N"){
      return()
    }
  }
  
  
  # part 0-1: check if php is installed
  
  cat("\nREQUIREMENT CHECK:\n")
  if(Sys.info()[1]=="Linux"){
    check_result <- grep("php",system("ls /usr/bin", intern=TRUE))
  }
  if(Sys.info()[1]=="Windows"){
    cat("Windows not supported temporarily.")
    return()
  }
  if(!Sys.info()[1] %in% c("Linux","Windows")){
    cat("Your platform (operation system) can't be detected.\n")
    return()
  }
  
  if(length(check_result)>0){
    cat("php is well installed on your machine. ... WELL\n\n")
  }else{
    cat("php is not installed on your machine.\nPlease install php prior using this package.\n\n")
    return()
  }
  
  
  
  # part 0-2: check if can access the API
  
  # part 1: get file ID
  
  get_ID <- function(text,account,password){
    a="php -r "
    b_1 <- '$client = new SoapClient("http://tts.itri.org.tw/TTSService/Soap_1_3.php?wsdl");
  $result=$client->ConvertText('
    b_2 <- ',"Theresa",100, 0, "flv");echo $result;'
    
    b <- paste(b_1,account,',',password,',',text,b_2,sep='"')
    query <- paste(a,b," ",sep="'")
    
    #   write(query,file="/home/deng/TTS_1.bash")
    # 
    #   query_result_ID <- system("bash /home/deng/TTS_1.bash",intern = TRUE)
    query_result <- system(query, intern = TRUE)
    
    # Here we can check if the loging is valid by the result( if the account or password is valid)
    if(strsplit(query_result,split = "&")[[1]][2]=="invalid login"){
      cat("Invalid login\n")
      cat("Please check your account ID or password.\n\n")
      return("INVALID_LOGIN")
    }
    
    cat("ID obtained: ",
        strsplit(query_result,split = "&")[[1]][3],
        "\n")
    return(strsplit(query_result,split = "&")[[1]][3])
  }
  
  # part 2: get file URL
  get_url <- function(account,password,ID){
    a="php -r "
    b_1 <- '$client = new SoapClient("http://tts.itri.org.tw/TTSService/Soap_1_3.php?wsdl");$result=$client->GetConvertStatus('
    
    b_2 <- ');echo $result;'
    
    b <- paste(b_1,account,',',password,',',ID,b_2,sep='"')
    
    query <- paste(a,b," ",sep = "'")
    
    query_result_url <- system(query,intern = TRUE)
    
    return(query_result_url)
  }
  
  # part 3: download the file
  query_ID <- get_ID(text,account,password)
  if(query_ID=="INVALID_LOGIN"){
    return()
  }
  
  #as the ITRI needs some time to process, 
  #so here we check if the process is completed
  cat("\nITRI TTS is processing your request.\n")
  cat("A few seconds may be needed.\n\n")
  cat("Please ignore the messages \"PHP Notice\" and wait a moment.")
  
  while(strsplit(get_url(account,password,ID = query_ID),split = "&")[[1]][4]!="completed"){
    Sys.sleep(1)
  }
    
  url_obtained <- strsplit(get_url(account,password,ID = query_ID), split="&")[[1]][5]
  cat("\nURL obtained: \n", url_obtained, "\n\n")
  
  download.file(url = url_obtained, destfile = destfile)
  cat("\nThe voice file is saved in: ", destfile)
}


