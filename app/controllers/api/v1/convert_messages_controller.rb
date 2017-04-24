class API::V1::ConvertMessagesController < ApplicationController

  def create
    @data = case params[:type]
    when 'yoda'
      ConvertMessage.to_yoda params[:msg]
    when 'valley_girl'
      ConvertMessage.to_valley_girl params[:msg]
    when 'binary_code'
      ConvertMessage.to_binary_code params[:msg]
    end

    render json: @data
  end
end
