require_relative '..\application_record'


class Task < ApplicationRecord
  belongs_to :todo_list

  def completed?
    !completed_at.blank?
  end

end
