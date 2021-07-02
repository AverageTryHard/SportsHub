module UserService
  class ChangeStatus < BaseService
    def call(**args)
      if user.save
        return true
      else
        errors << "Can't block user"
      end

      true
    end
  end
end
