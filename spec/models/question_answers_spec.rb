require 'spec_helper'

RSpec.describe QuestionAnswers, type: :model do
  describe 'validations' do
    it { should belong_to :question_answers }
  end

end
