module EveOnline
  module SDE
    module Models
      class Race
        attr_reader :data

        def initialize(data)
          @data = data
        end

        def as_json
          {
            race_id: race_id,
            race_name: race_name,
            short_description: short_description,
            description: description,
            icon_id: icon_id
          }
        end

        def race_id
          data['raceID']
        end

        def race_name
          data['raceName']
        end

        def short_description
          data['shortDescription']
        end

        def description
          data['description']
        end

        def icon_id
          data['iconID']
        end
      end
    end
  end
end
