require 'spec_helper'
describe "API response calls" do

  it 'can get responses API and has all the ids' do
    c1 = Category.create(category:"daily")
    q1 = c1.questions.create(question: "Did you eat breakfast?", category_id: c1.id, created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
    yes = q1.choices.create(choice:"yes", correct:nil)
    no = q1.choices.create(choice:"no", correct:nil)
    r1 = Response.create(question_id: q1.id, answer_type: "id", text_answer: nil, choice_id: yes.id, student_id: 1, course_id: 2)
    r2 = Response.create(question_id: q1.id, answer_type: "id", text_answer: nil, choice_id: yes.id, student_id: 2, course_id: 2)

    get '/api/v1/responses'

    expect(last_response).to be_successful
    parsed = JSON.parse(last_response.body, symbolize_names: true)

    expect(parsed[:data][0][:attributes][:question_id]).to eq(1)
    expect(parsed[:data][0][:attributes][:student_id]).to eq("1")
    expect(parsed[:data][0][:attributes][:course_id]).to eq(2)
    expect(parsed[:data][0][:attributes][:text_answer]).to eq(nil)
    expect(parsed[:data][1][:attributes][:question_id]).to eq(1)
    expect(parsed[:data][1][:attributes][:student_id]).to eq("2")
    expect(parsed[:data][1][:attributes][:course_id]).to eq(2)
    expect(parsed[:data][1][:attributes][:text_answer]).to eq(nil)
  end
  it 'can create a response' do
    c1 = Category.create(category:"daily")
    q1 = c1.questions.create(question: "Did you eat breakfast?", category_id: c1.id, created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
    yes = q1.choices.create(choice:"yes", correct:nil)
    no = q1.choices.create(choice:"no", correct:nil)

    post "/api/v1/responses",
        data: {
                      question_id: q1.id,
                      choice_id: yes.id,
                      student_id: 3,
                      course_id: 4,
                      answer_type: "id",
                      text_answer: "nil" }

    parsed = JSON.parse(last_response.body, symbolize_names: true)
    expect(parsed[:message]).to eq("response successfully created")
    actual = Response.last
    expect(actual.question_id).to eq(q1.id)
    expect(actual.choice_id).to eq(yes.id)
    expect(actual.student_id).to eq("3")
    expect(actual.course_id).to eq(4)
    expect(actual.answer_type).to eq("id")
    expect(actual.text_answer).to eq("nil")
  end
end
