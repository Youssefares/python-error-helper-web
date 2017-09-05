class RubocopController < ApplicationController
  skip_before_action :verify_authenticity_token

  def webhook
    begin
      response = RestClient.post(
        "https://api.github.com/repos/Youssefares/python-error-helper-web/statuses/#{params[:sha]}",
        { 'state': 'success' }.to_json,
        {content_type: :json, accept: 'application/vnd.github.v3+json'}
      )
    rescue RestClient::ExceptionWithResponse => e
      byebug
    end
  end
end
