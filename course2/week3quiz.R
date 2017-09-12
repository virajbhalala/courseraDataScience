#1
library(datasets)
data(iris)
print(iris)

#iris$Species returns all rows in col Speicies
#iris[iris$Species == "virginica",] returns table that has all rows where speicies col is virinica
#iris[iris$Species == "virginica",'Sepal.Length'] will return only sepal.Length col 
#iris[iris$Species == "virginica",1] will also return only sepal.Length col 
#iris[iris$Species == "virginica",]$Sepal.length will also return only sepal.Length col 


print(mean(iris[iris$Species == "virginica",'Sepal.Length']))

#2  this will return mean of first 4 cols
print(colMeans(iris[,1:4]))
print(apply(iris[, 1:4], 2, mean))

#3 How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.

library(datasets)
data(mtcars)
?mtcars
print(mtcars)
print(sapply(split(mtcars$mpg, mtcars$cyl), mean))
print(with(mtcars, tapply(mpg, cyl, mean)))
print(tapply(mtcars$mpg, mtcars$cyl, mean))

#4 Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
a<-sapply(split(mtcars$mpg, mtcars$cyl), mean)


