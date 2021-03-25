module TokenGenerator

  def generate_token
    consumer_key        = Rails.application.credentials.ally[:CONSUMER_KEY]
    consumer_secret     = Rails.application.credentials.ally[:CONSUMER_SECRET]
    access_token        = Rails.application.credentials.ally[:ACCESS_TOKEN]
    access_token_secret = Rails.application.credentials.ally[:ACCESS_TOKEN_SECRET]

    consumer = OAuth::Consumer.new consumer_key, consumer_secret, { :site => 'https://devapi.invest.ally.com' }
    token = OAuth::AccessToken.new(consumer, access_token, access_token_secret)
  end
end