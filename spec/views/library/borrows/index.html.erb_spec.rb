require 'rails_helper'

RSpec.describe "library/borrows/index", type: :view do
  before(:each) do
    assign(:library_borrows, [
      Library::Borrow.create!(
        :book_id => 2,
        :user_id => 3
      ),
      Library::Borrow.create!(
        :book_id => 2,
        :user_id => 3
      )
    ])
  end

  it "renders a list of library/borrows" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
