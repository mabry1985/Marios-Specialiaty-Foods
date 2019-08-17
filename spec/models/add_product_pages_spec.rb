require 'rails_helper'
describe "the add a product process" do
  it "adds a new product" do
    visit all_products_path
    click 'Add new product'
    fill_in 'Name', :with => 'Ham'
    fill_in 'Cost', :with => 2.93
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Product added to database'
    expect(page).to have_content 'Ham'
  end
end
