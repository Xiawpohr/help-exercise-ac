class Api::V1::MessagesController < Api::V1::BaseController
	def index
		@messages = Message.all
	end
end
