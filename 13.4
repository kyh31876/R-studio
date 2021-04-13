#filter()
#select()
#arrange()
#mutate()
exam1 <- read.csv("/Users/yuhyun/Downloads/csv_exam.csv")
install.packages("dplyr")
library(dplyr)

#summarise 
 
#group_by() 집단별로 요약값 만들기 
exam1 %>% 
  group_by(class) %>% 
  summarise(avg_math = mean(math))

exam1 %>% 
  summarise(avg_math = mean(math))

class1 <- exam1 %>% 
  filter(class==1) %>% 
  mean(class$math==1)

exam1$gender <- c(rep("M",10),rep("F",10))
head(exam1)

exam1 %>% 
  group_by(gender) %>% 
  summarise(sample=n(), avg=mean(english), sd=sd(english))
#equal
male <- exam1 %>%
  filter(gender=="M")
female <- exam1 %>% 
  filter(gender=="F")
c(nrow(male),mean(male$english),sd(male$english))


#대표값 : 평균 ,최빈값 ,중앙값
#산포도 : 범위, 분산, 표준편차, 변동계수

exam1 %>% summarise(mean_math=mean(math), mean_english=mean(english),
                                                       mean_science=mean(science))


exam1 %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math))



exam1 %>% 
  group_by(gender) %>% #gender 별로 분리
  summarise(mean_math=mean(math),
            sum_math=sum(math),
            median_math=median(math),
            n=n()) #학생수
# 평균: mean() 표준편차: sd() 합계: sum() 
#중앙값: median() 최소값: min() 최대값:max() 빈도 : n()

#회사별로 "suv" 자동차의 도시 및 고속도로 통합 
#연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기

mpg <- data.frame(ggplot2::mpg)
head(mpg)

mpg %>% 
  group_by(manufacturer) %>%  #회사별로 분리 
  filter(class=="suv") %>%  #suv 추출 
  mutate(total=mean(cty+hwy)) %>% #연비 변수 생성
  summarise(mean_total=mean(total)) %>%  # 통합연비 평균 산출, gorup_by 와 summarise변수뺴고 사라짐
  arrange(desc(mean_total)) %>% # 내림차순 정렬 
  head(5)



#데이터 합치기 
data1 <- data.frame(id=c(1,2,3),
                   midterm=c(60,70,80))

data2 <- data.frame(id=c(1,2,4),final= c(70,83,65))

#cbind ,열 합치기 
t.data <- cbind(data1,data2) #column 똑같아야됨
#merge
m.data1 <- merge(data1 , data2 , by="id") #교집합 
m.data2 <- merge(data1 , data2 , by="id", all=TRUE) # 합집합
m.data3 <- merge(data1 , data2 , by="id", all.x=TRUE) #차집합
m.data4 <- merge(data1 , data2 , by="id", all.y=TRUE) #마지막 사람만 남김 


data3 <- data.frame(id=c(1,2,3),
                    test=c(60,80,70))
data4 <- data.frame(id=c(4,5,6),
                    test=c(70,83,65))
#rbind
rbind(data3,data4)


#dplyr 이용해 합치기 

test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))
# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))
test3 <- data.frame(id=c(1,3,5,4,5),
                    temp=c(50,60,70,80,90))                    
test1
test2
test3

cbind(test1, test2, test3)  #자료개수만큼 끼워넣어짐 

# 둘다 똑같음 
total <- left_join(test1 ,test2, test3,by="id") # 2개만 입력
total <- merge(test1, test2, by="id") # 2개만 입력 

name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
exam <- read.csv("/Users/yuhyun/Downloads/csv_exam.csv")
exam_new <- left_join(exam,name, by="class")

#세로로 만들기 
