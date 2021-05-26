mu =30 
sigma =10 

set.seed(100)
population <- rnorm(100,mean=mu,sd=sigma) #평균과 표준편차를 만족하는 자료 100개 
hist(population)

set.seed(100)
mean(sample(population,3, raplace=T))
sim <- rep(NA,100)
for(i in 1:100){
  sim[i] <- mean(sample(population,3,replace=T))
}

hist(sim[1:10])

#모집단의 분포가 균등분포를 따르는 경우
set.seed((100))
population <- runif(100,5,10)
hist(population)

shapiro.test(population)

