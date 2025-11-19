class NewsController < ApplicationController
  def index
    @articles = NewsApiService.new.search(query: params[:q].presence || "technology", limit: 10, language: "pl")
  end
end