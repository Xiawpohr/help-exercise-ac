json.array! @messages do |message|
	json.id message.id
	json.status message.status
	json.category_name message.category_name
	json.title message.title
	json.content message.content
	json.created_at message.created_at
	json.updated_at message.updated_at
end
