require_relative '../db/sql_runner'

class HeadCount
    def initialize(options)
        @count = options['count'].to_i
        @screening_id = options['screening_id'].to_i
    end
end
