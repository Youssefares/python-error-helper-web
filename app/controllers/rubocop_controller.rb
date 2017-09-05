class RubocopController < ApplicationController
  skip_before_action :verify_authenticity_token

  def webhook
    byebug
  end
end
