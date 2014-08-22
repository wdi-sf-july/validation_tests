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

  it "2) should save the student to the database" do
    tim = Student.new(:first_name => "Timothy", :last_name => "Licata", :age => 30)
    expect(tim.new_record?).to eq(true)
    expect(tim.save).to eq(true)
    expect(tim.new_record?).to eq(false)
  end

  it "3) should use find/set/save syntax to update firstname" do
    Student.create(:first_name => "Timothy", :last_name => "Licata", :age => 30)
    tim = Student.find_by_first_name("Timothy")
    tim.first_name = "Tacoe"
    expect(tim.save).to eq(true)

    taco = Student.find_by_first_name("Tacoe")
    expect(tim.id).to eq(taco.id)
  end
end
