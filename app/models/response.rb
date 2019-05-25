class Response < ActiveRecord::Base
  belongs_to :choice
  delegate :question, :to => :choice

  def self.get_responses
    joins(:questions, :choices)
    .select('choices.*')
    .where("responses.choice_type = 'id'")
    # .select('choices.text, choices.correct')
    # .select(:student_id, :question_id)
    # .where("choices.type = 'id' ")
  end
end
# scope :choice_type_id,     -> { where(choice_type: "id")}
# scope :choice_type_text,  -> { where(choice_type: "text")}
#
# scope :choice_type_id_text, -> { union_scope(choice_type_id, choice_type_text) }
