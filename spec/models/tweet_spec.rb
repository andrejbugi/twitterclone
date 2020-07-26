require 'rails_helper'

RSpec.describe Tweet do
  describe 'associations' do
    it { is_expected.to have_many(:comments) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'dependency' do
    let(:comments_count) { 1 }
    let(:tweet) { create(:tweet) }

    it 'destroys comments' do
      create_list(:comment, comments_count, tweet: tweet)

      expect { tweet.destroy }.to change { Comment.count }.by(-comments_count)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(Tweet::MAXIMUM_TITLE_LENGTH) }
    it { is_expected.to validate_length_of(:title).is_at_least(Tweet::MINIMUM_TITLE_LENGTH) }

    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_most(Tweet::MAXIMUM_BODY_LENGTH) }
  end
end
