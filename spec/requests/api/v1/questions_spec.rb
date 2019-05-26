require 'spec_helper'
describe "API calls" do
  it 'questions call has question id, question text' do
    c1 = Category.create(category:"daily")
    q1 = c1.questions.create(question: "Did you eat breakfast?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
    q2 = c1.questions.create(question: "How much sleep did you get?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
    yes = q1.choices.create(choice:"yes", correct:nil).id
    no = q1.choices.create(choice:"no", correct:nil).id
    none = q2.choices.create(choice:"none", correct:nil).id
    less = q2.choices.create(choice:"less than usual", correct:nil).id
    usual = q2.choices.create(choice:"usual", correct:nil).id
    more = q2.choices.create(choice:"more than usual", correct:nil).id
    way = q2.choices.create(choice:"way more than usual", correct:nil).id

    get '/api/v1/questions'

    expect(last_response).to be_successful
    parsed = JSON.parse(last_response.body, symbolize_names: true)

    expect(parsed.first[:id]).to eq(q1.id)
    expect(parsed.first[:question]).to eq(q1.question)
    expect(parsed.last[:question]).to eq(q2.question)
    expect(parsed.last[:category_id]).to eq(q2.category_id)
    expect(parsed.first[:category_id]).to eq(q1.category_id)
  end
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
    expect(parsed[0][:choice]).to eq(no.choice)
    expect(parsed[1][:choice]).to eq(yes.choice)
  end
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
