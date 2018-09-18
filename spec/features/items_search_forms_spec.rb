require 'rails_helper'

RSpec.feature "ItemsSearchForms", type: :feature do
  
  context "when search" do
  	before do
  	  item1 = Item.create!(name: "BookName1", author: "BookAuthor1")
  	  item2 = Item.create!(name: "BookName2", author: "BookAuthor2")
  	end

  	it "shows the 'Searching results' header" do
  	  visit '/items'
  	  fill_in 'search', with: 'Lorem ipsum'
  	  click_button 'Search'
  	  expect(page).to have_content('Searching results:')
  	end

  	it "search items by item name" do
  	  visit '/items'
  	  fill_in 'search', with: 'BookName1'
  	  click_button 'Search'
  	  expect(page).to have_content('Searching results:')
      expect(page).to have_content('BookName1')
      expect(page).to_not have_content('BookName2')
  	end

  	it "search items by item author" do
  	  visit '/items'
  	  fill_in 'search', with: 'BookAuthor1'
  	  click_button 'Search'
  	  expect(page).to have_content('Searching results:')
      expect(page).to have_content('BookAuthor1')
      expect(page).to_not have_content('BookAuthor2')
  	end
  end
end
