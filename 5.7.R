x <- c(1,2,3,NA)
x

df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score=c(5,4,3,2,NA)) # not available
df

is.na(df$sex) #testing NA
which(is.na(df))

table(is.na(df)) #빈도분석

summary(df)

install.packages("dplyr")
library(dplyr)

df %>% filter(!is.na(sex) & !is.na(score)) #sex의 결측치가 아닌것만  출력 

df[!is.na(df$sex) & !is.na(df$score),] #항상 전체를 다적어야함 

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)

?mean

mean(df$score, na.rm=T) #na를 제외한 평균값 

df[complete.cases(df),] #na 가 없는 데이터만 

df2 <- na.omit(df)


exam <- read.csv("/Users/yuhyun/Downloads/csv_exam.csv")
names(exam)
exam[c(3,8,15),"math"] <- NA #math 의 3,8,15번쨰 행에 NA를 집어넣는다.


exam %>% group_by(class) %>% 
  summarise(mean_math=mean(math,na.rm=T))



#결측치 대체하기 
mean(exam$math, na.rm=T)
exam[c(3,8,15), "math"] <- c(46.7,51.7,50.7)
`exam[c(3,8,15),"math"] <- 55.23529

#평균으로 대체하기 
exam$math <- ifelse(is.na(exam$math),
                    55,  #참
                    exam$math) #거짓 



#이상치 제거하기
outlier <- data.frame(sex= c(1,2,1,3,2,1),
                      score= c(5,4,3,4,2,6))
#sex : 1-2
#score : 1-5

table(outlier$score)

outlier$sex <- ifelse(outlier$sex %in% c(1,2),
                      outlier$sex,
                      NA)

outlier$score <- ifelse(outlier$score %in% 1:5,
                      outlier$score,
                      NA)

mean(outlier$score, na.rm=T)


#boxplot 으로 극단치 기준 정해서 제거하기 
install.packages("ggplot2")

library(ggplot2)
mpg <- data.frame(ggplot2::mpg)

boxplot(mpg$hwy)
summary(mpg$hwy)

box1 <-boxplot(mpg$hwy)
box1


box1$out  #이상치 

mpg[which(mpg$hwy %in% box1$out),]



#결측 처리하기 
mpg$hwy <- ifelse(mpg$hwy %in% box1$out,NA,mpg$hwy)

mpg %>% group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
