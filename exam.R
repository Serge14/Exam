setwd("/home/sergiy/Documents/Work/Exam")
exam = read.csv("questionlist.csv")

# Check number of question groups, 
# assign zeros to vector that keeps data on number of questions in each group
NoGroups = length(unique(exam$Group))
group = rep(0, NoGroups)

# Output file
examcards = ""

# Delete output file if it exists
if (file.exists("examcards.txt")) file.remove("examcards.txt")

# Function that read user input, checks if it is integer
readinteger = function(msg) { 
    n = readline(prompt = msg)
    if(!grepl("^[0-9]+$", n)) {return(readinteger(msg))}
    return(as.integer(n))
}

# Step 1: Define number of students
NoStudents = readinteger("Enter number students who are expected to take exam: ")

# Step 2: Define number of groups in variant
for (i in 1:NoGroups) {
    group[i] = readinteger(paste0("Enter number of questions for group ",
                                  unique(exam$Group)[i],": "))
    
    #Check if there are enough questions in the group to prepare examcards
    while (group[i] > length(exam$Group[exam$Group == unique(exam$Group)[i]])) {
        print(paste0("Wrong number of questions, you can enter not more than ",
                     length(exam$Group[exam$Group == unique(exam$Group)[i]])))
        group[i] = readinteger(paste0("Enter number of questions for group ",
                                      unique(exam$Group)[i],": "))
    }
}

#Step 3: Define questions for each student
for (i in 1:NoStudents) {
    examcards = "-----------------------------"
    examcards=paste0(examcards, "\n", "\n", "Білет №", i, "\n")    # Head of exam card
    write(examcards, "examcards.txt", append = TRUE)
    
    for (l in 1:NoGroups) {
        k = 1
        examcards = paste(unique(exam$Group)[l], "\n") # Form question group title
        choice = sample(exam$Questions[exam$Group==unique(exam$Group)[l]], group[l])                     # Questions for student i
    
    for (j in 1:group[l]){
        examcards = paste0(examcards, k, ". ", choice[j], "\n") # Form questions for group
        k = k+1
    }
    write(examcards, "examcards.txt", append = TRUE)      # Write group questions into file
} }