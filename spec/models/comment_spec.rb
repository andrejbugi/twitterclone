require 'rails_helper'

RSpec.describe Comment do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:tweet) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end
