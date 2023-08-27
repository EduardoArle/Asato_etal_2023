wd_tab <- "/Users/carloseduardoaribeiro/Documents/Collaborations/Aninha/presence"

setwd(wd_tab)
tabs <- lapply(list.files(pattern = ".csv"),function(x){read.csv(x,sep = " ")})

plot <- numeric()
overlap <- numeric()

for(i in 1:length(tabs))
{
  #selct table for each plot
  tab <- tabs[[i]]
  
  #identify plot
  plot[i] <- tab[1,1]
  
  #calculate average species overlap in the plot
  overlap[i] <- seila(tab) ### Install function ´seila´ *Function_calculation*
}

result <- data.frame(Plot_ID = plot,
                     Species_overlap = overlap)

setwd("/Users/carloseduardoaribeiro/Documents/Collaborations/Aninha")
write.csv(result,"Results.csv")
