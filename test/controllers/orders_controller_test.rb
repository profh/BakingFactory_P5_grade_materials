require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_all
  end

  teardown do
    destroy_customer_users
    puts "Destroy customer users"
    destroy_employee_users
    puts "Destroy employee users"
    destroy_items
    puts "Destroy items -- all types"
    destroy_item_prices
    puts "Destroy prices for all items"
    destroy_customers
    puts "Destroy customers"
    destroy_addresses
    puts "Destroy addresses for customers"
    destroy_orders
    puts "Destroy orders"
    destroy_order_items
    puts "Destroy order items"
  end

  test "should get index" do

    get api_orders_url, as: :json
    assert_response :success
    assert_equal(7, response.parsed_body.size)

    # change record first_name and observe change
    @alexe.first_name = "Alec"
    @alexe.save!
    alexe_o1 = {"id"=>1, "date"=>@alexe_o1.date.to_s, "grandTotal"=>5.25, "customerName"=>"Egan, Alec", "itemCount"=>1}

    get api_orders_url, as: :json
    assert_response :success
    assert_equal(alexe_o1, response.parsed_body.find{|order| order["id"] == 1})
  end

  test "should show order" do
    expected_body = {
      "id" => 1, "date" => @alexe_o1.date.to_s, "grandTotal" => 5.25, "customer" => {
        "id" => 1, "first_name" => "Alex", "last_name" => "Egan", "email" => @alexe.email, "phone" => @alexe.phone, "user_id" => 1, "active" => true
      }, "address" => {
        "id" => 5, "customer_id" => 1, "is_billing" => false, "recipient" => "Jeff Egan", "street_1" => "4000 Forbes Ave", "street_2" => nil, "city" => "Pittsburgh", "state" => "PA", "zip" => "15212", "active" => true
      }, "items" => [{
        "id" => 1,
        "name" => "Honey Wheat Bread",
        "description" => "Our original bread made with stone ground flour, clover honey and a lot of love. This versatile bread is great for toast, sandwiches, formal dinners and just when you need to munch.",
        "category" => "bread",
        "units_per_item" => 1,
        "weight" => 1.0,
        "active" => true
      }]
    }

    get api_order_url(@alexe_o1), as: :json
    assert_response :success
    assert_equal(expected_body, response.parsed_body)

    # change record first_name and observe change
    @alexe.first_name = "Alec"
    @alexe.save!
    expected_body["customer"]["first_name"] = @alexe.first_name

    get api_order_url(@alexe_o1), as: :json
    assert_response :success
    assert_equal(expected_body, response.parsed_body)
  end
end
