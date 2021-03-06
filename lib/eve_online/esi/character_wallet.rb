module EveOnline
  module ESI
    class CharacterWallet < Base
      API_ENDPOINT = 'https://esi.tech.ccp.is/v1/characters/%s/wallet/?datasource=tranquility'.freeze

      attr_reader :character_id

      def initialize(options)
        super

        @character_id = options[:character_id]
      end

      def as_json
        {
          wallet: response
        }
      end

      def scope
        'esi-wallet.read_character_wallet.v1'
      end

      def url
        API_ENDPOINT % character_id
      end
    end
  end
end
