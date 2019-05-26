class QuestionSerializer
include FastJsonapi::ObjectSerializer
  attributes :id,
                  :category,
                  :question


end
