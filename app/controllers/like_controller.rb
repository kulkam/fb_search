require 'openssl'
require 'base64'

class LikeController < ApplicationController
  
  def index
    @signed_request = request['signed_request'].split('.', 2)
    @encoded_sig, @main_data = @signed_request
    @data = MultiJson.decode(base64_url_decode(@main_data))
    @like_page = (@data["page"])?@data["page"]["liked"]:false
    logger.debug "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    logger.debug @like_page
    #@data = ActiveSupport::JSON.decode(Base64::decode64(@payload), true);
    @graph = Koala::Facebook::API.new(@data["oauth_token"])
    @like_page_a = @graph.get_connections("me", "likes/142723355839336").size
    logger.debug @like_page_a

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @like_page }
      format.json { render json: @like_page_a }
    end
  end

  def base64_url_decode(str)
    str += '=' * (4 - str.length.modulo(4))
    Base64.decode64(str.tr('-_','+/'))
  end

  def create
    @signed_request = request['signed_request'].split('.', 2)
    @encoded_sig, @main_data = @signed_request
    @data = MultiJson.decode(base64_url_decode(@main_data))
    @like_page = (@data["page"])?@data["page"]["liked"]:false
    logger.debug "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    logger.debug @like_page
    #@data = ActiveSupport::JSON.decode(Base64::decode64(@payload), true);
    @graph = Koala::Facebook::API.new(@data["oauth_token"])
    @like_page_a = @graph.get_connections("me", "likes/142723355839336").size
    logger.debug @like_page_a

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @like_page }
      format.json { render json: @like_page_a }
    end

  end
end
