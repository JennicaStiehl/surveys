class QuestionSerializer
include FastJsonapi::ObjectSerializer
  attributes :id,
                  :category,
                  :question,
                  :updated_at,
                  :created_at


end
