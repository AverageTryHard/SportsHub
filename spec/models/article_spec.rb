require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    subject { build(:article) }

    it { is_expected.to validate_presence_of(:headline) }
    it { is_expected.to validate_presence_of(:caption) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:headline).is_at_most(100) }
    it { is_expected.to validate_length_of(:alt_text).is_at_most(100) }
    it { is_expected.to validate_length_of(:caption).is_at_most(100) }
    it { is_expected.to validate_length_of(:content).is_at_most(1000) }
  end
end
