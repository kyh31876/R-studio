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




#연속형(수치형) : summary, boxplot, hist, density 
#범주형(문자형): table, barplot:그림그리기 

#이변량; 둘다 연속형 떄는 cor, plot
#둘다 범주형; chisq.test(교차검증) 
#범주형 ,연속형 t.test, 분산분석 , aov, oneway.test

 
