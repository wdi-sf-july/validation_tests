class Student < ActiveRecord::Base
  validates_uniqueness_of :last_name
end
