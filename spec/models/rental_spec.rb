require 'rails_helper'

RSpec.describe Rental, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:home_type) }
    it { is_expected.to validate_presence_of(:rental_type) }
    it { is_expected.to validate_presence_of(:accommodate) }
    it { is_expected.to validate_presence_of(:bedroom) }
    it { is_expected.to validate_presence_of(:bathroom) }
  end
end
