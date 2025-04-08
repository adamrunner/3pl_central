### UPDATE 4/8/2025 
Archiving this code, as the SOAP API it previously wrapped has long since been deprecated. 

### UPDATE 8/6/2016 
I no longer work at a company that uses 3PL Central for their WMS, which means I cannot continue testing or maintaining of this gem. If you're interested in taking over this repository, please let me know. Furthermore if there is a way to get some sort of 3PL Central testing credentials I'd be happy to continue working with this gem in my free time. 

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

### Per Usage Configuration
This method works indentically to the other, it just makes it easier to deal with different customer records, usernames, IDs, etc. that you might have in 3PL Central.
```ruby
client = ThreePLCentral::Client.new(three_pl_key: "{a123457-a389-4674-bcdd-a646150aaf}", login: "3pluser"  , password: "3plpass", three_pl_id: "123")

client.create_order(params_for_order_create)

client.find_order(params_for_find_order)

client.find_small_parcel_order(params_for_shipment)

client.get_stock_status(params_for_stock_status)


```


### Per Application Configuration

```ruby
  require '3pl_central'

  ThreePLCentral.configure do |c|
    c.three_pl_key        = "{YOUR GUID GOES HERE}"
    c.login               = "customer_login" #configured in 3PL Central -> Customer -> Customer Users
    c.password            = "customer_password" # same as login
    c.default_facility_id = 1 #this might be removed in a later version, and we'll just look for the "Facility ID" on the order or item level.
    c.user_login_id       = 4 #We had to contact our account manager with 3PL Central to get this information.
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
## TODOs
1. Move the credentials to a "per request" basis, rather than being configured for the entire instance of the gem, in our integration we'll use this to separate out to different (3PL Central) customers that we're interacting with.
1. Write tests, there aren't any done currently. However there's not a whole lot of logic either.
1. Expose configuration of Savon gem. Currently the defaults we set aren't changeable, and Savon is going to be spitting out a fair amount of debugging information.
1. Fix `Guardfile`, it only seems to generate documentation currently, not run the specs.
1. Wrap other functionality, an observant user might notice that only part of the 3PL Central web service is wrapped, that's because we just did what we needed for our specific implementation.
1. Document more examples, we should have a working example for each of the services that are wrapped.

## Contributing

1. Fork it ( https://github.com/adamrunner/3pl_central/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
