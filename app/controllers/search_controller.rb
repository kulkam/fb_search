class SearchController < ApplicationController
  def index
    @graph = Koala::Facebook::API.new 
    @search_res = @graph.search("Musierowicz")
    logger.debug "*********************************"
    logger.debug @search_res
    #render :json => @search_res
    #binding.pry search_res
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @search_res }
    end
  end
end
