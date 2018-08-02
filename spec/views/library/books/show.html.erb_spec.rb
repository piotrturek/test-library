require 'rails_helper'

RSpec.describe "library/books/show", type: :view do
  before(:each) do
    @library_book = assign(:library_book, FactoryBot.create(:library_book))
    allow(view).to receive_messages(:current_user => FactoryBot.create(:user) )
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/Book title/)
  end
end
