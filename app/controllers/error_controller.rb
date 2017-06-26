require 'net/http'
require 'uri'
require 'json'

class ErrorController < ApplicationController
  def index
  end

  def help
    #error message from form text area
    @message = params[:error]

    #get error-help from python-error-helper api
    uri = URI("http://python-error-helper.herokuapp.com/error-help")
    response = Net::HTTP.post_form(uri, 'error_message' => @message)

    #get id & help (available to view)
    @id, @help = JSON.parse(response.body).values_at("id", "response")

    # #if new uncovered error message, add it to our table.
    # if @id == 1{
    #
    # }
    render :file => '../views/error/index.html.erb'
  end
end
