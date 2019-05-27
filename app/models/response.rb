class Response < ActiveRecord::Base
  belongs_to :choice
  has_many :answers
  delegate :question, :to => :choice, :allow_nil => true

  validates_presence_of :question_id
  validates_presence_of :student_id

  private

  def self.answer_query
    find_by_sql("select * from responses inner join answers on responses.joins_id = answers.id inner join questions on responses.question_id = questions.id where responses.joins_table = 'answer'")
  end

  def self.choice_query
    joins('inner join choices on responses.joins_id = choices.id inner join questions on responses.question_id = questions.id')
    .select('responses.*, choices.*, questions.*')
    .where(joins_table: 'choice')
    # find_by_sql("select * from responses inner join choices on responses.joins_id = choices.id inner join questions on responses.question_id = questions.id where responses.joins_table = 'choice'")
  end
end
