class ChatsController < ApplicationController
before_action :authenticate_user!

def show
  render :index
end

end
