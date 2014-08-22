require 'rails_helper'

RSpec.describe Student, :type => :model do
  it "1) should create a student with the new syntax" do
    tim = Student.new(:first_name => "Tim", :last_name => "Licata", :age => 30)
    expect(tim.class).to eq(Student)
    expect(tim.first_name).to eq("Tim")
    expect(tim.last_name).to eq("Licata")
    expect(tim.age).to eq(30)
    expect(tim.new_record?).to eq(true)
  end
end
