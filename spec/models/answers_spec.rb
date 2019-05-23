require 'spec_helper'

RSpec.describe Answer, type: :model do
  describe 'validations' do
    it { should belong_to(:question) }
  end

end
