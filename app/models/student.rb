class Student < ActiveRecord::Base
  validates :first_name, length: {:minimum => 4}, presence: true
  validates :last_name, length: {:minimum => 4}, presence: true, uniqueness: true

  @only_letters_and_start_with_cap = /\A[A-Z][a-zA-Z]*\z/
  validates_format_of :first_name, :with => @only_letters_and_start_with_cap
  validates_format_of :last_name, :with => @only_letters_and_start_with_cap
end
