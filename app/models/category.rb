class Category < ActiveRecord::Base
  has_many :questions
  validates_presence_of :category
end
