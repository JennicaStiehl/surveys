require 'spec_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it { should belong_to :question_answers }
    it { should belong_to :categories }
  end

end
