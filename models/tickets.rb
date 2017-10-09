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
        sql = "UPDATE tickets SET (customer_id, screening_id) =
        ($1, $2) WHERE id = $3;"
        values = [@customer_id , @screening_id, @id]
        SqlRunner.run(sql, values)
    end

    def self.find(id)
        sql = "SELECT * FROM tickets WHERE id = $1;"
        values = [id]
        result = SqlRunner.run(sql, values)
        return result
    end

    def self.customer_films(customer)
        sql = "SELECT films.* FROM films INNER JOIN screenings ON
        films.id = screenings.film_id INNER JOIN tickets ON
        tickets.screening_id = screenings.id WHERE tickets.customer_id = $1;"
        values = [customer.id]
        results = SqlRunner.run(sql, values)
        return results.map { |film| Film.new(film)}
    end

    def self.customer_screenings(customer)
        sql = "SELECT screenings.* FROM screenings INNER JOIN tickets ON
        screenings.id = tickets.screening_id WHERE tickets.customer_id = $1;"
        values = [customer.id]
        results = SqlRunner.run(sql, values)
        return results.map { |screening| Screening.new(screening) }
    end

    def self.film_customers(film)
        sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id
        = tickets.customer_id INNER JOIN screenings ON tickets.screening_id =
        screenings.id WHERE screenings.film_id = $1;"
        values = [film.id]
        results = SqlRunner.run(sql, values)
        return results.map { |customer| Customer.new(customer) }
    end

    def self.screening_customers(screening)
        sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id =
        tickets.customer_id WHERE tickets.screening_id = $1;"
        values = [screening.id]
        results = SqlRunner.run(sql, values)
        return results.map { |customer| Customer.new(customer) }
    end
end
