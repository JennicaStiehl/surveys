require 'spec_helper'

RSpec.describe Answer, type: :model do
  describe 'validations' do
    it { should belong_to(:question) }
    it { should belong_to(:response) }

  end

end
