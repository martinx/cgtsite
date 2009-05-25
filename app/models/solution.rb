class Solution < ActiveRecord::Base
  belongs_to :solution_type
  acts_as_ferret :field => [:so_content,:so_title]
end
