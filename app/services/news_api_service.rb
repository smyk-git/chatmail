class NewsApiService

  def initialize(api_key: ENV["WORLDNEWS_API_KEY"])
    @api_key = api_key
  end

  def search(query:, language: "en", limit: 10)
    response = HTTParty.get(
      "https://api.worldnewsapi.com/search-news",
      query: {
        "api-key": @api_key,
        text: query,
        language: language,
        number: limit
      }
    )

    return [] unless response.success?

    articles = response.parsed_response["news"] || []

    articles.map do |article|
      {
        title: article["title"],
        text: article["text"],
        url: article["url"],
        published_at: article["publish_date"],
      }
    end
  end

end