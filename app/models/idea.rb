class Idea < ActiveRecord::Base
  has_many :comment
  belongs_to :idea_type
end
