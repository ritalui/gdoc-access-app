class SubmittedWork < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment

  attr_accessible :assignment_id, :file_name, :file_text, :provider, :review_comments, :reviewer_id, :submitted_link, :user_id
end
