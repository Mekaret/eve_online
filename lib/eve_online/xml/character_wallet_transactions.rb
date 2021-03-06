module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_wallettransactions.html
    class CharacterWalletTransactions < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/WalletTransactions.xml.aspx'.freeze

      ACCESS_MASK = 4_194_304

      attr_reader :key_id, :v_code, :character_id # TODO: :account_key

      def initialize(key_id, v_code, character_id) # TODO: account_key
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        # @account_key = account_key TODO: add
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }"
      end
    end
  end
end
