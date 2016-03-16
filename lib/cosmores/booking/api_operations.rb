module Cosmores
  module Booking
    module ApiOperations

      # http://cosmores.com/api/#/fetchbookings
      #
      def fetch(client:, partner_id:, options: {})
        client.conn.post("/rest/hotel/#{partner_id}/bookings", options)
      end

      # http://cosmores.com/api/#/newbooking
      #
      def new(client:, partner_id:, options: {})
        client.conn.post("/rest/hotel/#{partner_id}/booking/new", options)
      end

      # http://cosmores.com/api/#/cancelbooking
      #
      def cancel(client:, partner_id:, options: {})
        client.conn.post("/rest/hotel/#{partner_id}/booking/cancel", options)
      end

      # http://cosmores.com/api/#/confirmbooking
      #
      def confirm(client:, partner_id:, options: {})
        client.conn.post("/rest/hotel/#{partner_id}/booking/confirm", options)
      end
    end
  end
end
