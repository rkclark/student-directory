def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index {
    |n,i|
    puts "#{i+1}. #{n[:name]}, Hobbies: #{n[:hobbies]}, Country of birth: #{n[:country]}, Height: #{n[:height]}, Cohort: #{n[:cohort]}"
  }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "For each student, please enter their name, hobbies, country of birth and height separated by pipes"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  student = gets.chomp
  # while name not empty, repeat this code
  while !student.empty? do
    # add student hash to array
    info = student.split("|").map { |w| w.strip }
    students << {name: info[0], cohort: :november, hobbies: info[1], country: info[2], height: info[3]}
    puts "Now we have #{students.count} students"
    # get another name from user
    student = gets.chomp
  end
  # return array of students
  students
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
