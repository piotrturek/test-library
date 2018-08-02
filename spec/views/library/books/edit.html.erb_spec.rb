require 'rails_helper'

RSpec.describe "library/books/edit", type: :view do
  before(:each) do
    @library_book = assign(:library_book, FactoryBot.create(:library_book))
  end

  it "renders the edit library_book form" do
    render

    assert_select "form[action=?][method=?]", library_book_path(@library_book), "post" do

      assert_select "input#library_book_name[name=?]", "library_book[name]"

      assert_select "textarea#library_book_lead[name=?]", "library_book[lead]"

      assert_select "input#library_book_is_active[name=?]", "library_book[is_active]"

    end
  end
end
