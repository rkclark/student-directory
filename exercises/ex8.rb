def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print(students)
  cohorts = students.map { |n| n[:cohort] }.uniq
  #students.each { |n| puts "#{n[:name]} (#{n[:cohort]} cohort)".center(40) }
  cohorts.each { |c|
    puts "Students in cohort #{c}:".center(40)
    students.each { |s| puts "#{s[:name]}".center(40) if s[:cohort] == c  }
   }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the name and cohort of the students, separated by a comma"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.chomp
  # while name not empty, repeat this code
  while !name.empty? do
    info = name.split(",")
    # add student hash to array
    students << {name: info[0], cohort: (info[1] ? (info[1].to_sym) : (:unspecified))}
    puts "Now we have #{students.count} students"
    # get another name from user
    name = gets.chomp
  end
  # return array of students
  students
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
