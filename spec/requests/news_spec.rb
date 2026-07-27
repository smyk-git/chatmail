require "rails_helper"

RSpec.describe "News", type: :request do
  describe "GET /news" do
    it "renders articles returned by the news service" do
      articles = [
        {
          title: "Ruby 3.4 released",
          text: "The Ruby team shipped a new version.",
          url: "https://example.com/ruby-34",
          published_at: "2025-01-01T10:00:00Z"
        }
      ]
      service = instance_double(NewsApiService, search: articles)
      allow(NewsApiService).to receive(:new).and_return(service)

      get news_index_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Ruby 3.4 released")
    end
  end
end
