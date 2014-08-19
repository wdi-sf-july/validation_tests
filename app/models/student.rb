class Student < ActiveRecord::Base
  validates :first_name, length: {:minimum => 4}, presence: true
  validates :last_name, length: {:minimum => 4}, presence: true, uniqueness: true
end
