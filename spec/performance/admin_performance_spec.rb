require 'spec_helper'

describe "Admin Performance", :type => :feature, :performance => true do
  describe "admin/products" do
    it "is fast"

    it "can create an item, see it, then destroy it"
  end

  describe "admin/orders" do
    it "visits each of the different order pages by status"

    it "can create an order, see it in the list, then destroy it"
  end

end
