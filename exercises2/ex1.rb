$students = []

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  $students.each { |n| puts "#{n[:name]} (#{n[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{$students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      # input the students
      input_students
    when "2"
      # show the students
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while name not empty, repeat this code
  while !name.empty? do
    # add student hash to array
    add_student(name)
    puts "Now we have #{$students.count} students"
    # get another name from user
    name = STDIN.gets.chomp
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each {
    |line|
    name, cohort = line.chomp.split(",")
    add_student(name, cohort.to_sym)
  }
  file.close
end

def add_student (name, cohort = :november)
  $students << { name: name, cohort: cohort }
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{$students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    Exit
  end
end

def save_students
  file = File.open("students.csv", "w")
  $students.each {
    |s|
    student_data = [s[:name], s[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  }
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
