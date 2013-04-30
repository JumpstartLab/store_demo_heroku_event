require 'spec_helper'

repetitions = 20

describe "Products Performance", :type => :feature do
  describe "/products" do
    it "loads the products listing" do
      repetitions.times do
        visit '/products'
        # Page 1 is Visible
        expect(page).to have_content('Bobby 0')
        expect(page).to have_content('The Great Fairy 1')
        
        # Other pages are not visible
        expect(page).to_not have_content('The Great Slump 1')
        expect(page).to_not have_content('Ruby 2')
      end
    end
  end
end