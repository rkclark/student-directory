def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each { |n| puts "#{n[:name]} (#{n[:cohort]} cohort)" }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.slice(0..-2)
  # while name not empty, repeat this code
  while !name.empty? do
    # add student hash to array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from user
    name = gets.slice(0..-2)
  end
  # return array of students
  students
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
