module EveOnline
  module SDE
    class Races < Base
      def data
        @data ||= original_data.map { |a| a.transform_keys { |k| k.underscore } }
      end
    end
  end
end
