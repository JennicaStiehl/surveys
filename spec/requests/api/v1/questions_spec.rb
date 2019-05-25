require 'spec_helper'
RSpec.describe "question API" do
  describe "delivers question info" do
    it 'and has id, text' do
      c1 = Category.create(category:"daily")
      q1 = Question.create(question: "Did you eat breakfast?", category_id: 1, created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      q2 = Question.create(question: "How much sleep did you get?", category_id: 1, created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      yes = Choice.create(question_id: 1, choice:"yes", correct:nil)
      no = Choice.create(question_id: 1, choice:"no", correct:nil)

      visit '/api/v1/questions'


      expect(response).to be_successful

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed.first[:id]).to eq(q1.id)
      expect(parsed.first[:questions].first[:id]).to eq(q1.id)
      expect(parsed.first[:questions].last[:id]).to eq(q2.id)
      expect(parsed.last[:id]).to eq(yes.id)
      expect(parsed.last[:questions].first[:id]).to eq(q3.id)
      expect(parsed.last[:questions].last[:id]).to eq(q4.id)
    end
  end
end
