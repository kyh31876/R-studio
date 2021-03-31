head() #데이터 앞부분 출력
tail() #데이터 뒷부분 출력
View() #뷰어 창에서 데이터 확인
dim() #데이터 차원 출력
str() #데이터 속성 출력
summary() #요약통계량 출력

exam <- read.csv("/Users/yuhyun/Downloads/csv_exam.csv")


head(exam)
head(exam,n) # n개만큼 출력 

tail(exam) #끝에 있는 파일 

View(exam) # excel 과 비슷한 파일 생성 

dim(exam) #차원 확인 
dim(exam) == c(nrow(exam), ncol(exam))

str(exam) # structure 확인 
summary(exam) #요약값


install.packages("ggplot2")
library(ggplots2)
ggplot2::mpg # ggplot2 안의 mpg 함수를 이용
class(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg) #

class(mpg)

install.packages("dplyr")
library(dplyr)

df_raw<- data.frame(var1 =c(1,2,1), var2 = c(2,3,2)) #데이터 프레임 생성 
df_raw

df_new <- df_raw # 데이터 프레임 복사본 만들기 

df_new %>% #ctrl +shirt+m
  rename (name=var1, score =var2) -> df_new # rename은 기존의 변수명을 바꿀수 있다 저장을 시켜야지 name과 score 가 바뀜

mpg %>% 
  rename(city=cty, highway=hwy) -> mpg2 
mpg$city <- mpg$cty
mpg$city <- NULL #변수의 이름바꾸기, 
head(mpg)


#Q1. ggplot2 패키지의 mpg 데이터를 사용할 수 있도록 불러온 뒤 복사본을 만드세요
mpg <- as.data.frame(ggplot2::mpg) # data frame형식으로 바꾸기
mpg2 <- mpg
#Q2. 복사본 데이터를 이용해서 cty는 city로, hwy는 highway로 변수명을 수정하세요
mpg2 %>% 
  rename (city=cty , highway=hwy) -> mpg3

#Q3. 데이터 일부를 출력해서 변수명이 바뀌었는지 확인해 보세요. 아래와 같은 결과물이 출력되어야 합니다.
  
head(mpg3)


df <- data.frame(var1 = c(4,3,8), var2= c(2,6,1))
df$var_sum <- df$var1 + df$var2 #파생 변수만들기
df


ifelse(mpg$total >= 20, "pass","fail") #조건을 실행시킬떄 true 값을 앞에 F 를 뒤에둠
data <- data.frame(cty, result)

table(mpg$test) # 빈도분석
barplot(table(result)) #막대도표 생성 

result <- ifelse(mpg$cty>= 30, "A", ifelse(mpg$cty>=20,"B","C"))
data2 <- data.frame(cty, reslut)

mpg$grade2 <- ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 25, "B", ifelse(mpg$total >= 20, "C", "D")))
# A, B, C, D 등급 부여 

