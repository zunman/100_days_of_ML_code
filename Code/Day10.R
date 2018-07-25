library(dplyr)

load("Data/Day10_Jobs_data/resumes.cybersecurity.RData")
load("Data/Day10_Jobs_data/resumes.fintech.RData")
load("Data/Day10_Jobs_data/downloaded.resumes.fintech.RData")
load("Data/Day10_Jobs_data/downloaded.resumes.cybersecurity.RData")
load("Data/Day10_Jobs_data/downloaded.job.postings.fintech.RData")
load("Data/Day10_Jobs_data/downloaded.job.postings.cybersecurity.RData")

##select columns of interest and convert to txt file##
dataset.jobs <- rbind(downloaded.job.postings.cybersecurity,downloaded.job.postings.fintech)
dataset.resumes <- rbind(resumes.cybersecurity, resumes.fintech)

dataset <- dataset.resumes  %>% select(-index, -type,-id) 
dataset %>%  write_to_folder(folderName = "Data/Day10_Jobs_data/Resumes")
# dataset.jobs %>% select(summary) %>% write_to_folder(folderName = "Data/Day10_Jobs_data/Jobs")

write_to_folder <- function(dataset, folderName){
  if (!dir.exists(folderName)) {
    dir.create(folderName)
  }

  for(i in 1:nrow(dataset)){
    obj <- unlist(dataset[i,])
    cat(obj, file=paste0(folderName,"/file_",i,".txt"))
  }
  
}

library(wordVectors)
if (!file.exists("resumes.txt")) prep_word2vec(origin="Data/Day10_Jobs_data/Resumes",destination="resumes.txt",lowercase=T,bundle_ngrams=2)
if (!file.exists("resumes_vectors.bin")) {model = train_word2vec("resumes.txt","resumes_vectors.bin",vectors=200,threads=4,window=12,iter=5,negative_samples=0)} else model = read.vectors("resumes_vectors.bin")

model %>% closest_to("security")

model %>% 
  closest_to(model[[c("security","cyber","threat")]],50)


##clustering##
set.seed(10)
centers = 150
clustering = kmeans(model,centers=centers,iter.max = 40)

sapply(sample(1:centers,10),function(n) {
  names(clustering$cluster[clustering$cluster==n][1:10])
})




