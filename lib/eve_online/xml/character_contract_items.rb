module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.io/en/latest/xmlapi/character/char_contractitems.html
    class CharacterContractItems < Base
      API_ENDPOINT = 'https://api.eveonline.com/char/ContractItems.xml.aspx'.freeze

      ACCESS_MASK = 67_108_864

      attr_reader :key_id, :v_code, :character_id, :contract_id

      def initialize(key_id, v_code, character_id, contract_id)
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = character_id
        @contract_id = contract_id
      end

      def url
        "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&characterID=#{ character_id }&contractID=#{ contract_id }"
      end
    end
  end
end
