require "rails_helper"

RSpec.describe Library::BooksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/library/books").to route_to("library/books#index")
    end

    it "routes to #new" do
      expect(:get => "/library/books/new").to route_to("library/books#new")
    end

    it "routes to #show" do
      expect(:get => "/library/books/1").to route_to("library/books#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/library/books/1/edit").to route_to("library/books#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/library/books").to route_to("library/books#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/library/books/1").to route_to("library/books#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/library/books/1").to route_to("library/books#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/library/books/1").to route_to("library/books#destroy", :id => "1")
    end

  end
end
