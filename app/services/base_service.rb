class BaseService
  attr_accessor :errors

  def self.call(**args)
    new.call(**args)
  end

  def initialize
    @errors = []
  end

  def call(**args)
    # implement logic here
  end

  def send_status_mail(**args)
    ApplicationMailer.with(user: args[:user], status: args[:status]).updated_user_status_notify.deliver_later
  end
end
