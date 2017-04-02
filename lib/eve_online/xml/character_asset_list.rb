module EveOnline
  module XML
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/character/char_assetlist.html
    class CharacterAssetList < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/char/AssetList.xml.aspx'.freeze

      ACCESS_MASK = 2

      attr_reader :key_id, :v_code, :character_id, :flat

      def initialize(key_id, v_code, options = {})
        super()
        @key_id = key_id
        @v_code = v_code
        @character_id = options.fetch(:character_id, nil)
        @flat = options.fetch(:flat, 1)
      end

      def assets
        case row
        when Hash
          [Item.new(row)]
        when Array
          output = []
          row.each do |item|
            output << Item.new(item)
          end
          output
        else
          raise ArgumentError
        end
      end
      memoize :assets

      def url
        output = "#{ API_ENDPOINT }?keyID=#{ key_id }&vCode=#{ v_code }&flat=#{ flat }"
        output = "#{ output }&characterID=#{ character_id }" if character_id
        output
      end

      private

      def rowset
        result.fetch('rowset')
      end
      memoize :rowset

      def row
        rowset.fetch('row')
      end
      memoize :row
    end
  end
end