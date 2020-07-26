require 'rails_helper'

RSpec.describe User do
  context 'when saving user' do
    it 'turns email into lower case' do
      andrej = create(:user, email: 'ANDREJ@GMAIL.com')

      expect(andrej.email).to eq('andrej@gmail.com')
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:tweets) }
    it { is_expected.to have_many(:comments) }

    describe 'dependency' do
      let(:tweets_count) { 1 }
      let(:comments_count) { 1 }
      let(:user) { create(:user) }

      it 'destroys comments' do
        create_list(:comment, comments_count, user: user)

        expect { user.destroy }.to change { Comment.count }.by(-comments_count)
      end

      it 'destroys tweets' do
        create_list(:tweet, tweets_count, user: user)

        expect { user.destroy }.to change { Tweet.count }.by(-tweets_count)
      end
    end
  end

  describe 'validations' do
    it { is_expected.to have_secure_password }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(User::MAXIMUM_NAME_LENGTH) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_most(User::MAXIMUM_EMAIL_LENGTH) }

    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(User::MINIMUM_PASSWORD_LENGTH) }

    context 'when using invalid email format' do
      it 'is invalid' do
        andrej = build(:user, email: "ANDREJ@andrej" )

        expect(andrej.valid?).to be false
      end
    end

    context 'when checking unqieness of email' do
      subject { create(:user) }

      it { is_expected.to validate_uniqueness_of(:email) }
    end
  end
end
