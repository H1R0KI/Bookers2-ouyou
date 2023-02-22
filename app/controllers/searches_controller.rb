class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]

    if @model == 'user'
      @users = User.search_for(@content, @method)
      render "/searches/search_result"
    else
      @books = Book.search_for(@content, @method)
      render "/searches/search_result"
    end
  end

end