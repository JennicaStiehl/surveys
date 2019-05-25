require 'spec_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it { should have_many :choices }
    # it { should have_many :responses, :through => :choice}
    it { should belong_to :category }
    it { should validate_presence_of :question }
  end

end
