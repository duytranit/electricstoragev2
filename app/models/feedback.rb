class Feedback < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	has_many :replies
end
