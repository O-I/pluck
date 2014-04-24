require 'spec_helper'

describe Favorite do

  before { @fave = create(:favorite) }

  subject { @fave }

  it { should respond_to(:tweet_id) }
  it { should respond_to(:date_tweeted) }
  it { should respond_to(:text) }
  it { should respond_to(:tweet_id) }
  it { should respond_to(:tweeter_name) }
  it { should respond_to(:tweeter_screen_name) }
  it { should respond_to(:tweeter_profile_image_url) }
  it { should respond_to(:retweet_count) }
  it { should respond_to(:favorite_count) }
  it { should respond_to(:urls) }

  it { should be_valid }

  it { should validate_uniqueness_of(:tweet_id) }
end