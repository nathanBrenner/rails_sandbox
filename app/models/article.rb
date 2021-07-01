class Article < ApplicationRecord
	include Visible
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 10 }

	def as_json(options = nil)
		hash = super(:include => [:comments => {:except => [:article_id]}])
		hash.store(:body_text, hash.delete("body"))
		hash[:created_at] = self.created_at.to_time.to_i
		return hash
	end
end
