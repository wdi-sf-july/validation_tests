## Console Lab

For this lab, we'd like you to strengthen your Rails console skills. This lab is going to be very familiar to the SQL lab, where we'll ask you to create a model and then write out the console commands you would use to execute these queries

### To Start

1. Create a model called Student, that has a first_name, last_name and age
2. Don't forget to run your migrations

### Tasks to create

1. Using the new/save syntax, create a student, first and last name and an age 

        tim = Student.new(:first_name => "Tim", :last_name => "Licata", :age => 30)
        tim.save

2. Save the student to the database

       tim.save

3. Using the find/set/save syntax update the student's first name to taco

       tim = Student.find(1)
       tim.first_name = "taco"
       tim.save

4. Delete the student (where first_name is taco)

       tim = Student.find_by_first_name("taco")
       tim.destroy

5. Validate that every Student's last name is unique

       class Student < ActiveRecord::Base
         validates_uniqueness_of :last_name
       end

6. Validate that every Student has a first and last name that is longer than 4 characters

       class Student < ActiveRecord::Base
         validates_uniqueness_of :last_name
         validates_length_of :first_name, :minimum => 4
         validates_length_of :last_name, :minimum => 4
       end

7. Validate that every first and last name cannot be empty

          validates_presence_of :first_name
          validates_presence_of :last_name

7. Combine all of these individual validations into one validation (using validate and a hash) 

        class Student < ActiveRecord::Base
          validates :first_name, length: {:minimum => 4}, presence: true
          validates :last_name, length: {:minimum => 4}, presence: true, uniqueness: true
        end

8. Using the create syntax create a student named John Doe who is 33 years old

        john = Student.create(:first_name => "John", :last_name => "Doe", :age => 33)

9. Show if this new student entry is valid

        john.valid?

10. Show the number of errors for this student instance

        john.errors.size

11. In one command, Change John Doe's name to Jonathan Doesmith 

        john.update_attributes(:first_name => "Jonathan", :last_name => "Doesmith")

12. Clear the errors array

        john.errors.clear

13. Save Jonathan Doesmith

        john.save

15. Find all of the Students

        Student.all

16. Find the student with an ID of 128 and if it does not exist, make sure it returns nil and not an error

        Student.find_by_id(128)

17. Find the first student in the table
18. Find the last student in the table
19. Find the student with the last name of Doesmith
21. Find all of the students and limit the search to 5 students, starting with the 2nd student and finally, order the students in alphabetical order
20. Delete Jonathan Doesmith

### Bonus
1. Use the validates_format_of and regex to only validate names that consist of letters (no numbers or symbols) and start with a capital letter
2. Write a custom validation to ensure that no one named Delmer Reed, Tim Licata, Anil Bridgpal or Elie Schoppik is included in the students table


