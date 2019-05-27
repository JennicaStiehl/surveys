class Response < ActiveRecord::Base
  belongs_to :choice
  delegate :question, :to => :choice, :allow_nil => true

  validates_presence_of :question_id
  validates_presence_of :student_id


  private

  def self.all_responses
    find_by_sql("select * from responses left outer join choices on responses.choice_id = choices.id inner join questions on responses.question_id = questions.id")
  end

  def self.answer_query
    find_by_sql("select * from responses inner join questions on responses.question_id = questions.id where responses.answer_type = 'text' ")
  end

  def self.choice_query
    find_by_sql("select * from responses left outer join choices on responses.choice_id = choices.id inner join questions on responses.question_id = questions.id where responses.answer_type = 'id' ")
  end

end
