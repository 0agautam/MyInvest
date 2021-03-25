module AccountInfoManager
  class HoldingCaller < AllyinvestApplicationService
    include TokenGenerator
    
    def call
      token = generate_token
      holdings ||= token.get("/v1/accounts/#{Rails.application.credentials.ally_uid[:USER_ID]}/holdings.json", {'Accept' => 'application/json'}).body
      holdings_parse = JSON.parse(holdings)
    end
  end
end