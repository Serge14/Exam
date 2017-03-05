---
output:
  html_document: default
  pdf_document: default
---
### Application for generating unique exam cards
###

####Who may be interested

Teachers who want to make unique exam question cards and tired from the process of making them manually.

###

####How to work with application

__Step 1__

To prepare unique exam cards it is necessary to form a question list first. Questions may be divided by topics, complexity, type etc. Question list needs to be saved in csv file with following columns: 

* _No_ - question number
* _Question_ - questions for exam
* _Group_ - question type, complexity, topic etc.

Here is an example:

No | Question  |  Group
---|-----------|--------
1  | Question1 |  Group1
2  | Question2 |  Group1
3  | Question3 |  Group2
4  | Question4 |  Group2
5  | Question5 |  Group3

__Step 2__

Run the application. It will ask for number of students that are expected to take exam and for number of questions to be included in each group of questions. Be careful, number of questions in each group cannot be more than number of questions for selected group in list of questions. However application will check this.

__Step 3__

Application will save examination cards in txt file. You need just print and cut cards.
Enjoy!

