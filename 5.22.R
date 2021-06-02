패키지 준비하기
install.packages("foreign") # foreign 패키지 설치
library(foreign) # SPSS 파일 로드
library(dplyr) # 전처리
library(ggplot2) # 시각화
library(readxl) # 엑셀 파일 불러오기
데이터 준비하기
# 데이터 불러오기
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
 to.data.frame = T)
# 복사본 만들기
welfare <- raw_welfare


데이터 검토하기
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

변수명 바꾸기
welfare <- rename(welfare,
 sex = h10_g3, # 성별
 birth = h10_g4, # 태어난 연도
 marriage = h10_g10, # 혼인 상태
 religion = h10_g11, # 종교
 income = p1002_8aq1, # 월급
 code_job = h10_eco9, # 직종 코드
 code_region = h10_reg7) # 지역 코드


#성별 월급 평균표 만들기
sex_income <- welfare %>%
 filter(!is.na(income)) %>%
 group_by(sex) %>%
 summarise(mean_income = mean(income))
sex_income
## # A tibble: 2 x 2
## sex mean_income
## <chr> <dbl>
## 1 female 163.2471
## 2 male 312.2932


age_income <- welfare %>%
 filter(!is.na(income)) %>%
 group_by(age) %>%
 summarise(mean_income = mean(income))
head(age_income)