class ChannelsController < ApplicationController
	before_action :find_channel, only: [:show]

	def index
		channels = current_user.channels
    @messages = channels.order(updated_at: :desc).map(&:messages).map(&:last)
	end

	private

		def find_channel
			@channel = Channel.find(params[:id])
		end

end
