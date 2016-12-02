require 'CSV'
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
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
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
      save_students(choose_file)
    when "4"
      load_students(choose_file)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def choose_file
  puts "Enter the filename"
  file = STDIN.gets.chomp
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  add_count = 0
  # while name not empty, repeat this code
  while !name.empty? do
    # add student hash to array
    add_student(name)
    puts "Now we have #{$students.count} students"
    add_count += 1
    # get another name from user
    name = STDIN.gets.chomp
  end
  puts "#{add_count} students successfully added"
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) {
    |line|
    add_student(line[0], line[1].to_sym)
  }
  puts "Students successfully loaded from #{filename}"
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

def save_students(filename)
  CSV.open(filename, "w") {
    |file|
    $students.each {
      |s|
      file << [s[:name], s[:cohort]]
      }
  }
  puts "Students successfully saved"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
