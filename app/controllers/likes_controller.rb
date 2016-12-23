class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_message

	def create
		@like = Like.new(:user=>current_user,:message=>@message)
		@like.save
	end

	private
	def find_message
		@message = message.find(params[:message_id])
	end
	
end
