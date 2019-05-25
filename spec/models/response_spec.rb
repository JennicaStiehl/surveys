require 'spec_helper'

RSpec.describe Response, type: :model do
  describe 'validations' do
    it { should belong_to(:choice) }
    # it { should delegate :question, :to => :choice}
    it { should validate_presence_of :question_id}
    it { should validate_presence_of :student_id}
  end

end
