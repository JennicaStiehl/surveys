class ResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
                  :question_id,
                  :course_id,
                  :student_id,
                  :joins_id,
                  :joins_table,
                  :question,
                  :choice,
                  :correct
end
