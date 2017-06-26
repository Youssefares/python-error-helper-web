require 'net/http'
require 'uri'
require 'json'

class ErrorController < ApplicationController
  def index
  end

  def destroy
    @error = Error.find(params[:id])
    @error.destroy

    redirect_to error_list_path
  end

  def help
    #error message from form text area
    @message = params[:error]

    #get error-help from python-error-helper api
    uri = URI("http://python-error-helper.herokuapp.com/error-help")
    response = Net::HTTP.post_form(uri, 'error_message' => @message)

    #get id & help (available to view)
    @id, @help = JSON.parse(response.body).values_at("id", "response")

    #if new uncovered error message, add it to our table.
    if @id == -1
      @uncovered_error = Error.new(message: @message)
      @uncovered_error.save
    end

    #render same page & the view file will take care of rendering new things
    render :file => '../views/error/index.html.erb'
  end

  def list
    @uncovered_errors = Error.all
  end
end
