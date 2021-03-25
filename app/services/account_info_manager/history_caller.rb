module AccountInfoManager
  class HistoryCaller < AllyinvestApplicationService
    include TokenGenerator

    def call
      token = generate_token
      history ||= token.get("/v1/accounts/#{Rails.application.credentials.ally_uid[:USER_ID]}/history.json", {'Accept' => 'application/json'}).body
      history_parsed = JSON.parse(history)
    end
  end
end