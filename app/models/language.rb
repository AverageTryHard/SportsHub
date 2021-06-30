class Language < ApplicationRecord
  validates :language_name, presence: true
  validates :locale_name, presence: true, length: { is: 2 }
  validates :is_active, inclusion: [true, false]
end
