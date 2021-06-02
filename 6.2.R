#데이터 탐색하기
#데이터 내용, 구조, 타입을 파악한다.
#str, summary, head, tail, dim 등을 사용하여 자료 확인

library(dplyr)
mpg <- ggplot2::mpg

head(mpg)
srt(mpg)


#연속형 변수의 분석 
library(ggplot2)
ggplot(data=mpg, aes(x=hwy))+geom_histogram()

ggplot(data=mpg, aes(x=hwy))+geom_boxplot()

ggplot(data=mpg, aes(x=hwy))+geom_density()

c(mean(mpg$hwy), median(mean(mpg$hwy)), var(mpg$hwy), sd(mpg$hwy), mad(mpg$hwy), quantile(mpg$hwy))

#데이터 정규성 검사: qqplot, qqline 함수는 분포가 정규분포와 얼마나 유사한지 검사하는데 사용된다.
qqnorm(mpg$hwy)
qqline(mpg$hwy)


#이상점 찾아보기: boxplot() 사용
boxplot(mpg$hwy)$out



mu =30 
sigma =10 


#평균이 30이고 표준편차가 10인 난수를 100개 생성하였으므로 위 자료는 정규분포를 따릅니다.
#이제 임의로 3개의 표본을 추출하여 표본 평균을 구해보겠습니다.
#그리고 그 횟수를 10, 30, 50, 100번 반복했을 때의 표본평균의 분포를 그려보겠습니다.


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

set.seed(100)
mean(sample(population,3, replace=T)) 
sim <- rep(NA, 30)
for(i in 1:30){
  sim[i] <- mean(sample(population,3, replace=T))
}
hist(sim)


for(i in 1:30){
  sim[i] <- mean(sample(population,10, replace=T))
}
hist(sim)


for(i in 1:30){
  sim[i] <- mean(sample(population,15, replace=T))
}
hist(sim)
shapiro.test(sim)


#연속형(수치형) : summary, boxplot, hist, density 
#범주형(문자형): table, barplot:그림그리기 

#이변량; 둘다 연속형 떄는 cor, plot
#둘다 범주형; chisq.test(교차검증) 
#범주형 ,연속형 t.test, 분산분석 , aov, oneway.test


#통계적 가설검정 
#귀무가설 대립가설 세우기 
#유의수준 설정 
#검정통계량 계산 
# 기각역 설정 
# 가설 검정 
install.packages("ggplot2")
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

mu0 <- 22.9 
t.test(mpg$hwy, mu=mu0, alternative='greater') #greater 단측 both = 양측검정 

t.test(mpg$hwy) #default mu=0이라 가정하고 계산 

#독립 t검정 
#귀무가설 : 전륜차량의 시내연비와 후륜차랑의 시내연비가 같다
install.packages("dplyr")
library(dplyr)
#대립가설 H_0 
d1 <- mpg %>% filter(drv %in% c("f","r"))

if(!require(car)) install.packages("car"); library(car)
leveneTest(cty~drv, data=d1)

t.test(cty~drv,data=df,var.equal=TRUE) # 전륜구동이 시내구동보다 효울이 좋다 

#범주형 자료 

set.seed(1606)
n <-100
p <-0.7
x<-rbinom(n,1,p) #성공률이 70%인 이항분표로 임의의 자료생성 
x <-factor(x, levels=c(0,1),labels=c("yes","no")) # yes와 no로 입력된 factor material 생성 

table(x)
install.packages('ggplot')
#barpot()이유용 
barplot(table(x))
ggplot(data=data.frame(x=x), aes(x=x))+geom_bar()
#지지율이 70%이다 라는 귀무가설 
binom.test(table(x=='yes'),p=.7) # 귀무가설을 채택 

#전륜차량의 비율이 전체차량의 50%라고 할수있을까? 
binom.test(table(mpg$drv =='f'),p=.5) #귀무가설 채택 

#표본수 n의 크기에 따른 그림
curve(1.96*sqrt(1/(4*x)),10,1000)


#독립변수와 종속변수 

mpg %>% 
  ggplot(ase(cty,hwy)+geom_jitter()+geom_smooth(methpd="lm"))

cor(mpg$cty,mpg$hwy)

cor.test(mpg$cty, mpg$hwy) # abs(r) <= 0.2 :매우 낮은 상관성 0.2 < abs(r) <= 0.4 :낮은 상관성 
# 0.4<abs(r) <=0.6: 중간 상관성  0.6 < abs(r) <= 0.8 :높은상관성이 있다  



#분산 분석 
#2개 평균; t.test, 
#2개이상; 일우너배치 분산법 
boxplot(cty~drv, data=mpg) #상자 그림을 통해 지역별 차이를 시각적확인 

library(dplyr)
mpg %>% group_by(drv) %>% 
  summarise(n=n(), mean=mean(cty), sd=sd(cty))

# 정규성  shapiro.test
# 독립성 
# 등분산성 levene.test

