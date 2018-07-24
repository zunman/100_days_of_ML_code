library("devtools")
devtools::install_github("bmschmidt/wordVectors")


####wordVectors tutorial####
library(wordVectors)
library(magrittr)

if (!file.exists("cookbooks.zip")) {
  download.file("http://archive.lib.msu.edu/dinfo/feedingamerica/cookbook_text.zip","cookbooks.zip")
}
unzip("cookbooks.zip",exdir="cookbooks")
if (!file.exists("cookbooks.txt")) prep_word2vec(origin="cookbooks",destination="cookbooks.txt",lowercase=T,bundle_ngrams=2)
if (!file.exists("cookbook_vectors.bin")) {model = train_word2vec("cookbooks.txt","cookbook_vectors.bin",vectors=200,threads=4,window=12,iter=5,negative_samples=0)} else model = read.vectors("cookbook_vectors.bin")

##similarity##
model %>% closest_to("fish")
model %>% 
  closest_to(model[[c("fish","salmon","trout","shad","flounder","carp","roe","eels")]],50)

some_fish = closest_to(model,model[[c("fish","salmon","trout","shad","flounder","carp","roe","eels")]],150)
fishy = model[[some_fish$word,average=F]]
plot(fishy,method="pca")

##clustering##
set.seed(10)
centers = 150
clustering = kmeans(model,centers=centers,iter.max = 40)

sapply(sample(1:centers,10),function(n) {
  names(clustering$cluster[clustering$cluster==n][1:10])
})

ingredients = c("madeira","beef","saucepan","carrots")
term_set = lapply(ingredients, 
                  function(ingredient) {
                    nearest_words = model %>% closest_to(model[[ingredient]],20)
                    nearest_words$word
                  }) %>% unlist

subset = model[[term_set,average=F]]

subset %>%
  cosineDist(subset) %>% 
  as.dist %>%
  hclust %>%
  plot


##Visualizations##
tastes = model[[c("sweet","salty"),average=F]]

# model[1:3000,] here restricts to the 3000 most common words in the set.
sweet_and_saltiness = model[1:3000,] %>% cosineSimilarity(tastes)

# Filter to the top 20 sweet or salty.
sweet_and_saltiness = sweet_and_saltiness[
  rank(-sweet_and_saltiness[,1])<20 |
    rank(-sweet_and_saltiness[,2])<20,
  ]

plot(sweet_and_saltiness,type='n')
text(sweet_and_saltiness,labels=rownames(sweet_and_saltiness))

tastes = model[[c("sweet","salty","savory","bitter","sour"),average=F]]

# model[1:3000,] here restricts to the 3000 most common words in the set.
common_similarities_tastes = model[1:3000,] %>% cosineSimilarity(tastes)

common_similarities_tastes[20:30,]

high_similarities_to_tastes = common_similarities_tastes[rank(-apply(common_similarities_tastes,1,max)) < 75,]

high_similarities_to_tastes %>% 
  prcomp %>% 
  biplot(main="Fifty words in a\nprojection of flavor space")

##catchall reduction: TSNE##
# install.packages("tsne")
library(tsne)
plot(model,perplexity=50)


####Exercises####

##Exercise 1## Install wordVectors package.
devtools::install_github("bmschmidt/wordVectors")

##Exercise 2## Explore demo dataset demo_vectors. Print whole vectors for word ‘good’.
demo_vectors
demo_vectors[['good']]@.Data

##Exercise 3## Find closest words to word ‘good’.
demo_vectors %>% closest_to("good")

##Exercise 4## Find words that are in similar relation with ‘she’ as ‘man’ with ‘he’.
demo_vectors %>% closest_to(~"man" - "he" + "she")

##Exercise 5## Find top 50 words closest to ‘bad’ and plot them with PCA method.
top_50 <- demo_vectors %>% closest_to(~"bad",n=50)
plot(demo_vectors[[top_50$word, average = F]], method='pca')

##Exercise 6## Download collection of cookbooks for model training. Prepare a textfile suitable for the model (txt with tokens separated by spaces).
if (!file.exists("cookbooks.zip")) {
  download.file("http://archive.lib.msu.edu/dinfo/feedingamerica/cookbook_text.zip","cookbooks.zip")
}

##Exercise 7## Train word2vec model with 200 dimensions, 12 words window and 5 iterations.
unzip("cookbooks.zip",exdir="cookbooks")
if (!file.exists("cookbooks.txt")) prep_word2vec(origin="cookbooks",destination="cookbooks.txt",lowercase=T,bundle_ngrams=2)
if (!file.exists("cookbook_vectors.bin")) {model = train_word2vec("cookbooks.txt","cookbook_vectors.bin",vectors=200,threads=4,window=12,iter=5,negative_samples=0)} else model = read.vectors("cookbook_vectors.bin")


##EXERCISE 8## Find out what beef dish is most similar mutton chops 
model %>% closest_to(~"chops" - "mutton" + "beef")

##EXERCISE 9## Cluster the embeddings using kmeans and print first 20 words from the cluster containing word ‘cake’.
set.seed(125)
centers <- 100
clustering = kmeans(model,centers=centers,iter.max = 40)
names(clustering$cluster[
  clustering$cluster==
    which(sapply(1:centers,function(n) {
      'cake' %in% names(clustering$cluster[clustering$cluster==n])
    }))
  ])[1:20]


##EXERCISE 10## Find top 10 most similar words for ‘sweet’ and ‘sour’. Plot them with similarity to ‘sweet’ on X axis and similarity to ‘sour’ on Y axis.
tastes <- model[[c("sweet","sour"),average=F]]

sweet_sour <- model %>%
  cosineSimilarity(tastes) %>%
  .[!row.names(.) %in% c("sweet","sour"),] %>%
  .[rank(-.[,1])<=10 | rank(-.[,2])<=10,]

plot(sweet_sour,type='n')
text(sweet_sour,labels=rownames(sweet_sour))

