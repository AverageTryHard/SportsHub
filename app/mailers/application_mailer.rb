class ApplicationMailer < ActionMailer::Base
  default from: 'sportshub@example.com'
  layout 'mailer'

  def destroy_user_notify
    @user = params[:user]
    mail(to: @user.email, subject: 'Your account was deleted', body: 'Have a nice day!')
  end

  def updated_user_status_notify
    user = params[:user]
    new_status = params[:status]
    mail(to: user.email, subject: "Your account was #{new_status}", body: 'Have a nice day!')
  end
end
