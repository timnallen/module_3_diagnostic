class SearchController < ApplicationController
  def index
    render 'search/index', locals: {
      facade: SearchResultsFacade.new(params[:q])
    }
  end
end
