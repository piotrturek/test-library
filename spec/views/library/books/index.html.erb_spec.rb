require 'rails_helper'

RSpec.describe "library/books/index", type: :view do
  before(:each) do
    assign(:library_books, [
      Library::Book.create!(
        :name => "Name",
        :author_id => 2,
        :lead => "MyText",
        :is_active => false,
        :aasm_state => "Aasm State"
      ),
      Library::Book.create!(
        :name => "Name",
        :author_id => 2,
        :lead => "MyText",
        :is_active => false,
        :aasm_state => "Aasm State"
      )
    ])
  end

  it "renders a list of library/books" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Aasm State".to_s, :count => 2
  end
end
