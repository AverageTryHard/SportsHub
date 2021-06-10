class ApplicationMailer < ActionMailer::Base
  default from: 'sportshub@example.com'
  layout 'mailer'

  def destroy_user_notify
    @user = params[:user]
    mail(to: @user.email, subject: 'Your account was deleted', body: 'Have a nice day!')
  end

  def update_user_status_notify
    @new_status = params[:new_status]
    key_word = @new_status == 'activate' ? 'activated' : 'blocked'
    mail(to: @new_status.email, subject: "Your account was #{key_word}", body: 'Have a nice day!')
  end
end
