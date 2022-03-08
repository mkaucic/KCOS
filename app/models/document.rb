class Document < ApplicationRecord
	mount_uploader :link, DocumentUploader
	
end
