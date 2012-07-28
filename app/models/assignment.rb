class Assignment < ActiveRecord::Base
  has_many :submitted_works
  has_many :users, :through => :submitted_works

  attr_accessible :description, :title
end
