require 'uri'

module EveOnline
  module Eve
    # https://eveonline-third-party-documentation.readthedocs.org/en/latest/xmlapi/eve/eve_characterid.html
    class CharacterID < BaseXML
      API_ENDPOINT = 'https://api.eveonline.com/eve/CharacterID.xml.aspx'.freeze

      attr_reader :input

      def initialize(input)
        super()
        @input = input
      end

      def characters
        # TODO: implement
        raise NotImplementedError
      end

      def names
        case input
        when String
          input
        when Array
          input.join(',')
        else
          raise ArgumentError
        end
      end

      def escaped_input
        URI.escape(names)
      end

      def url
        "#{ API_ENDPOINT }?names=#{ escaped_input }"
      end
    end
  end
end
