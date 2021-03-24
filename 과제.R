
## 1
#a pororo라는 data.frame을 생성하세요.

name <- c("뽀로로","크롱","에디","포비","해리","루피")
math <- c(81,86,98,62,86,79)
eng <- c(89,63,75,65,95,93)
kor <- c(92,73,86,78,93,89)

pororo <- data.frame(name,math,eng,kor)

#b total=math+eng+kor 입니다. 총점을 생성하세요.
total <- math+eng+kor
total

#c avg = total/3입니다. 평균을 생성하세요.
avg=total/3
avg

##2
#a 승용차요일제 위반이 가장 많았던 달은?
install.packages("readxl");
getwd(); #현재 폴더 확인 
library(readxl);
daegu1 <- read.csv("/Users/yuhyun/Downloads/대구광역시_승용차요일제 위반 통계_20191231.csv", stringsAsFactors = F)
daegu1
#b 승용차요일제 위반이 가장 많은 요일은?

##3
#excel_example3를 불러와 다음 문제를 푸세요


