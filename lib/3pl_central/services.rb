module ThreePLCentral
  class Services
    class << self

      def create_orders(create_creds, data)
        ThreePLCentral.client.request(:create_orders) do
          soap.xml do |xml|
            xml.env :Envelope, NAMESPACES do |xml|
              xml.env :Body do |xml|
                xml.tns :extLoginData do |xml|
                  create_creds.each do |key, value|
                    xml.tns key.to_sym, value
                  end
                  xml.tns :FacilityID, data[:facility_id]
                end
                xml.tns :orders do |xml|
                  xml.tns :Order do |xml|
                    xml.tns :TransInfo do |xml|
                      xml.tns :ReferenceNum, data[:trans_info][:reference_num]
                      xml.tns :ExpectedDate, data[:trans_info][:expected_date]
                      xml.tns :EarliestShipDate, data[:trans_info][:earliest_ship_date]
                      xml.tns :ShipCancelDate, data[:trans_info][:ship_cancel_date]
                    end
                    xml.tns :ShipTo do |xml|
                      xml.tns :Name, data[:ship_to][:name]
                      xml.tns :CompanyName, data[:ship_to][:company_name]
                      xml.tns :Address do |xml|
                        xml.tns :Address1, data[:ship_to][:address][:address1]
                        xml.tns :Address2, data[:ship_to][:address][:address2]
                        xml.tns :City, data[:ship_to][:address][:city]
                        xml.tns :State, data[:ship_to][:address][:state]
                        xml.tns :Zip, data[:ship_to][:address][:zip]
                        xml.tns :Country, data[:ship_to][:address][:country]
                      end
                      xml.tns :PhoneNumber1, data[:ship_to][:phone_number1]
                      xml.tns :EmailAddress1, data[:ship_to][:email_address1]
                      xml.tns :ShippingInstructions do |xml|
                        xml.tns :Carrier, data[:ship_to][:shipping_instructions][:carrier]
                        xml.tns :Mode, data[:ship_to][:shipping_instructions][:mode]
                        xml.tns :ShippingNotes, data[:ship_to][:shipping_instructions][:shipping_notes]
                      end
                      xml.tns :Notes, data[:notes]
                      xml.tns :OrderLineItems do |xml|
                        data[:order_line_items].each do |order_item|
                          xml.tns :OrderLineItem do |xml|
                            xml.tns :Sku, order_item[:sku]
                            xml.tns :Qty, order_item[:qty]
                            xml.tns :FulfillmentSalePrice, order_item[:fulfillment_sale_price]
                            xml.tns :FulfillmentDiscountPercentage, order_item[:fulfillment_discount_percentage]
                            xml.tns :FulfillmentDiscountAmount, order_item[:fulfillment_discount_amount]
                          end
                        end
                      end
                      xml.tns :FulfillmentInfo do |xml|
                        xml.tns :FulfillInvShippingAndHandling, data[:fulfillment_info][:fulfill_inv_shipping_and_handling]
                        xml.tns :FulfillInvTax, data[:fulfillment_info][:fulfill_inv_tax]
                      end
                      xml.tns :SoldTo do |xml|
                        xml.tns :Name, data[:sold_to][:name]
                        xml.tns :CompanyName, data[:sold_to][:company_name]
                        xml.tns :Address do |xml|
                          xml.tns :Address1, data[:sold_to][:address][:address1]
                          xml.tns :Address2, data[:sold_to][:address][:address2]
                          xml.tns :City, data[:sold_to][:address][:city]
                          xml.tns :State, data[:sold_to][:address][:state]
                          xml.tns :Zip, data[:sold_to][:address][:zip]
                          xml.tns :Country, data[:sold_to][:address][:country]
                        end
                        xml.tns :PhoneNumber1, data[:sold_to][:phone_number1]
                        xml.tns :EmailAddress1, data[:sold_to][:email_address1]
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end

      def find_orders(data)
        ThreePLCentral.client.request(:find_orders) do
          soap.xml do |xml|
            xml.env :Envelope, NAMESPACES do |xml|
              xml.env :Body do |xml|
                xml.tns :userLoginData do |xml|
                  read_creds.each do |key, value|
                    xml.tns key.to_sym, value
                  end
                end
                xml.tns :focr do |xml|
                  data.each do |key, value|
                    xml.tns key.to_sym, value
                  end
                end
              end
            end
          end
        end
      end

      def stock_status
        ThreePLCentral.client.request(:report_stock_status) do
          soap.xml do |xml|
            xml.env :Envelope, NAMESPACES do |xml|
              xml.env :Body do |xml|
                xml.tns :userLoginData do |xml|
                  read_creds.each do |key, value|
                    xml.tns key.to_sym, value
                  end
                end
              end
            end
          end
        end
      end

      def small_parcel_orders(data)
        ThreePLCentral.client.request(:small_parcel_orders) do
          soap.xml do |xml|
            xml.env :Envelope, NAMESPACES do |xml|
              xml.env :Body do |xml|
                xml.tns :userLoginData do |xml|
                  read_creds.each do |key, value|
                    xml.tns key.to_sym, value
                  end
                end
                xml.tns :focr do |xml|
                  data.each do |key, value|
                    xml.tns key.to_sym, value
                  end
                end
              end
            end
          end
        end
      end

      def read_creds
        { "ThreePLID" => ThreePLCentral.configuration.three_pl_id,
          "Login" => ThreePLCentral.configuration.login,
          "Password" => ThreePLCentral.configuration.password
        }
      end
    end
  end
end
