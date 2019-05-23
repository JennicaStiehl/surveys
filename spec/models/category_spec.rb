require 'spec_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should have_many(:questions) }
  end

end
