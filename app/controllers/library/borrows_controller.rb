class Library::BorrowsController < ApplicationController

  # GET /library/borrows
  # GET /library/borrows.json
  def index
    @library_borrows = Library::Borrow.all.paginate(:page => params[:page], :per_page => 10)
  end

end
