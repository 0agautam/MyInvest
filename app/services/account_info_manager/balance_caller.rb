module AccountInfoManager
  class BalanceCaller < AllyinvestApplicationService
    include TokenGenerator

    def call
      token = generate_token
      balance ||= token.get("/v1/accounts/#{Rails.application.credentials.ally_uid[:USER_ID]}/balances.json", {'Accept' => 'application/json'}).body
      balance_parsed = JSON.parse(balance)
    end
  end
end