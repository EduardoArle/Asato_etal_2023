seila <- function(tab){
  
  #list species
  sps <- tab$Species
  
  #calculate species pairwise monthly overlap 
  overlap <- numeric()
  
  for(i in 1:(length(sps)-1))
  {
    for(j in i:(length(sps)-1))
    {
      a <- tab[which(tab$Species == sps[i] | tab$Species == sps[j+1]),]
      b <- apply(a[-c(1,2)],2,sum)
      c <- length(which(b == 2))
      overlap[length(overlap)+1] <- c/12*100
    }
  }
  overlap2 <- mean(overlap)
  return(overlap2)
}


