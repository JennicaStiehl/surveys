require 'spec_helper'

RSpec.describe Question, type: :model do

  describe 'validations' do
    it { should have_many :choices }
    it { should belong_to :category }
    it { should validate_presence_of :question }
  end
  describe 'class methods' do
    it 'can .get_q_and_a' do
      category1 = Category.create(category:"daily")
      category2 = Category.create(category:"grade")
      question1 = category1.questions.create(question: "Did you eat breakfast?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      question2 = category1.questions.create(question: "How much sleep did you get?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      question3 = category2.questions.create(question: "Math Test score?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      yes = question1.choices.create(choice:"yes", correct:nil).id
      no = question1.choices.create(choice:"no", correct:nil).id
      none = question2.choices.create(choice:"none", correct:nil).id
      less = question2.choices.create(choice:"less than usual", correct:nil).id
      usual = question2.choices.create(choice:"usual", correct:nil).id
      more = question2.choices.create(choice:"more than usual", correct:nil).id
      way = question2.choices.create(choice:"way more than usual", correct:nil).id

      actual = Question.get_q_and_a("1,2")
      expect(actual[0].question).to eq("Did you eat breakfast?")
      expect(actual[3].question).to eq("How much sleep did you get?")
      expect(actual[0].choice).to eq("no")
      expect(actual[1].choice).to eq("yes")
      expect(actual[3].choice).to eq("more than usual")
    end
  end
end
