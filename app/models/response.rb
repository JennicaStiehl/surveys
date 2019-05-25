class Response < ActiveRecord::Base
  belongs_to :choice
  delegate :question, :to => :choice

  validates_presence_of :question_id
  validates_presence_of :student_id

  def self.get_responses#(category)
    Response.joins(choice: :question)
    # .where('questions.category_id=#{category.id}')
  end
end
# scope :choice_type_id,     -> { where(choice_type: "id")}
# scope :choice_type_text,  -> { where(choice_type: "text")}
#
# scope :choice_type_id_text, -> { union_scope(choice_type_id, choice_type_text) }
