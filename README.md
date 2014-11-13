# 3plCentral

A Ruby wrapper for the 3PL Central SOAP API.

3PL Central is a SaaS WMS. Read more here at http://www.3plcentral.com/

View the 3PL API Documentation here: https://app02.3plcentral.com/webserviceexternal/contracts.asmx
## Installation

Add this line to your application's Gemfile:

    gem '3pl_central'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 3pl_central

## Usage

### Configuration

```ruby
  require '3pl_central'

  ThreePLCentral.configure do |c|
    c.three_pl_key        = "{YOUR GUID GOES HERE}"
    c.login               = "customer_login" #configured in 3PL Central -> Customer -> Customer Users
    c.password            = "customer_password" # same as login
    c.default_facility_id = 1 #this might be removed in a later version, and we'll just look for the "Facility ID" on the order or item level.
    c.user_login_id       = 4 #unsure where to find this currently
  end

```
### Creating Orders

```ruby
#assuming configuration was already done...

ThreePLCentral::Order.create({
  trans_info: {
    reference_num: "100001",
    expected_date: "2014-11-12",
    earliest_ship_date: "2014-11-12",
    ship_cancel_date:  "2014-11-12"},
  ship_to: {
    name: "Test Test",
    company_name: "Test Co.",
    address:{
      address1: "Toronto",
      address2:"Ste. 2",
      city:"1234 Fake St.",
      state:"ON",
      zip:"M4B 1B3",
      country:"Canada"},
    phone_number1: "999-999-9999",
    email_address1: "test@test.com",
    shipping_instructions: {
      carrier: "FedEx",
      mode: "Ground",
      shipping_notes: "I need it ASAP!"}
  },
  notes: "More notes!",
  order_line_items: [
    {
      sku:"90RND-010101",
      qty:"10",
      fulfillment_sale_price:9.99,
      fulfillment_discount_percentage:10,
      fulfillment_discount_amount:0.99}
  ],
  fulfillment_info:{
    fulfill_inv_shipping_and_handling:9.12,
    fulfill_inv_tax:0.49},
  sold_to: {
    name:"Joe Jones",
    address:{
      address1:"5555 Some Pl.",
      city:"Portland",
      state:"OR",
      zip:"97219",
      country:"United States"},
    phone_number1:"503-992-2329",
    email_address1:"joe.jones@example.com"}
})

# => true
```

## Contributing

1. Fork it ( https://github.com/adamrunner/3pl_central/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
