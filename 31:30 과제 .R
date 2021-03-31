data1 <- read.csv("/Users/yuhyun/Downloads/도로교통공단_시도 시군구별 교통사고 통계_20201214.csv")
#처음 10개의 자료는?
head(data1,10)
# 불러온 자료의 행과 열의 갯 수는?
dim(data1)
  #우리나라 총 교통사고건수는?
sum(data1$사고건수)
  #가장 교통사고가 많이 발생한 시군구는?
data1 <- as.data.frame(data1)
data1[data1$시군구==max(data1$사고건수), ]
  #가장 사망자수가 많은 시도는?
data1[data1$시도 == max(data1$사망자수),]
  #사고건수를 accident, 사망자수는 death, 중산자수는 severe, 경상자수는 mild, 부상자수는 injured로 변수명을 변경 후 마지막 8개 자료를 확인하여라.
install.packages("dplyr")
library(dplyr)
data1 %>% 
  rename(accident =사고건수,death=사망자수,severe= 중상자수 , mild=경상자수, injured=부상신고자수) -> data1
#사고건수가 1000건 미만인 지역을 사고등급 A,
#1000건 이상이고 2000건 미만을 사고등급 B,
#2000건 이상이고 3000건 미만을 사고등급 C,
#3000건 미만을 사고등급 D 로 분류 한 후 빈도를 확인하여라.

ifelse(data1$accident < 1000, "A",ifelse(1000<=data1$accdient<2000,"B",ifelse(2000<= data1$accident <3000,"C",ifelse(data1$accident >3000,"D",0))))
#분류된 사고등급을 막대도표로 시각화 하여라.


#충청북도 괴산군_수위정보_20200227.csv 파일을 불러와서 다음 문제를 푸세요
data2 <- read.csv("/Users/yuhyun/Downloads/충청북도 괴산군_수위정보_20200227.csv")
#첫번째 열의 이름을 location으로 변경하여 처음 5개 자료를 출력하세요.
data2 %>% 
  rename(지역명=location) -> df_new
#unique()함수를 이용하면 location은 7개의 다리위치입니다.

## [1] "괴강교" "수전교" "교동교" "구기교" "칠성교" "후평교" "도원교"

#수위자료가 가장 많은 다리명을 구하세요.


#다리의 위치에 따른 평균 수위를 구하세요. (결과의 예)

Tip. [ , ]를 이용하여 특정 다리의 자료만 선택한 후 평균 수위를 구하세요.

##   location   평균수위
## 1   괴강교   46.94462
## 2   교동교   30.54268
## 3   구기교   48.71733
## 4   도원교   58.67576
## 5   수전교 5689.99695
## 6   칠성교   86.08207
## 7   후평교   91.19453