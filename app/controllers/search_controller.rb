class SearchController < ApplicationController
  def index
    @graph = Koala::Facebook::API.new 
    @search_res = @graph.search("Musierowicz")

    @search_res2 = FbGraph::Searchable.search("Musierowicz")

    @client = FBGraph::Client.new(:client_id => '190421454385080',:secret_id =>'d3385ec70dcc1b07b4b425f4865d74e9')
    @search_res3 = @client.search.query('Musierowicz').info!
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @search_res }
      format.json { render json: @search_res2 }
      format.json { render json: @search_res3 }
    end
  end
end
