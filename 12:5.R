plot(mtcars$wt, mtcars$mpg) #산점도   
table(mtcars$cyl) # 빈도분석
barplot(mtcars$cly) #막대도표
pie(table(mtcars$cyl))#원도표
hist(mtcars$mpg) #히스토 그램
boxplot(mtcars$mpg) #상자도표

library(ggplot2)
# +를 이용하여 레이어를 쌓는 그림을 그린다. 

#산점도 
# X, Y 되어있는 2차원 좌표를 점으로 찍는 그림 
# X : 수치형 자료
# Y : 수치형 자료 

ggplot(data=mtcars, aes(x=wt,y=mpg)) +#aes ; 축정보 
  geom_point() + 
  geom_smooth(method="lm") +# 연속값으로출력 
  xlim(3,6) + #x 축의 범위
  ylim(15,25) #y 축의 범위

plot(mpg$displ , mpg$hwy, pch=6)

ggplot(data=mpg, aes(x=displ, y=hwy)) + 
  geom_point() + 
  xlab("배기량") +
  ylab("고속도로 연비") + 
  ggtitle("배기량에 따른 고속도로 연비") #제목 


table(mtcars$cyl) # 빈도 분석
barplot(c(11,7,14)) #막대도표



ggplot(data=mtcars,
        aes(x=cyl)) + 
  geom_bar()


library(dplyr)

df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))

df_mpg


ggplot(data=df_mpg, aes(x=drv,
                        y=mean_hwy)) +  
  geom_bar(stat="identity") #숫자를 그대로 그림

ggplot(data=df_mpg, aes(x=reoder(drv,-mean_hwy),  #reorder; 정렬 
                        y=mean_hwy))+
  geom_col()

ggplot(data=economics, aes(x=date,y=unemploy))+ 
  geom_line() #앞뒤가 서로 연관성이 있을때



#Q1. class(자동차 종류)가 "compact", "subcompact", "suv"인 자동차의 cty(도시 연비)가 어떻게 다른지
#비교해보려고 합니다. 세 차종의 cty를 나타낸 상자 그림을 만들어보세요
mpg
head(mpg)
ggplot(data=mpg,aes(x=manufacturer)) +
  geom_barplot()

#수치형 자료(연속형자료):상자그림,히스토그램
#범주형 자료: 막대도표, 원도표

#연속형 * 연속형 : 산점도 
#범주형 * 연속형 : 상자그림 

ggplot(data=mpg, aes(x=factor(cyl), y=cty)) + #숫자를 범주형 자료로 인식 
  geom_barplot()