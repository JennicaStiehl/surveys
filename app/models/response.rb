class Response < ActiveRecord::Base
  belongs_to :choice
  has_many :answers
  delegate :question, :to => :choice, :allow_nil => true

  validates_presence_of :question_id
  validates_presence_of :student_id

  # def self.get_responses#(category)
  #   self.choice_query.union(self.answer_query)
  #   # gather_queries.inject(:union)
  # end

  private

  def self.answer_query
    find_by_sql("select * from responses inner join answers on responses.id = answers.response_id inner join questions on responses.question_id = questions.id where responses.answer_type = 'text'")
  end
    # joins(answer: :question)
    # .select('responses.*, answers.*, questions.*')
    # .where(answer_type: "text")


  def self.choice_query
    left_outer_joins(choice: :question)
    .select('responses.*, choices.id, choices.choice as answer, questions.*')
    .where(answer_type: "id")
  end
end
