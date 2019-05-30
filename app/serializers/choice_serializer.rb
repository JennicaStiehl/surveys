class ChoiceSerializer
include FastJsonapi::ObjectSerializer
  attributes :id,
             :choice,
             :question_id,
             :updated_at,
             :created_at


end
