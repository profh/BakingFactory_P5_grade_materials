require 'test_helper'

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_customer_users
    create_customers
    create_addresses
  end

  teardown do
    destroy_customer_users
    destroy_customers
    destroy_addresses
  end

  test "should get index" do
    expected_body = [{
      "id" => 3, "lastName" => "Corletti", "firstName" => "Anthony", "phone" => @anthony.phone, "email" => @anthony.email, "addresses" => [{
        "id" => 3,
        "street1" => "5000 Forbes Avenue",
        "street2" => nil,
        "city" => "Pittsburgh",
        "state" => "PA",
        "zip" => "15213"
      }]
    }, {
      "id" => 1, "lastName" => "Egan", "firstName" => "Alex", "phone" => @alexe.phone, "email" => @alexe.email, "addresses" => [{
        "id" => 1,
        "street1" => "5000 Forbes Avenue",
        "street2" => nil,
        "city" => "Pittsburgh",
        "state" => "PA",
        "zip" => "15213"
      }, {
        "id" => 5,
        "street1" => "4000 Forbes Ave",
        "street2" => nil,
        "city" => "Pittsburgh",
        "state" => "PA",
        "zip" => "15212"
      }, {
        "id" => 6,
        "street1" => "3000 Forbes Ave",
        "street2" => nil,
        "city" => "Pittsburgh",
        "state" => "PA",
        "zip" => "15213"
      }]
    }, {
      "id" => 4, "lastName" => "Flood", "firstName" => "Ryan", "phone" => @ryan.phone, "email" => @ryan.email, "addresses" => [{
        "id" => 4,
        "street1" => "5000 Forbes Avenue",
        "street2" => nil,
        "city" => "Pittsburgh",
        "state" => "PA",
        "zip" => "15213"
      }]
    }, {
      "id" => 2, "lastName" => "Freeman", "firstName" => "Melanie", "phone" => @melanie.phone, "email" => @melanie.email, "addresses" => [{
        "id" => 2,
        "street1" => "5000 Forbes Avenue",
        "street2" => nil,
        "city" => "Pittsburgh",
        "state" => "PA",
        "zip" => "15213"
      }]
    }]

    get api_customers_url, as: :json
    assert_response :success
    assert_equal(expected_body, response.parsed_body)

    # change record first_name and observe change
    @alexe.first_name = "Alec"
    @alexe.save!
    expected_body[1]["firstName"] = @alexe.first_name

    get api_customers_url, as: :json
    assert_response :success
    assert_equal(expected_body, response.parsed_body)
  end

  test "should show customer" do
    expected_body = {
      "id" => 1, "lastName" => "Egan", "firstName" => "Alex", "phone" => @alexe.phone, "email" => @alexe.email, "addresses" => [{
        "id" => 1,
        "street1" => "5000 Forbes Avenue",
        "street2" => nil,
        "city" => "Pittsburgh",
        "state" => "PA",
        "zip" => "15213"
      }, {
        "id" => 5,
        "street1" => "4000 Forbes Ave",
        "street2" => nil,
        "city" => "Pittsburgh",
        "state" => "PA",
        "zip" => "15212"
      }, {
        "id" => 6,
        "street1" => "3000 Forbes Ave",
        "street2" => nil,
        "city" => "Pittsburgh",
        "state" => "PA",
        "zip" => "15213"
      }]
    }

    get api_customer_url(@alexe), as: :json
    assert_response :success
    assert_equal(expected_body, response.parsed_body)

    # change record first_name and observe change
    @alexe.first_name = "Alec"
    @alexe.save!
    expected_body["firstName"] = @alexe.first_name

    get api_customer_url(@alexe), as: :json
    assert_response :success
    assert_equal(expected_body, response.parsed_body)
  end
end
