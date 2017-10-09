require_relative '../db/sql_runner'

class HeadCount
    def initialize(options)
        @id = options['id'].to_i if options['id']
        @count = options['count'].to_i
        @screening_id = options['screening_id']
    end
end
