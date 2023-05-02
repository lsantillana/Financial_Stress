# SEFS Financial Questionnaire Analysis
# Ben Sullender
# May 2, 2023
# Draft 2

# Set your working directory to downloads folder (or wherever you store the downloaded survey results)
# Note that this is also where your saved pie charts will be.
setwd("/Users/bensullender/Downloads")

# This is the default file name when I download it.
#results <- read.csv(paste0(getwd(),"/SEFS Graduate Student Finances Survey (Responses) - Form Responses 1.csv"))

results <- read.csv("SEFS Graduate Student Finances Survey_49 responses.csv")

# Select the columns you'd like to build a pie chart for
pieQs <- c(26:34,37,38,46,47,57)
# column 26 is "I can live comfortably on my current stipend."

# This now reads the number of characters in the question title,
#           and adds a new line ("\n") at a space between character #99-105.

for (i in 1:length(pieQs)){
  qResults <- data.frame(cbind(c("StrDis","Dis","Neu","Ag","StrAg"),rep(0,5)))
  names(qResults) <- c("Statement","n")
  qResults[1,2] <- length(which(results[,pieQs[i]]==1))
  qResults[2,2] <- length(which(results[,pieQs[i]]==2))
  qResults[3,2] <- length(which(results[,pieQs[i]]==3))
  qResults[4,2] <- length(which(results[,pieQs[i]]==4))
  qResults[5,2] <- length(which(results[,pieQs[i]]==5))
  qResults$n <- as.numeric(qResults$n)
  sumQ <- sum(qResults$n)
  jpeg(file=ifelse(nchar(names(results[pieQs[i]]))<100,
                   paste0("Q-",names(results[pieQs[i]]),".jpg"),
                   paste0("Q-",substr(names(results[pieQs[i]]),0,100),".jpg")),
              width=812, height=502)
  pie(qResults$n,
           paste0(labels=c("Strongly disagree","Disagree","Neutral","Agree","Strongly Agree")," (",round(((qResults$n/sumQ)*100),1),"%)"),
           col = c("red","orange","yellow","darkolivegreen1","green"),
           main = ifelse(nchar(names(results[pieQs[i]]))<100,
                    gsub('\\.',' ',names(results[pieQs[i]])),
                    ifelse(
                      substr(names(results[pieQs[i]]),99,99)==".",
                      paste0(substr(gsub('\\.',' ',names(results[pieQs[i]])),0,99),"\n",
                             substr(gsub('\\.',' ',names(results[pieQs[i]])),99,200)),
                      ifelse(
                      substr(names(results[pieQs[i]]),100,100)==".",
                            paste0(substr(gsub('\\.',' ',names(results[pieQs[i]])),0,100),"\n",
                                   substr(gsub('\\.',' ',names(results[pieQs[i]])),100,200)),
                            ifelse(
                              substr(names(results[pieQs[i]]),101,101)==".",
                                     paste0(substr(gsub('\\.',' ',names(results[pieQs[i]])),0,101),"\n",
                                            substr(gsub('\\.',' ',names(results[pieQs[i]])),101,nchar(names(results[pieQs[i]])))),
                              ifelse(
                                substr(names(results[pieQs[i]]),102,102)==".",
                                    paste0(substr(gsub('\\.',' ',names(results[pieQs[i]])),0,102),"\n",
                                           substr(gsub('\\.',' ',names(results[pieQs[i]])),102,nchar(names(results[pieQs[i]])))),
                                ifelse(
                                  substr(names(results[pieQs[i]]),103,103)==".",
                                  paste0(substr(gsub('\\.',' ',names(results[pieQs[i]])),0,103),"\n",
                                         substr(gsub('\\.',' ',names(results[pieQs[i]])),103,200)),
                                  ifelse(
                                    substr(names(results[pieQs[i]]),104,104)==".",
                                    paste0(substr(gsub('\\.',' ',names(results[pieQs[i]])),0,104),"\n",
                                           substr(gsub('\\.',' ',names(results[pieQs[i]])),104,nchar(names(results[pieQs[i]])))),
                                    paste0(substr(gsub('\\.',' ',names(results[pieQs[i]])),0,105),"\n",
                                           substr(gsub('\\.',' ',names(results[pieQs[i]])),105,nchar(names(results[pieQs[i]]))))
                                    ))))))))
  dev.off()
}
