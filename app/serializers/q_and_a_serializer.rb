class QandASerializer
include FastJsonapi::ObjectSerializer
attributes :id,
            :choice_id,
            :question,
            :choice,
            :correct,
            :updated_at,
            :created_at
end
