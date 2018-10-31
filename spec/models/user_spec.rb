require 'rails_helper'

RSpec.describe User, type: :model do
    TodoList.new(title: "Anything", description: "Lorem ipsum",
        created_at: DateTime.now, updated_at: DateTime.now + 1.week, user_id: 8)
    subject {
    User.new(:id => 8, :email => "yesi@mail.com", :password => "pw1234",
        :password_confirmation => "pw1234", :uid => "76", created_at: DateTime.now,
        updated_at: DateTime.now + 1.week, avatar_file_name: "avatar.png",
        avatar_content_type: "png")
    }
    describe "validate image" do
        it "valid name avatar exist" do 
            subject.avatar_file_name = "avatar.png"
            expect(subject.avatar_file_name).to be_valid
        end
        it "shouldn´t require type image of avatar" do 
            expect(subject.avatar_content_type).to_not be_valid
        end
        
    end
    describe "associations" do
        it "associeted has many todo list" do
            subject.username = ""
            expect(subject).to respond_to(:has_many)
        end
    end
    describe "valid mail" do
        it "mail exist" do
            expect(subject.exist?).to be_truthy
        end
    end

end