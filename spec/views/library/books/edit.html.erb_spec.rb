require 'rails_helper'

RSpec.describe "library/books/edit", type: :view do
  before(:each) do
    @library_book = assign(:library_book, Library::Book.create!(
      :name => "MyString",
      :author_id => 1,
      :lead => "MyText",
      :is_active => false,
      :aasm_state => "MyString"
    ))
  end

  it "renders the edit library_book form" do
    render

    assert_select "form[action=?][method=?]", library_book_path(@library_book), "post" do

      assert_select "input#library_book_name[name=?]", "library_book[name]"

      assert_select "input#library_book_author_id[name=?]", "library_book[author_id]"

      assert_select "textarea#library_book_lead[name=?]", "library_book[lead]"

      assert_select "input#library_book_is_active[name=?]", "library_book[is_active]"

      assert_select "input#library_book_aasm_state[name=?]", "library_book[aasm_state]"
    end
  end
end
