require 'rails_helper'

RSpec.describe "library/books/show", type: :view do
  before(:each) do
    @library_book = assign(:library_book, Library::Book.create!(
      :name => "Name",
      :author_id => 2,
      :lead => "MyText",
      :is_active => false,
      :aasm_state => "Aasm State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Aasm State/)
  end
end
