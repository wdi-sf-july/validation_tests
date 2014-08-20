class Student < ActiveRecord::Base
  validates :first_name, length: {:minimum => 4}, presence: true
  validates :last_name, length: {:minimum => 4}, presence: true, uniqueness: true

  @only_letters_and_start_with_cap = /\A[A-Z][a-zA-Z]*\z/
  validates_format_of :first_name, :with => @only_letters_and_start_with_cap
  validates_format_of :last_name, :with => @only_letters_and_start_with_cap

  INSTRUCTORS = [{:first_name => "Delmer", :last_name => "Reed"},
                 {:first_name => "Tim", :last_name => "Licata"},
                 {:first_name => "Anil", :last_name => "Bridgpal"},
                 {:first_name => "Elie", :last_name => "Schoppik"}]
  validate :no_instructors

  def no_instructors
    INSTRUCTORS.each do |teacher|
      if teacher[:first_name] == first_name and teacher[:last_name] == last_name
        errors.add(:username, "This is a restricted instructor name")
      end
    end
  end
end
