ex1 <- read.csv("C:/Users/OWNER/Downloads/IMDB-Movie-Data.csv") #data 불러오기 



#1.각 변수가 수치형(연속형) 자료인지 아니면 문자형(이산형) 자료인지 확인 후 주석으로 표기하세요
# Title : 영화 제목
# Genre : 영화 장르
#Description : 영화 설명
#Director : 감독명
#Actors : 배우
#Year : 영화 상영 년도
#Runtime..Minutes. : 상영시간
#Rating : Rating 평점
#Votes : 관객 수
#Revenue..Millions. : 수익
#Metascore : 메타 스코어

#2.가장 많은 Genre는 무엇인지 출력하세요.
install.packages("dplry",repos = "http://cran.us.r-project.org")
library(dplyr)

ex1 %>% 
  group_by(Genre) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(1)#action,adventure,SF



#3.IMDB에 언급된 감독의 수를 출력하세요.
length(unique(ex1$Director)) #644

#4.영화상영년도의 빈도를 막대도표로 그리세요.
install.packages("ggplot2",repos = "http://cran.us.r-project.org")
library(ggplot2)

ggplot(data=ex1, aes(x= Year)) +
  geom_bar()
#5. 상영시간의 히스토그램과 상자그림를 그리세요.
ex1 <-ex1 %>% 
  rename(Runtime=Runtime..Minutes.)

ggplot(data=ex1, aes(x=Runtime)) + 
  geom_histogram() + 
  geom_boxplot()


#6.상영시간의 이상치의 갯 수를 구하여라.
outlier <- boxplot(ex1$Runtime)
summary(ex1$Runtime %in% outlier$out) #30개


#7. 수익(Revenue..Millions.) 중 결측치의 갯 수를 출력하세요.
sum(is.na(ex1$Revenue..Millions.)) #128개

#8.년도에 따른 수익을 상자도표로 그리세요.
ex1 <- ex1 %>% 
  filter(!is.na(Revenue..Millions.)) #결측치 제거 

ggplot(data=ex1, aes(x=factor(Year),y=Revenue..Millions.)) +
         geom_boxplot()
