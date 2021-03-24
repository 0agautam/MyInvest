module AccountInfoManager
  class BalanceCaller < AllyinvestApplicationService
    def initialize()
      super()
    end

    def call
      token = OAuth::AccessToken.new(@consumer, @ACCESS_TOKEN, @ACCESS_TOKEN_SECRET)
    end
  end
end