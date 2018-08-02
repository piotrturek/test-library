require 'rails_helper'

RSpec.describe "library/borrows/index", type: :view do
  before(:each) do
    @library_borrows = assign(:library_borrows, FactoryBot.create_list(:library_borrow,3))
    allow(view).to receive_messages(:will_paginate => @library_borrows)
  end

  it "renders a list of library/borrows" do
    render
    assert_select "tr>td", :text => 'Testowy User', :count => 3
  end
end
