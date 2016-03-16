module Cosmores
  module Room
    module ApiOperations

      # http://cosmores.com/api/#/getroomtypes
      #
      def rooms(client:, partner_id:, options: {})
        client.conn.post("/rest/hotel/#{partner_id}/rooms", options)
      end

      # http://cosmores.com/api/#/getroomdetails
      #
      def room(client:, partner_id:, room_id:, options: {})
        client.conn.post("/rest/hotel/#{partner_id}/room/#{room_id}", options)
      end

      # http://cosmores.com/api/#/getrateplans
      #
      def plans(client:, partner_id:, room_id:, options: {})
        client.conn.post(
          "/rest/hotel/#{partner_id}/room/#{room_id}/plans",
          options
        )
      end
    end
  end
end
