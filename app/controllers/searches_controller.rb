class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def serache
    @range = params[:range]
    
    if @range == "User"
      @users = User.looks(params[:searche], params[:word])
    else
      @books = Book.looks(params[:searche], params[:word])
    end
  end
end
