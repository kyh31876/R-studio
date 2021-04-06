install.packages("dplyr")
library(dplyr)

exam <- read.csv("/Users/yuhyun/Downloads/csv_exam.csv")
head(exam)
tail(exam)
dim(exam)
str()
View()
summary()


#select 
head(exam,10)
class1 <- exam %>% filter(class == 1) # row를 선택 
class1  
#filter "dplry" package 실행
class2 <-exam %>%  filter(class == 1)
exam %>% filter(math >=50 & english >=80)#수학 50 점이상 영어 80 이상 
eng_eng <- exma %>% filter(english < 90 | class!= 3)#영어점수가 90 보다작고 3반이 아님 

class2 <- exam %>%filter(class==2)
exam[ exam$class ==2,]

noclass1 <- exam %>% filter(class!=1)#1반이 아닌경우
noclass1 <- exam[exam$class !=1,]

city <- c("paris","london","tokyo","sheffield")
data <- c("sendai","kyoto","nagoya","kobe")

data %in% city
data[data %in% city]

x <- sample(1:100,50)
y <- seq(2,50,2)
x[x %in% y] #x 중 y에있는값만 선택 

exam %>% filter (class==1 | class==3 | class==5)
exam %>% filter(class %in% c(1,3,5)) #조건은 c vector 로 묶어 더간단함


# select 
exam %>% filter(class, english)
exam %>% select(-id) #id만 제외

exam %>% select(math) #math값만 출력 dataframe 형태 

math1 <- exam[,"math"] # vector 로 저장 
math1 <- exam[,c("math","english")] #2개이상 되야 dataframe 형태로 

# filter & select 
exam %>% filter(class==3 & math >50) %>% select(class, math) #3반이면서 수학점수
#50 이상인 학생들의 class, math 값만 출력 

# Base 
exam[exam$class == 3 & exam$math >= 50, c("class", "math")  ]


exam %>% # 일부만 출력하기
  select(class, math) %>%
  head(10)



#순서대로 정렬하기 

x <- sample(1:100,30)
sort(x)
x[order(x)]

# %>% 는 dpyrl package 안의 함수만 가능 
exam %>%  arrange(math) #기본값은 낮은것부터 
exam %>%  arrange(decs(math)) #점수가 높은순으로 정렬

exam %>% 
  arrange(math) %>% 
  select(id, english)

#파생변수 추가 
exam$sum <- exam$math + exam$english + exam$science 
head(exam)
exam$mean <- eam$sum/3 
head(exam)

exam1 <- exam %>% 
  mutate(total = math + english +science)

#파생변수 한번에 추가하기 
exam1 <- exam %>% 
  mutate(total = math + english +science,
         mean=total/3)

exam2 <- exam1 %>%
  mutate(test= ifelse(mean>=60 ,"pass" ,"fail")) #mean이 60점이상 이면 
#pass 아니면 fail

exam2 


#filter 원하는 행만선택
# select 원하는 열만선택 
#arrange 
#mutate 파생변수 

