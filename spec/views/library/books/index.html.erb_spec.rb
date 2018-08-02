require 'rails_helper'

RSpec.describe "library/books/index", type: :view do
  before(:each) do
    @library_books = assign(:library_books, FactoryBot.create_list(:library_book,3))
    allow(view).to receive_messages(:will_paginate => @library_books)
    allow(view).to receive_messages(:current_user => FactoryBot.create(:user) )
  end

  it "renders a list of library/books" do
    render
    assert_select "tr>td", :text => "Book title".to_s, :count => 3
  end
end
