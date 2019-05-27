require 'spec_helper'

RSpec.describe Response, type: :model do
  describe 'validations' do
    it { should belong_to(:choice) }
    it { should validate_presence_of :question_id}
    it { should validate_presence_of :student_id}
  end

  describe 'class methods' do

    it 'can get .all_responses' do
      category1 = Category.create(category:"daily")
      question1 = category1.questions.create(question: "Did you eat breakfast?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      question2 = category1.questions.create(question: "How much sleep did you get?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      yes = question1.choices.create(choice:"yes", correct:nil).id
      no = question1.choices.create(choice:"no", correct:nil).id
      none = question2.choices.create(choice:"none", correct:nil).id
      less = question2.choices.create(choice:"less than usual", correct:nil).id
      response1 = Response.create(question_id: question1.id, answer_type: "id", text_answer: nil, choice_id: yes, student_id: 1, course_id: 2)
      response2 = Response.create(question_id: question1.id, answer_type: "id", text_answer: nil, choice_id: yes, student_id: 2, course_id: 2)
      response3 = Response.create(question_id: question2.id, answer_type: "id", text_answer: nil, choice_id: none, student_id: 2, course_id: 2)

      actual_count = Response.all.count
      actual = Response.all_responses
      expect(actual.count).to eq(actual.count)
      expect(actual[0].question_id).to eq(response1.question_id)
      expect(actual[0].course_id).to eq(response1.course_id)
      expect(actual[0].answer_type).to eq("id")
      expect(actual[0].student_id).to eq("2")
    end
    it 'can get .answer_query' do
      category1 = Category.create(category:"daily")
      category2 = Category.create(category:"grade")
      question1 = category1.questions.create(question: "Did you eat breakfast?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      question3 = category2.questions.create(question: "Math Test score?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      yes = question1.choices.create(choice:"yes", correct:nil).id
      no = question1.choices.create(choice:"no", correct:nil).id
      response1 = Response.create(question_id: question1.id, answer_type: "id", text_answer: nil, choice_id: yes, student_id: 1, course_id: 2)
      response2 = Response.create(question_id: question1.id, answer_type: "id", text_answer: nil, choice_id: yes, student_id: 2, course_id: 2)
      response9 = Response.create(question_id: question3.id, answer_type: "text", text_answer: "89", student_id: 6, course_id: 2)
      response10 = Response.create(question_id: question3.id, answer_type: "text", text_answer: "71", student_id: 7, course_id: 2)

      actual_count = Response.all.count
      actual = Response.answer_query
      expect(actual.count).to eq(actual.count)
      expect(actual[0].question_id).to_not eq(response1.question_id)
      expect(actual[0].answer_type).to_not eq("id")
      expect(actual[0].student_id).to_not eq("1")
      expect(actual[1].question_id).to eq(response9.question_id)
      expect(actual[1].course_id).to eq(response9.course_id)
      expect(actual[1].answer_type).to eq("text")
      expect(actual[1].student_id).to eq("7")
    end
    it 'can get .choice_query' do
      category1 = Category.create(category:"daily")
      question1 = category1.questions.create(question: "Did you eat breakfast?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      question2 = category1.questions.create(question: "How much sleep did you get?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
      yes = question1.choices.create(choice:"yes", correct:nil).id
      no = question1.choices.create(choice:"no", correct:nil).id
      none = question2.choices.create(choice:"none", correct:nil).id
      less = question2.choices.create(choice:"less than usual", correct:nil).id
      response1 = Response.create(question_id: question1.id, answer_type: "id", text_answer: nil, choice_id: yes, student_id: 1, course_id: 2)
      response2 = Response.create(question_id: question1.id, answer_type: "id", text_answer: nil, choice_id: yes, student_id: 2, course_id: 2)
      response3 = Response.create(question_id: question2.id, answer_type: "id", text_answer: nil, choice_id: none, student_id: 2, course_id: 2)

      actual_count = Response.all.count
      actual = Response.choice_query
      expect(actual.count).to eq(actual.count)
      expect(actual[0].question_id).to eq(response1.question_id)
      expect(actual[0].course_id).to eq(response1.course_id)
      expect(actual[0].answer_type).to eq("id")
      expect(actual[0].student_id).to eq("2")
    end
  end
end
