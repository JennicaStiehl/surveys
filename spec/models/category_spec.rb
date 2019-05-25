require 'spec_helper'

RSpec.describe Category, type: :model do
  before :each do
    c1 = Category.create(category:"daily")
    c2 = Category.create(category:"grade")
    q1 = c1.questions.create(question: "Did you eat breakfast?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
    q3 = c2.questions.create(question: "Math Test score?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
    q2 = c1.questions.create(question: "How much sleep did you get?", category_id: c1.id, created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
    yes = q1.choices.create(choice:"yes", correct:nil).id
    no = q1.choices.create(choice:"no", correct:nil).id
    none = q2.choices.create(choice:"none", correct:nil).id
    less = q2.choices.create(choice:"less than usual", correct:nil).id
    usual = q2.choices.create(choice:"usual", correct:nil).id
    more = q2.choices.create(choice:"more than usual", correct:nil).id
    way = q2.choices.create(choice:"way more than usual", correct:nil).id
    r1 = Response.create(answer_type: "id", text_answer: nil, choice_id: yes, student_id: 1, course_id: 2)
    r2 = Response.create(answer_type: "id", text_answer: nil, choice_id: yes, student_id: 2, course_id: 2)
    r3 = Response.create(answer_type: "id", text_answer: nil, choice_id: none, student_id: 2, course_id: 2)
    r4 = Response.create(answer_type: "id", text_answer: nil, choice_id: less, student_id: 3, course_id: 2)
    r5 = Response.create(answer_type: "id", text_answer: nil, choice_id: usual, student_id: 1, course_id: 2)
    r6 = Response.create(answer_type: "id", text_answer: nil, choice_id: more, student_id: 4, course_id: 2)
    r7 = Response.create(answer_type: "id", text_answer: nil, choice_id: way, student_id: 5, course_id: 2)
    r8 = Response.create(answer_type: "id", text_answer: nil, choice_id: less, student_id: 6, course_id: 2)

  end
  describe 'validations' do

    it { should have_many(:questions) }
    it { should validate_presence_of :category}
  end

end
