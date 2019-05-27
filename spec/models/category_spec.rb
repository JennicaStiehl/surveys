require 'spec_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should have_many(:questions) }
    it { should validate_presence_of :category}
  end

  describe 'class methods' do
    it 'can .get_questions' do
      c1 = Category.create(category:"daily")
      c2 = Category.create(category:"grade")
      q1 = c1.questions.create(question: "Did you eat breakfast?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      q2 = c1.questions.create(question: "How much sleep did you get?", category_id: c1.id, created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      q3 = c2.questions.create(question: "Math Test score?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")

      actual = Category.get_questions
      expect(actual[0].question).to eq("Did you eat breakfast?")
      expect(actual[0].category).to eq("daily")
      expect(actual[1].question).to eq("How much sleep did you get?")
      expect(actual[1].category).to eq("daily")
      expect(actual[2].question).to eq("Math Test score?")
    end
  end

end
