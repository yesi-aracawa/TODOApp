class Task < ApplicationRecord
  belongs_to :todo_list
  validates :content, length: { minimum: 10 }

  def completed? 
    !completed_at.nil?
  end

end
