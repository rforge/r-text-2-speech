##  http://tts.itri.org.tw/development/web_service_api.php

tts_ITRI <- function(text="hello world",
                     account="",
                     password="",
                     destfile=paste(getwd(),"/RTTS.flv",sep="")){
  
  # part 0-1: check if php is installed
  
  cat("\nREQUIREMENT CHECK:\n")
  php_check <- system("php -v", intern = TRUE)
  if(substr(php_check[1],1,3)!="PHP"){
    cat("php is not installed on your machine.\nPlease install php prior using this package.\n\n")
    stop()
  }else{
    cat("php is well installed on your machine. ... WELL\n\n")
  }
  
  # part 0-2: check if can access the API
  
  # part 1: get file ID
  
  get_ID <- function(text,account,password){
    a="php -r "
    b_1 <- '$client = new SoapClient("http://tts.itri.org.tw/TTSService/Soap_1_3.php?wsdl");
  $result=$client->ConvertText('
    b_2 <- ',"Theresa",100, 0, "flv");
  $resultArray= explode("&",$result);
  list($resultCode, $resultString, $resultConvertID) = $resultArray;
  echo $resultConvertID;'
    
    b <- paste(b_1,account,',',password,',',text,b_2,sep='"')
    query <- paste(a,b," ",sep="'")
    
    #   write(query,file="/home/deng/TTS_1.bash")
    # 
    #   query_result_ID <- system("bash /home/deng/TTS_1.bash",intern = TRUE)
    query_result_ID <- system(query, intern = TRUE)
    cat("ID obtained: ",query_result_ID,"\n")
    return(query_result_ID)
  }
  
  # part 2: get file URL
  get_url <- function(account,password,ID){
    a="php -r "
    b_1 <- '$client = new SoapClient("http://tts.itri.org.tw/TTSService/Soap_1_3.php?wsdl");$result=$client->GetConvertStatus('
    
    b_2 <- ');$resultArray= explode("&",$result);list($resultCode, $resultString, $statusCode, $status, $resultUrl) = $resultArray;echo $result;'
    
    b <- paste(b_1,account,',',password,',',ID,b_2,sep='"')
    
    query <- paste(a,b," ",sep = "'")
    
    query_result_url <- system(query,intern = TRUE)
    
    return(query_result_url)
  }
  
  # part 3: download the file
  query_ID <- get_ID(text,account,password)
  
  #as the ITRI needs some time to process, 
  #so here we check if the process is completed
  cat("\nITRI TTS is processing your request.\n")
  cat("A few seconds may be needed.\n\n")
  cat("Please ignore the messages \"PHP Notice\"")
  t_mark <- Sys.time()
  
  while(strsplit(get_url(account,password,ID = query_ID),split = "&")[[1]][4]!="completed"){
    Sys.sleep(1)
  }
    
  url_obtained <- strsplit(get_url(account,password,ID = query_ID), split="&")[[1]][5]
  cat("\nURL obtained: \n", url_obtained, "\n\n")
  
  download.file(url = url_obtained, destfile = destfile)
  cat("\nThe voice file is saved in: ", destfile)
}


