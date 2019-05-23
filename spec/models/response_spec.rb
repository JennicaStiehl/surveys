require 'spec_helper'

RSpec.describe Response, type: :model do
  describe 'validations' do
    it { should belong_to(:question) }
    it { should belong_to(:choices) }
    it { should belong_to(:answers) }
  end

end
