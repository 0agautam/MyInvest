class Ally

  def initialize()
    @CONSUMER_KEY        = Rails.application.credentials.ally[:CONSUMER_KEY]
    @CONSUMER_SECRET     = Rails.application.credentials.ally[:CONSUMER_SECRET]
    @ACCESS_TOKEN        = Rails.application.credentials.ally[:ACCESS_TOKEN]
    @ACCESS_TOKEN_SECRET = Rails.application.credentials.ally[:ACCESS_TOKEN_SECRET]

    @consumer = OAuth::Consumer.new @CONSUMER_KEY, @CONSUMER_SECRET, { :site => 'https://devapi.invest.ally.com' }
  end

  def generate_token
    token = OAuth::AccessToken.new(@consumer, @ACCESS_TOKEN, @ACCESS_TOKEN_SECRET)
  end
end