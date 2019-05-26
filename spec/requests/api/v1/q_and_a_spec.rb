require 'spec_helper'
describe "API q and a calls" do
  it 'q_and_a call has questions and choices' do
    c1 = Category.create(category:"daily")
    q1 = c1.questions.create(question: "Did you eat breakfast?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
    q2 = c1.questions.create(question: "How much sleep did you get?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
    yes = q1.choices.create(choice:"yes", correct:nil)
    no = q1.choices.create(choice:"no", correct:nil)
    yes_2 = q2.choices.create(choice:"yes", correct:nil)
    no_2 = q2.choices.create(choice:"no", correct:nil)
    r1 = Response.create(question_id: q1.id, answer_type: "id", text_answer: nil, choice_id: yes, student_id: 1, course_id: 2)
    r2 = Response.create(question_id: q1.id, answer_type: "id", text_answer: nil, choice_id: yes, student_id: 2, course_id: 2)

    get '/api/v1/q_and_a?question_id=1,2'

    expect(last_response).to be_successful
    parsed = JSON.parse(last_response.body, symbolize_names: true)

    expect(parsed[:data][0][:attributes][:question]).to eq("Did you eat breakfast?")
    expect(parsed[:data][2][:attributes][:question]).to eq("How much sleep did you get?")
    expect(parsed[:data][2][:attributes][:choice]).to eq("no")
    expect(parsed[:data][3][:attributes][:choice]).to eq("yes")
  end
end
