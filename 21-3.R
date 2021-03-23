english <- c(90, 80, 60, 70) # 영어 점수 변수 생성
english

math <- c(50, 60, 100, 20) # 수학 점수 변수 생성
math


# english, math로 데이터 프레임 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math) 
df_midterm

class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

mean(df_midterm$english) # df_midterm의 english로 평균 산출

mean(df_midterm$math) # df_midterm의 math로 평균 산술

df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2)) #데이터 프레임 한꺼번에 만들기 
df_midterm

dim(df_midterm) #차원 확인 
df_midterm[ , ] #원하는 행렬 선택 
rm(df_midterm) #rm 함수는 원하는 object 지울떄 사용 


#데이터 불러오기
install.packages("readxl");
getwd(); #현재 폴더 확인 

library(readxl); # readxl 이란 library 생성 
# 엑셀 파일을 불러와서 df_exam에 할당
df_exam <- read_excel("/Users/yuhyun/Downloads/excel_exam.xlsx"); 

df_exam <- read_excel(file.choose())
df_exam

head(df_exam) #앞부분만 확인 

#엑셀 파일 첫 번째 행이 변수명이 아닐때
df_exam_novar <- read_excel("/Users/yuhyun/Downloads/excel_exam_novar.xlsx", col_names = F)
#기존에 있는 변수의 이름을 바꿀때
names(df_exam) <- c("id","class","math","english","science")

#엑셀 파일에 시트가 여러 개 있을때
df_exam_sheet <- read_excel("/Users/yuhyun/Downloads/excel_exam_sheet.xlsx", sheet = 3)

df_csv_exam <- read.csv("/Users/yuhyun/Downloads/csv_exam.csv" )

#4번째 행부터 불러오기 
df_csv_exam <- read.csv("/Users/yuhyun/Downloads/csv_exam.csv", skip=4 )

#문자가 들어 있는 파일을 불러올 때

df_csv_exam <- read.csv("/Users/yuhyun/Downloads/csv_exam.csv", stringsAsFactors = F)

#data 를 csv형태로 저장 
write.csv(rivers, file="/Users/yuhyun/Downloads/rivers.csv")

data$X #번호
data$x #rivers 

#data.frame()과 c()를 조합해서 표의 내용을 데이터 프레임으로 만들어 출력해보세요.
제품 <- c("사과","딸기","수박") ## str type 은 ""을 넣어야 쓸수잇다. 
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)

df_midterm <- data.frame(제품,가격,판매량 )
df_midterm
rm(df_midterm)

#Q2. 앞에서 만든 데이터 프레임을 이용해서 과일 가격 평균, 판매량 평균을 구해보세요
mean(df_midterm$가격)
mean(df_midterm$판매량)
