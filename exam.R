setwd("/home/sergiy/Documents/Work/Exam")
exam = read.csv("text.csv")

# Input file technical information
NoGroups = length(unique(exam$Group))
group = rep(0, NoGroups)

# Output
ticket = ""

# Delete output file if it exists
if (file.exists("ticket")) file.remove("ticket")

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
}

#Step 3: Define questions for each student
for (i in 1:NoStudents) {
    ticket = "-----------------------------"
    ticket=paste0(ticket, "\n", "\n", "Білет №", i, "\n")    # Head of variant
    write(ticket, "ticket", append = TRUE)
    
    for (l in 1:NoGroups) {
        k = 1
        ticket = paste(unique(exam$Group)[l], "\n") # Form group title
        choice = sample(exam$No[exam$Group==unique(exam$Group)[l]], group[l])                     # Questions for student i
    
    for (j in 1:group[l]){
        ticket = paste0(ticket, k, ". ", exam$Questions[choice[j]], "\n") # Form variant
        k = k+1
    }
    write(ticket, "ticket", append = TRUE)      # Write variant into file
} }
