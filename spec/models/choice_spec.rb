require 'spec_helper'

RSpec.describe Choice, type: :model do
  describe 'validations' do
    it { should belong_to(:question) }
    it { should have_many :responses }

  end

end
