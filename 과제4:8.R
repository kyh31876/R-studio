#' ---
#' title: "9일 과제"
#' author: "김유현"

#' ---
install.packages("dplyr",repos = "http://cran.us.r-project.org")#,repos = "http://cran.us.r-project.org"
library(dplyr)
exam1 <- read.csv("/Users/yuhyun/Downloads/교육통계_2020.csv")



#1. 교육통계 자료의 행과 열의 갯 수는?
dim(exam1) #21277rows 90 columns

# 대구광역시에 위치한 초등학교를 filter 한 후 문제를 푸세요.
#1.대구광역시 초등학교의 총 수는?
exam2 <- exam1 %>%
  filter(exam1$시도=="대구") 
dim(exam2) #819개 


#2.초등학교의 설립(공립, 국립, 사립)에 따른 빈도는?
install.packages('ggplots2',repos = "http://cran.us.r-project.org")
library(ggplot2)
exam3 <- exam1 %>% 
  filter(exam1$학교급=="초등학교" )
exam_result <- ifelse(exam3$설립=="공립","공립",
                      ifelse(exam3$설립=="국립","국립",
                             ifelse(exam3$설립=="사립","사립","fail")))
table(exam_result)


#2.오래된 초등학교 상위 20개와 주요 변수를 선택하여 아래와 같이 출력하세요.
exam_old <- exam3 %>%
  filter(시도=="대구") %>% 
  select(시도,행정구,학교명,개교일,학급수_계,학생수_총계_계) %>% 
  arrange(개교일)
head(exam_old,20)
#3.대구광역시 초등학교의 총 학생수는?
exam_total <- exam_old %>% 
  select(학생수_총계_계)
exam_total<-as.integer(exam_total$학생수_총계_계)
str(exam_total)
sum(exam_total, na.rm=TRUE) #87604명


#. 교육통계 전체자료를 이용해서 문제를 푸세요.

#1.1900년 1월 1일 전에 설립된 학교 수는?
exam_prime<- exam1 %>%
  filter(개교일<19000101) %>% 
  select(학교명, 개교일)
dim(exam_prime) #51개

#2.고등학교 중 진학률이 90%이상 인 학교의 빈도는?
exam_high <- exam1 %>% 
  filter(진학률... >90 &학교급=="고등학교") %>% 
  select(학교급, 진학률...)

print(table(exam_high$진학률...))
#2.우리나라 중 가장 학급 수가 많은 학교는?
exam1 %>% #서울 신정초등학교
  select(학교명,학급수_계) %>% 
  arrange(desc(학급수_계)) %>% 
  head(1)
  