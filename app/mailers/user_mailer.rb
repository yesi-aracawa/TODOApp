class UserMailer < ApplicationMailer
    def new_task(user, task)
        @task = task
        mail(to: task.email, subject: 'finish task!')
    end
end
