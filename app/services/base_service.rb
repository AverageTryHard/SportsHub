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
end
