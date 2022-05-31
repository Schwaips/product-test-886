require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    # setup
    # nop nothing.

    # exercice
    visit root_url # "/"

    # verify
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
    # teadown
  end

  test "a signed in user can create a new product" do
    # setup
    login_as users(:george)

    # exercice
    visit "/products/new"
    # save_and_open_screenshot

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Create Product'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    # verify
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"
  end
end
