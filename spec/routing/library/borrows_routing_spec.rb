require "rails_helper"

RSpec.describe Library::BorrowsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/library/borrows").to route_to("library/borrows#index")
    end

  end
end
