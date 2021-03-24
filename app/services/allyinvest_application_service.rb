class AllyinvestApplicationService < ApplicationService

  def self.call(*args, &block)
    new(*args, &block).call
  end
  
  def initialize()
    @CONSUMER_KEY        = Rails.application.credentials.ally[:CONSUMER_KEY]
    @CONSUMER_SECRET     = Rails.application.credentials.ally[:CONSUMER_SECRET]
    @ACCESS_TOKEN        = Rails.application.credentials.ally[:ACCESS_TOKEN]
    @ACCESS_TOKEN_SECRET = Rails.application.credentials.ally[:ACCESS_TOKEN_SECRET]

    @consumer = OAuth::Consumer.new @CONSUMER_KEY, @CONSUMER_SECRET, { :site => 'https://devapi.invest.ally.com' }
  end
end
