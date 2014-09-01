require 'spec_helper'

describe Review do
  it { should belong_to(:user) }
  it { should belong_to(:apartment) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:apartment_id) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:rating) }

  it { should ensure_inclusion_of(:rating).in_array([1,2,3,4,5]) }
end
