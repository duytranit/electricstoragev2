class Attachment < ActiveRecord::Base
	belongs_to :project

	has_attached_file :file
	validates_attachment :file, content_type: {:content_type => ['application/pdf', 'text/plain',
		'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']}
end
