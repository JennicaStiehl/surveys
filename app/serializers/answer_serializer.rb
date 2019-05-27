class AnswerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
                  :question_id,
                  :question,
                  :course_id,
                  :student_id,
                  :joins_table,
                  :answer
end
