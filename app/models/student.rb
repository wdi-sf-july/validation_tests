class Student < ActiveRecord::Base
  validates_uniqueness_of :last_name
  validates_length_of :first_name, :minimum => 4
  validates_presence_of :first_name
  validates_length_of :last_name, :minimum => 4
  validates_presence_of :last_name
end
