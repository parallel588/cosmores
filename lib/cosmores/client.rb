module Cosmores
  class Client
    API_BASE = 'https://cosmores.com'.freeze

    attr_reader :username, :password, :api_version, :proxy

    def initialize(username:, password:, api_version: 1, proxy: nil)
      @username = username
      @password = password
      @api_version = api_version
      @proxy = proxy
    end

    def conn
      @conn ||
        begin
          conn_options = {
            url: API_BASE,
            ssl: { ca_path: Cosmores::DEFAULT_CA_BUNDLE_PATH },
            params: {
              username: username, password: password, api_version: api_version
            }
          }
          conn_options[:proxy] = @proxy if @proxy
          @conn = Faraday.new(conn_options) do |b|
            b.request  :url_encoded
            b.headers['Accept'] = 'application/json'
            b.response :logger
            b.response :json
            b.adapter Faraday.default_adapter
          end
        end
      @conn
    end

    def invoke(resource, method, options = {})
      "cosmores/#{resource}".classify.constantize.send(
        method,
        options.merge(client: self)
      )
    end
  end
end
