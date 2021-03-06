module EveOnline
  class Skill
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def as_json
      {
        type_id: type_id,
        skillpoints: skillpoints,
        level: level,
        published: published
      }
    end

    def type_id
      options.fetch('@typeID').to_i
    end

    def skillpoints
      options.fetch('@skillpoints').to_i
    end

    def level
      options.fetch('@level').to_i
    end

    def published
      options.fetch('@published') == '1'
    end
  end
end
