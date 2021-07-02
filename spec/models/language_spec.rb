require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'validations' do
    subject { build(:language) }

    it { is_expected.to validate_presence_of(:language_name) }
    it { is_expected.to validate_presence_of(:locale_name) }
    it { is_expected.to validate_inclusion_of(:is_active).in_array([true, false]) }
    it { is_expected.to validate_length_of(:locale_name).is_equal_to(2) }
  end
end
