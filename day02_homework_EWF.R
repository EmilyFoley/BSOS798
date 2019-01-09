# Complete all of the items below
# Use comments where you're having trouble or questions

#COMMENT: This is backgroud work to pull up libraries.
library(pillar)
library(dplyr)
library(ggplot2)
library(tidyr)
#COMMENT: This is backgroupd work to set a working directory.
setwd("M:/IRPA/Personal/Staff/efoley/Courses/BSOS798 R Programming/Homework")

# 1. Read your data set into R
#Pull in data file from CSV format to R
Dataset <- read.csv("BSOS798Dataset.csv", stringsAsFactors = FALSE)

# 2. Peek at the top few rows
head(Dataset)

# 3. Peek at the top few rows for only a few columns
Dataset[1:6,1:10]

# 4. How many rows does your data have?
nrow(Dataset)

# 5. Get a summary for every column
summary(Dataset)

# 6. Get a summary for one column
summary(Dataset$x2_1)

# 7. Are any of the columns giving you unexpected values?
#RESPONSE: No. This is a very simple dataset of survey responses (options range from 0-4).

# 8. Select a few key columns, make a vector of the column names
faculty <- c("x2_4", "x2_5", "x2_6", "x2_7") 

# 9. Create a new data.frame with just that subset of columns
faculty <- data.frame(Dataset [c("x2_4", "x2_5", "x2_6", "x2_7")])
#NOTE: This data frame is named faculty becaseu these 4 questions relate to student/faculty interaction.

# 10. Create a new data.frame that is just the first 10 rows and the last 10 rows of the data from the previous step
faculty10 <- faculty [1:10,]
#QUESTION: I understand how to return the first ten rows but not the last 10 in the same step. How do I do that?
head(faculty10, 10)
tail(faculty10, 10) #NOTE: Since I only have 10 rows at the moment, the head and tail results are the same. This will change when I figure out how to add the last 10 rows for a total of 20.

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample
?sample
DatasetHalf <- sample_frac(Dataset, .5)
nrow(DatasetHalf)

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test() (or cor.test()) for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it

#THOUGHT PROCESS: First I'm creating a subset of females and a subset of males then running a ttest on a specific column (x2_12)
# The survey text associated with x2_12 is "Do you feel safe on campus? the scale is 0 (strongly disagree) through 4 (strongly agree)

female <- subset(Dataset, gender == "Female", select=c(SurvID_1:college)) 
head(female) #This is just to check that everyone in this subset is female.
summary(female$x2_12) #This is just to get an idea of the mean for females for the survey item of interest.

male <- subset(Dataset, gender == "Male", select=c(SurvID_1:college)) 
head(male) #This is just to check that everyone in this subset is female.
summary (male$x2_12) #This is just to get an idea of the mean for females for the survey item of interest.

ttest_female_male_safe <- t.test (female$x2_12, male$x2_12)
print(ttest_female_male_safe)

# ANSWERS TO QUESTIONS ABOVE: I didn't run a non-default test (like paired) because each respondent only took the survey once.
# ANSWERS TO QUESTIONS ABOVE: I don't understand the formula and vector formats question...

# 13. Repeat #12 for TWO more comparisons
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise

#NOTE: additional comparison 1 looks at x2_16 (I'm as involved in campus activities as I want to be.)
ttest_female_male_involved <- t.test (female$x2_16, male$x2_16) 
print(ttest_female_male_involved)

#NOTE: additional comparison 2 looks at x2_17 (I am earning the grades I want.)
ttest_female_male_grades <- t.test (female$x2_17, male$x2_17) 
print(ttest_female_male_grades)

# 14. Save all results from #12 and #13 in an .RData file

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link


