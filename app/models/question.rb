class Question < ActiveRecord::Base
  belongs_to :category
  has_many :choices
  has_many :responses, :through => :choice

  def self.get_q_and_a(ids)
    left_outer_join(:choices)
    .select(:id, :question)
    .select('choices.id as choice_id, choices.choice, choices.correct')
    .where("questions.id in (#{ids})")
  end

  def get_choices(id)
    joins(:responses)
    .select('responses.*, question.id')
  end

end
