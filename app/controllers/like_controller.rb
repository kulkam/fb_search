require 'openssl'
require 'base64'

class LikeController < ApplicationController
  
  def index
    return create
  end

  def create
    @like_page = FacebookUtils.like_from_signed_request(request['signed_request'])
    logger.debug "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    logger.debug @like_page
    @token = FacebookUtils.token_from_signed_request(request['signed_request'])
    @graph = Koala::Facebook::API.new(@token)
    @like_page_a = FacebookUtils.user_like_page(@token, AppConfig.fb_page_a).size
    logger.debug @like_page_a

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @like_page }
      format.json { render json: @like_page_a }
    end

  end
end
