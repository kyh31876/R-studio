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



install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
#mpg 데이터를 이용해 분석문제 해결 

#Q1자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. 
#displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요. 
mpg <- as.data.frame(ggplot2::mpg)
mpg_a <- mpg %>%
  filter(displ <= 4 ) #displ 4이하 추출 
mpg_b <- mpg %>%
  filter(displ >= 5)

mean(mpg_a$hwy)
mean(mpg_b$hwy)


#Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi"와 "toyota" 중 어느 manufacturer(자동차 제조 회사)의
#cty(도시 연비)가 평균적으로 더 높은지 알아보세요. •
mpg_audi<- mpg %>%
  filter(manufacture== "audi")

mpg_toyota<- mpg %>%
  filter(manufacture== "toyota")
mean(mpg_audi$audi)
mean(mpg_toyota$toyota)

#Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.
mpg_n <- mpg %>%
  filter(manufacturer %in% c("chevrolet","ford", "honda"))
mean(mpg_n$hwy)

#Q1. mpg 데이터는 11개 변수로 구성되어 있습니다. 이 중 일부만 추출해서 분석에 활용하려고 합니다. 
#mpg 데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만드세요.
#새로 만든 데이터의 일부를 출력해서 두 변수로만 구성되어 있는지 확인하세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg_1 <- mpg %>%
  select(class, cty)
head(mpg_1)


#Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다. 앞에서 추출한 데이터를 이용해서 class(자동차 종류)가
#"suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty(도시 연비)가 더 높은지 알아보세요.
mpg_2 <- mpg_1 %>% 
  filter(class =="suv")

mpg_3 <- mpg_1 %>%
  filter(class == "compact")

mean(mpg_2$cty)

mean(mpg_3$cty)

#mpg 데이터를 이용해서 분석 문제를 해결해보세요. 
#"audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 합니다.
#"audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력하세요.

mpg_w <- mpg %>%
  filter(manufacturer =="audi") %>%
  arrange(desc(hwy))
head(mpg_w,5)


#mpg 데이터는 연비를 나타내는 변수가 hwy(고속도로 연비), cty(도시 연비) 두 종류로 분리되어 있습니다. 
#두 변수를 각각 활용하는 대신 하나의 통합 연비 변수를 만들어 분석하려고 합니다. 
mpg <- as.data.frame(ggplot2::mpg)
#Q1. mpg 데이터 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를 추가하세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg_co <- mpg
mpg_co <- mpg_co %>%
  mutate(total =hwy+cty)
#Q2. 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가세요.
mpg_co <- mpg_co %>% 
  mutate(mean=total/2)
#Q3. '평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력하세요. 
mpg_co %>%
  arrange(desc(mean)) %>% 
head(3)
#Q4. 1~3번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어 출력하세요. 데이터는 복사본 대신 mpg 원본을 이용하세요.
mpg_co %>%
  mutate(total=cty+hwy, mean=total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)
