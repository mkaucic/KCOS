class Tag < ApplicationRecord
	has_and_belongs_to_many :events
	has_and_belongs_to_many :news_articles

end
