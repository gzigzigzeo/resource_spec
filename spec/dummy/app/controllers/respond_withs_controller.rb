class RespondWithsController < ApplicationController
  def new
    render text: action_name
  end
end
