class ResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :question_id,
             :course_id,
             :student_id,
             :text_answer,
             :choice_id,
             :answer_type,
             :updated_at,
             :created_at
end
