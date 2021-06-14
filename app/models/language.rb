class Language < ApplicationRecord
  validates :language_name, presence: true
  validates :locale_name, presence: true
  validates :status, presence: true
end
