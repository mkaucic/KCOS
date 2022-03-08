class Link < ApplicationRecord
	before_update :ext_link
	before_create :ext_link
	validates :link, presence: true

	mount_uploader :favicon, ImageUploader

	def ext_link
		if self.link[0..7] == "https://"
			return
		end

		if self.link[0..6] == "http://"
			return
		end

		self.link.prepend("http://")
	end
end
