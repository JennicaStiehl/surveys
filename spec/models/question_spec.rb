require 'spec_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it { should have_many :choices }
    it { should belong_to :categories }
  end

end
