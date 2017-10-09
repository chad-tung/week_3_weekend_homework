require_relative '../db/sql_runner'

class Ticket

    attr_reader :id
    attr_accessor :customer_id, :screening_id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @customer_id = options['customer_id']
        @screening_id = options['screening_id']
    end

    def save()
        sql = "INSERT INTO tickets (customer_id, screening_id) VALUES
        ($1, $2) RETURNING id;"
        values = [@customer_id, @screening_id]
        result = SqlRunner.run(sql, values).first()
        @id = result['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM tickets;"
        values = []
        results = SqlRunner.run(sql, values)
        return results.map { |ticket| Ticket.new(ticket) }
    end

    def self.delete_all()
        sql = "DELETE FROM tickets;"
        values = []
        SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE tickets (customer_id, screening_id) WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.find(id)
        sql = "SELECT * FROM tickets WHERE id = $1;"
        values = [id]
        result = SqlRunner.run(sql, values)
        return result
    end
end
