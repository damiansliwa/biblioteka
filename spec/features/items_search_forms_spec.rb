require 'rails_helper'

RSpec.feature "ItemsSearchForms", type: :feature do
  
  context "when search" do
  	before do
  	  item = Item.create!(name: "BookName", author: "BookAuthor")
  	end

  	it "shows the 'Searching results' header" do
  	  visit '/items'
  	  fill_in 'search', with: 'Lorem ipsum'
  	  click_on 'Search'
  	  expect(page).to have_content('Searching results:')
  	end

  	it "search items by its name" do
  	  visit '/items'
  	  fill_in 'search', with: 'BookName'
  	  click_on 'Search'
  	  expect(page).to have_content('Searching results:')
      expect(page).to have_content('BookName')
  	end

  	it "search items by its author" do
  	  visit '/items'
  	  fill_in 'search', with: 'BookAuthor'
  	  click_on 'Search'
  	  expect(page).to have_content('Searching results:')
      expect(page).to have_content('BookAuthor')
  	end
  end
end
