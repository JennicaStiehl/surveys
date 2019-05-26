require 'spec_helper'
describe "API question calls" do
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

    expect(parsed[:data][0][:attributes][:category]).to eq("daily")
    expect(parsed[:data][0][:attributes][:question]).to eq("Did you eat breakfast?")
    expect(parsed[:data][1][:attributes][:category]).to eq("daily")
    expect(parsed[:data][1][:attributes][:question]).to eq("How much sleep did you get?")

  end

end
