class ContactJob < ApplicationJob
  queue_as :default

  def perform(*args)
    UserMailer.new_task(user, task).deliver_now
  end
end
