require 'rails_helper'

RSpec.describe TodoList, type: :model do
    subject do 
        TodoList.new(title: "Anything", description: "desc",
            created_at: DateTime.now, updated_at: DateTime.now + 1.week, user_id: 8)
    end
    describe "valid type of user_id" do 
        it { expect(subject.user_id).to be_a_kind_of(Integer)}
    end
end