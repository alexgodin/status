class UpdatesController < ApplicationController
  before_filter :verified_request?
  def create
    Update.create_from_postmark request.body
  end
  def verified_request?
    if request.content_type == "application/json"
      true
    else
      super()
    end
  end
end
