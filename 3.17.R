#1 200부터 100사이의 5씩 감소하는 수를 seq()함수로 생성한 후 v학번으로 명명하세요.
v21719159 <- seq(from = 200, to = 100, by = -5)


#2  stem함수를 이용하여 줄기와잎 그림을 그리세요.
# ?stem 에서 사용법을 확인 후 그려보세요.
?stem
stem(rivers,scale=1, width=141)


# 3 rivers의 자료의 대표값과 산포도를 구하시오.
x <- rivers
#대표값
mean(x)
median(x)
max(x)
min(x)
#산포도
quantile(x)
var(x)
IQR(x)
range(x)

# 4 데이터 입력 후 분석하기
OECD <- c(40, 38, 30,30,28,24,24,24,23,23,23,22,21,20,20,20,20,19,19,19,16,15)
mean(OECD)
sd(OECD)

# 5 본인의 전공과 학번을 각각 dept와 id로 명명하자.
# paste()함수를 사용하여 daegu, dept, id가 모두 출력되도록 하자.

dept <- "통계학과"
id <- 21719159
daegu <- c("경상북도", "경산시", "대구대로 201")
a <- c("통계학과", 21719159)
a
?paste
result=paste(daegu ,a  ,collapse="," ,)
result
