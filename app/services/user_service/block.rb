module UserService
  class Block < BaseService
    def call(**args)
      return true if args[:user].save

      errors << "Can't block user"

      false
    end

    def send_mail(**args)
      ApplicationMailer.with(user: args[:user], status: args[:status]).updated_user_status_notify.deliver_later
    end
  end
end
