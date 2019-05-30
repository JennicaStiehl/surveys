category1 = Category.create(category:"daily")
category2 = Category.create(category:"grade")
question1 = category1.questions.create(question: "Did you eat breakfast?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
question2 = category1.questions.create(question: "How much sleep did you get?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
question3 = category2.questions.create(question: "Math Test score?", created_at: "2019-05-23 13:31:38 UTC", updated_at: "2019-05-23 13:31:38 UTC")
yes = question1.choices.create(choice:"yes", correct:nil)
no = question1.choices.create(choice:"no", correct:nil)
none = question2.choices.create(choice:"none", correct:nil)
less = question2.choices.create(choice:"less than usual", correct:nil)
usual = question2.choices.create(choice:"usual", correct:nil)
more = question2.choices.create(choice:"more than usual", correct:nil)
way = question2.choices.create(choice:"way more than usual", correct:nil)
# response1 = Response.create(question_id: question1.id, answer_type: "id", text_answer: nil, choice_id: yes, student_id: 1, course_id: 2)
# response2 = Response.create(question_id: question1.id, answer_type: "id", text_answer: nil, choice_id: yes, student_id: 2, course_id: 2)
# response3 = Response.create(question_id: question2.id, answer_type: "id", text_answer: nil, choice_id: none, student_id: 2, course_id: 2)
# response4 = Response.create(question_id: question2.id, answer_type: "id", text_answer: nil, choice_id: less, student_id: 3, course_id: 2)
# response5 = Response.create(question_id: question2.id, answer_type: "id", text_answer: nil, choice_id: usual, student_id: 1, course_id: 2)
# response6 = Response.create(question_id: question2.id, answer_type: "id", text_answer: nil, choice_id: more, student_id: 4, course_id: 2)
# response7 = Response.create(question_id: question2.id, answer_type: "id", text_answer: nil, choice_id: way, student_id: 5, course_id: 2)
# response8 = Response.create(question_id: question2.id, answer_type: "id", text_answer: nil, choice_id: less, student_id: 6, course_id: 2)
# response9 = Response.create(question_id: question3.id, answer_type: "text", text_answer: "89", student_id: 6, course_id: 2)
# response10 = Response.create(question_id: question3.id, answer_type: "text", text_answer: "71", student_id: 7, course_id: 2)

options_hash = {col_sep: ",", headers: true,
  header_converters: :symbol, converters: :numeric}

responses = CSV.open('./db/data/responses.csv', options_hash)

responses.each do |row|
  hash = row.to_hash

  creation = hash.delete(:days_ago).days.ago.to_datetime

  Response.create(
    **hash, created_at: creation, updated_at: creation
  )
end
