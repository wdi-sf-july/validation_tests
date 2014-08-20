class Student < ActiveRecord::Base
  validates :first_name, length: {:minimum => 5}, presence: true
  validates :last_name, length: {:minimum => 5}, presence: true, uniqueness: true

  ONLY_LETTERS_AND_START_WITH_CAP = /\A[A-Z][a-zA-Z]*\z/
  validates_format_of :first_name, :with => ONLY_LETTERS_AND_START_WITH_CAP
  validates_format_of :last_name, :with => ONLY_LETTERS_AND_START_WITH_CAP

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
