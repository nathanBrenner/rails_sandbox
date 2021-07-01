json.array! @articles do |article|
	json.id article.id
	json.title article.title
	json.status article.status
	json.create_at article.created_at
	json.updated_at article.updated_at
	json.comments article.comments do | comment |
		json.partial! 'comments/comment', comment: comment
	end
end