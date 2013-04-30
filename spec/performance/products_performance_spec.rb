require 'spec_helper'

repetitions = 20

describe "Products Performance", :type => :feature do
  describe "/products" do
    it "loads the products listing" do
      repetitions.times do
        visit '/products'
        expect(page).to have_content('Bobby 0')
      end
    end
  end
end