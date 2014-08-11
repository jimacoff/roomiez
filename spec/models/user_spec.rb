require 'spec_helper'

describe User do
  # Check shoulda-matchers docs
  it { should have_many(:apartments) }
  it { should have_many(:tasks).through(:apartments) }
  it { should have_many(:memberships).dependent(:destroy) }
  it { should have_many(:circles).through(:memberships) }
  it { should have_many(:messages) }
  it { should have_many(:reviews) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:name) }

  describe ".filter" do 
    let!(:john) { create(:john) }
    let!(:sarah) { create(:sarah) }

    context 'when query is empty' do
      it 'returns all users' do
	expect(User.filter('')).to match_array([john, sarah])
      end
    end

    context 'when query is present' do
      it "matches on name" do
	expect(User.filter('sarah')).to match_array([sarah])
      end

      it "matches on email" do
	expect(User.filter('gmail.com')).to match_array([john, sarah])
      end

      it "returns nothing if query does not match" do
	expect(User.filter('some_gibberish')).to match_array([])
      end
    end
  end
end
