### word cloud 

# Install required packages
install.packages(c("tm", "wordcloud","SnowballC"))

# Load libraries
library(tm)
library(wordcloud)
library("RColorBrewer")

# read in the text file
text <- readLines(file.choose())


# read as corpus
docs <- Corpus(VectorSource(text))
inspect(docs)

# drop characters 
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
# Strip unnecessary whitespace
docs <- tm_map(docs, stripWhitespace)
inspect(docs)
# Convert to lowercase
docs <- tm_map(docs, tolower)
# Remove conjunctions etc. and any words we don't want on the world cloud
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove suffixes to the common 'stem'
docs <- tm_map(docs, stemDocument)
# Remove commas etc.
docs <- tm_map(docs, removePunctuation)

# remove any words we don't want in the cloud 

# now make some words to build a corpus to test for a two-step stopword removal process...
my_stopwords<- c("buy", "afford", "famili", "work")
docs <- tm_map(docs, removeWords, my_stopwords)

#(optional) arguments of 'tm' are converting the document to something other than text, to avoid, run this line
# docs <- tm_map(docs, PlainTextDocument)

# create a matrix 
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

# Time to generate a wordcloud!
set.seed(1234)
wordcloud(docs
          , scale=c(3.5,0.20)     # Set min and max scale
          , max.words=100      # Set top n words
          , random.order=FALSE # Words in decreasing freq
          , rot.per=0.35       # % of vertical words
          , use.r.layout=FALSE # Use C++ collision detection
          , colors=brewer.pal(8, "Dark2"))
