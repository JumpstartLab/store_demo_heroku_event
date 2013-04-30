module StoreConfig
  def self.development_url
    "http://localhost:3000"
  end

  def self.production_url
    "http://something.heroku.com"
  end
end