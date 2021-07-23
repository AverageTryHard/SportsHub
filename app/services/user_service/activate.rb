module UserService
  class Activate < BaseService
    def call(**args)
      return true if args[:user].save

      errors << "Can't activate user"

      false
    end
  end
end
