class Category < ActiveRecord::Base
  has_many :questions
  validates_presence_of :category

  def self.get_questions
    joins(:questions)
    .select('categories.*, questions.* ')
  end

end
