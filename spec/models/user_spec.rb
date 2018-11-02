require 'rails_helper'

RSpec.describe User, type: :model do
    before(:all) do 
        TodoList.new(title: "Anything", description: "desc",
            created_at: DateTime.now, updated_at: DateTime.now + 1.week, user_id: 8)
    end
        subject do
            User.new(:id => 8, email: "yesi@mail.com", password: "pw1234", username: "yesi",
                password_confirmation: "pw1234", :uid => "76", created_at: DateTime.now,
                updated_at: DateTime.now + 1.week, avatar_file_name: "avatar.png",
                avatar_content_type: "image")
        end
    describe "username" do
        it "is unique" do
          should validate_uniqueness_of(:username)
        end
    end
    describe "validate image" do
        it "valid file name of avatar to png or jpg" do 
            expect(subject.avatar_file_name).to match(/png\Z/ || /jpe?g\Z/)
        end
        it "valid type image of avatar" do 
            expect(subject.avatar_content_type).to match(/\Aimage/)
        end
        
    end
    describe "associations" do
        it "associeted has many todo list" do
            should have_many(:todo_lists) 
        end
    end
    describe "valid mail" do
        it "mail exist" do
            expect(subject.exist?).to be_truthy
        end
    end

end