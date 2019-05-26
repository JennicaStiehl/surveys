class Response < ActiveRecord::Base
  belongs_to :choice
  delegate :question, :to => :choice
  delegate :question, :to => :answer

  validates_presence_of :question_id
  validates_presence_of :student_id

scope :text, -> { where("answer_type = ?", "text") }

  def self.get_responses#(category)
    self.choice_query.union(self.answer_query)
    # gather_queries.inject(:union)
  end

  private

  def self.gather_queries
    case answer_type
    when :answer then answer_query
    when :choice then choice_query
    end
  end

  def self.answer_query
    joins(answer: :question)
    .select('responses.*, answers.id, answers.answer, questions.*').all
  end

  def self.choice_query
    joins(choice: :question)
    .select('responses.*, choices.id, choices.choice as answer, questions.*').all
  end

  def self.answer_type
    true
  end

end
# scope :choice_type_id,     -> { where(choice_type: "id")}
# scope :choice_type_text,  -> { where(choice_type: "text")}
#
# scope :choice_type_id_text, -> { union_scope(choice_type_id, choice_type_text) }
