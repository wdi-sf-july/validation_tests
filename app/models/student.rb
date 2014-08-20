class Student < ActiveRecord::Base
  validates :first_name, length: {:minimum => 4}, presence: true
  validates :last_name, length: {:minimum => 4}, presence: true, uniqueness: true

  validates_format_of :first_name, :with => /\A[A-Z][a-zA-Z]*\z/
  validates_format_of :last_name, :with => /\A[A-Z][a-zA-Z]*\z/
end
