class Question < ActiveRecord::Base
  belongs_to :category
  has_many :choices
  has_many :responses, :through => :choice
  validates_presence_of :question

  def self.get_q_and_a(ids)
    left_outer_joins(:choices)
    .select(:id, :question)
    .select('choices.id as choice_id, choices.choice, choices.correct')
    .where("questions.id in (#{ids})")
  end

end
