require_relative '../db/sql_runner'

class Screening

    attr_accessor :film_id, :seatings, :start_time, :day
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @film_id = options['film_id']
        @seatings = options['seatings']
        @start_time = options['start_time']
        @day = options['day']
    end

    def save()
        sql = "INSERT INTO screenings (film_id, seatings, start_time,
        day) VALUES ($1, $2, $3, $4) RETURNING id;"
        values = [@film_id, @seatings, @start_time, @day]
        result = SqlRunner.run(sql, values).first()
        @id = result['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM screenings;"
        values = []
        results = SqlRunner.run(sql, values)
        return results.map { |screening| Screening.new(screening) }
    end

    def self.delete_all()
        sql = "DELETE FROM screenings;"
        values = []
        SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE screenings SET (film_id, seatings, start_time,
        day) = ($1, $2, $3, $4) WHERE id = $5;"
        values = [@film_id, @seatings, @start_time, @day, @id]
        SqlRunner.run(sql, values)
    end

    def self.find(id)
        sql = "SELECT * FROM screenings WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values)
        return result.map { |screening| Screening.new(screening) }
    end

    def decrease_seating()
        @seatings -= 1
        update()
    end

    def customers()
        sql = "SELECT customers.* FROM customers INNER JOIN tickets ON
        customers.id = tickets.customer_id WHERE tickets.screening_id = $1;"
        values = [@id]
        result = SqlRunner.run(sql, values)
        return result.map { |customer| Customer.new(customer) }
    end

    def customer_count()
        return customers.count()
    end

########Wanna do a count on number of times an individual customer_id shows up for a showing id

#This gives a table on psql, but I'm probs being a tool as it's like 3.30am and can't see the obvious answer
    def self.popular_screening()
        sql = "SELECT COUNT(tickets.customer_id), tickets.screening_id FROM
        tickets GROUP BY tickets.screening_id ORDER BY COUNT(tickets.customer_id) DESC;"
        values = []
        result = SqlRunner.run(sql, values)
        return result.map { |headcount| HeadCount.new(headcount) }[0]
    end

end
