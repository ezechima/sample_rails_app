class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
  	render html: "YO What's up world"
  end

end
