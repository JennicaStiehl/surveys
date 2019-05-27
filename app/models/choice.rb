class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :response
end
