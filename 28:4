install.packages("readxl")
library(readxl)
install.packages("dplyr")
library(dplyr)

#4번 
exam_4 <- read_excel("C:/Users/OWNER/Downloads/smoke.xlsx")

#a)

table(exam_4$Gender)

#b)
exam_4$BMI=(exam_4$Weight/((exam_4$Height)^2))
mean(exam_4$BMI)
sd(exam_4$BMI)
#c)
exam_4 %>% 
  filter(Age >30,Gender=="F") %>% 
  group_by(Gender) %>% 
  summarise(median = median(Height)) 

#d)
exam_4 %>% 
  filter(HowLong >10 | Cigarettes >10) %>% 
  select(Gender) -> exam_4_1

table(exam_4_1)



#5번 
exam_5 <- read.csv("C:/Users/OWNER/Downloads/서울교통공사_관할역별_일별_시간대별_이용인원_20181231.csv")
#a)
exam_51<-exam_5 %>% 
  select(X08...09) %>% 
  mutate(sum1=sum(X08...09))

exam_52<-exam_5 %>% 
  select(X18...19) %>% 
  mutate(sum2=sum(X18...19))
which(exam_51$sum1 >exam_52$sum2) #오후 6시 부터 9시이용객이 더크다 



#b)
exam_5 %>% 
  filter(구분.1=="승차") -> exam_5up


exam_5 %>% 
  filter(구분.1=="하차") -> exam_5down

sum(exam_5up$합.계) #승차인원
sum(exam_5down$합.계)#하차인원


#c)
exam_5 %>% 
  select(역명,X08...09) %>%
  arrange(desc(X08...09)) %>% 
  head(3)#가장 붐비는 


exam_5 %>% 
  select(역명,X08...09) %>%
  arrange(desc(X08...09)) %>% 
  tail(3)#가장 한적한 

#d)
exam_5 %>%
  filter(역명=="고속터미널역",구분=="평일") %>% 
  select(역명,구분,합.계) %>%
  summarise(mean=mean(합.계))


exam_5 %>%
  filter(역명=="고속터미널역",구분=="휴일") %>% 
  select(역명,구분,합.계) %>%
  summarise(mean=mean(합.계))

exam_5 %>%
  filter(역명=="고속터미널역",구분=="토") %>% 
  select(역명,구분,합.계) %>%
  summarise(mean=mean(합.계))


#e)
exam_5 %>% 
  select(합.계,호선) %>% 
  arrange(desc(합.계)) ->exam_5sub
head(exam_5sub)
