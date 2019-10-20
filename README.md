# 100 days of ML code
This project documents my progress through the 100 days of Machine Learning Challenge.

## Day 1 (July 14, 2018)
I started Jason Brownlee's book "Master Machine Learning Algorithms - Discover how they work and Implement Them from Scratch" and studied 5 chapters. 
1. Introduction to the book
2. Terminology used to talk about data
3. Algorthims learn to map input to output
4. Difference between parametric and non-parametric algorithms. Examples of parametric algorithms include Logistic regression, Linear Discriminant Analysis, Perceptron. Examples of Non-parametric algorithms include Decision Trees, Naive Bayes, Support Vector Machines, Neural Networks.
5. Difference between Supervised, Unsupervised and Semi-Supervised algorithms.

## Day 2
Today I read chapters 6-9.

6. The Bias-Variance Trade-Off 
7. How Bias-Variance trade-off relates to Overfitting and Underfitting. 
8. Crash-Course in Spreadsheet match (skimmed over this chapter)
9. Gradient Descent for machine learning. Gradient Descent is an optimization algorithm used to find the values for parameters (coefficients) of a function that minimize the cost function. Variants include Batch gradient descent and Stochastic Gradient Descent. 

## Day 3
Today I read chapters 10-12.

10. Understanding Linear Regression. 
11. Linear regression Tutorial (implemention in code/day3.R). I also included an example of linear regression model from stats package.
12. Linear Regression with Tutorial using Gradient Descent (I did not implement this)

## Day 4
Today I read chapters 13-14 on Logistic regression. 

## Day 5
Today I read chapters 15-16 on Linear Discriminant Analysis. (implementation in code/day5.R) I usually work with data frames so struggled a bit with tibbles. (NOTE to self: practice using tibbles over data frames)

## Day 6
Today I read chapters 17-19 on nonLinear algorithms including CART (Classification and Regression Trees) and Naive Bayes algorithm. 

## Day 7 (July 20th, 2018)
Today I read chapters 20-26. (these are all classification based models)

20. Naive Bayes Tutorial 
21. Gaussian Naive Bayes Tutorial
22. k-Nearest Neighbours
23. k-Nearest Neighbours tutorial
24. Learning Vector Quantization
25. Learning Vector Quantization tutorial
26. Support Vector Machines. Including various kernels and optimzation procedures.

## Day 8 (July 22, 2018)
Today I finished reading Jason Brownlee's book "Master Machine Learning Algorithms - Discover how they work and Implement Them from Scratch". I covered chapters 27-33.

27. SVM tutorial
28. Bagging and Random Forest
29. Bagged Decision trees tutorial
30. Boosting and Adaboost
31. Adaboost tutorial

Now that I finished the book for which I really took on this challenge, I have a few ideas on how to proceed. I can explore the various Natural Language Processing techniques, starting with basics (bag of words) and going beyond what I already know (exploring techniques like word embeddings). Another option is to explore data visualization. This is one of my weak spots right now that I've been wanting to work on for a while. Visualize data in order to chose the best machine learning algorithm, and also display findings in a way that people can understand. A third option is to learn how to present Machine learning to non-technical (business) people. What I've come to realize in the last year is that it is not enough that you know what you're doing, you need to be able to communicate your thoughts effectively, in simple language, to others in the company and to outside clients. 

## Day 9 

Today I practiced using word embeddings in R, by following the tutorial for pacakge "wordVectors" and some related exercises.

1. https://github.com/bmschmidt/wordVectors/blob/master/vignettes/introduction.Rmd
2. https://www.r-exercises.com/2017/11/05/word-embedding-exercises/

## Day 10

Today I trained my own word embeddings on Resumes. I recently had to work on a skills identification task, where it was quite a challenge to group skills together in certain categories. It seems word embeddings might be able to solve the problem. 

## Day 11

Today I am experimented with training word embeddings from various different sources. I trained a model on resumes collected for NAICS, another model on job posts collected for NAICS, and a 3rd model on both job posts and resumes (model is currently training). 

## Day 12 (July 26, 2018)

About day 11, finished training my 3 word embedding models. They worked great. solved the problem of grouping similar skills together.

Today I am watching "Data Science A-Z: Real Life Data science" udemy course. Listening to the "communication chapter which talks about "working with people" and "presenting for data scientists". Not exactly Machine learning, but definitely a big part of being a data scientist

## Day 13 (July 30, 2018)

Today I learned about time-series in R by following the 3 part series on "Time Series Analysis in R". available at: 

Part1: https://datascienceplus.com/time-series-analysis-in-r-part-1-the-time-series-object/

Part2: https://datascienceplus.com/time-series-analysis-in-r-part-2-time-series-transformations/

Part3: https://datascienceplus.com/time-series-analysis-in-r-part-3-getting-data-from-quandl/


## Day 14 (Aug 1, 2018) 

I'm changing this challenge to a #100DaysOfDataScienceLearning Challenge. My current need is to learn about data analysis and data visualization in order to effectively present findings obtained from Machine Learning algorithms. Learning new and better machine learning techniques is definitely useful but not unless I can simultaneously learn to communicate them to business team and clients.

For this purpose, I started reading "Storytelling with data - a data visualization guide for business professionals" by Cole Nussbaumer knaflic. Today I covered introduction and chapter 1 (the importance of context) of the book.

## Day 15

"Chapter 2 - choosing an effective visual" covered simple text, tables, heatmaps, scatter plot, line graph, slopegraphs, vertical bar chart, horizontal bar chart, stacked vertical bar chart, stacked horizontal bar charts, waterfall chart, square area chart. The author also talked about avoiding pie charts, donut chart, 3D charts and secondary y-axis on charts.

## Day 16 (Aug 7th, 2018)

"Chapter 3 - clutter is your enemy!" talked about cognitive load and clutter, gestalt principles of visual perception (proximity, similarity, enclosure, closure, continuity, connection), lack of visual order (alignment, white space) and non-strategic use of contrast. 

## Day 17

"Chapter 4 - focus your audience's attention" talked about memory, preattentive attributes signal where to look, preattentive attributes in text, preattentive attributes in graphs and position on page.

## Day 18

"Chapter 5 - think like a designer" talks about affordances (highlight important stuff, eliminate distractions, create clear visual hierarchy of information), Accessibility (Don't overcomplicate, text is your friend), Aesthetics and Acceptance.

## Day 19 (Aug 12, 2018)

I started working on a project to figure out whether America's got Talent winner can be predicted from social media posts. What factors (number of posts, number of users engaged, positive tweets/users counts etc.) correlate with predicting the winner. I will continue working on this as the live show start.

## Day 20

"Chapter 6 - dissecting model visuals" gave a walkthrough of several graphs discussing in detail the elements of these graphs that makess them a good plot.

## Day 21-22

"Chapter 7 - lessonss in storytelling" talks about the magic of story, constructing the story, the power of repetition and tactics to help enssure your story is clear.

## Day 23

Recorded results for AGT qurter final 1. Compare existing topic model to confirm people are infact using those terms. Results did not match this time. It was expected as the sample was not updated the day of the results. I think this will be a continuous challenge. Even if I manage to find some corelation, I don't think it will be able to make a prediction before the results are announced. Will consider speeding up the sample closer to the finals.
