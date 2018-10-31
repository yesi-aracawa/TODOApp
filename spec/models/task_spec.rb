require 'rails_helper'

RSpec.describe Task, type: :model do

    describe "validations" do
        before { subject.todo_list = TodoList.new }

        describe "content" do
            it "should be required" do
                subject.content = nil
                expect(subject).to_not be_valid
            end

            it "should not be empty" do
                subject.content = ""
                expect(subject).to_not be_valid
            end

            it "should be min 10 chars long" do
                subject.content = "a"*9
                expect(subject).to_not be_valid
                subject.content = "a"*10
                expect(subject).to be_valid
            end
        end

        describe "#todo_list" do
            before { subject.content = "a"*10 }
            it "should be required" do
                subject.todo_list = nil
                expect(subject).to be_invalid
                subject.todo_list = TodoList.new
                expect(subject).to be_valid
            end
        end
     end
    
     describe "#completed?" do
        before { subject.content = "a"*10 }
        it "should have a method called completed?" do
            expect(subject).to respond_to(:completed?)
        end
        context "when completed_at is not present" do
            it "should return false" do
                subject.completed_at = nil
                expect(subject.completed?).to be_falsy
            end
        end
        context "when completed_at is present" do
            it "should return true" do
                subject.completed_at = Date.today
                expect(subject.completed?).to be_truthy
            end
        end
     end
end