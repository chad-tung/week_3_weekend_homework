require_relative '../db/sql_runner'

class Customer

    attr_accessor :name, :funds, :age, :student_status, :items_purchased
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @funds = options['funds'].to_i
        @age = options['age'].to_i
        @student_status = options['student_status']
        @items_purchased = options['items_purchased']
    end

    def save()
        sql = "INSERT INTO customers (name, funds, age, student_status,
        items_purchased) VALUES ($1, $2, $3, $4, $5) RETURNING id;"
        values = [@name, @funds, @age, @student_status, @items_purchased]
        result = SqlRunner.run(sql, values).first()
        @id = result['id'].to_i
    end

    def self.all()
        sql =  "SELECT * FROM customers"
        values = []
        results = SqlRunner.run(sql, values)
        return results.map { |customer| Customer.new(customer) }
    end

    def self.delete_all()
        sql = "DELETE FROM customers"
        values = []
        SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE customers SET (name, funds, age, student_status,
        items_purchased) = ($1, $2, $3, $4, $5) WHERE id = $6;"
        values = [@name, @funds, @age, @student_status, @items_purchased, @id]
        SqlRunner.run(sql, values)
    end

    def self.find(id)
        sql = "SELECT * FROM customers WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values)
        return result.map { |customer| Customer.new(customer) }
    end

    def films()
        sql = "SELECT films.* FROM films INNER JOIN screenings ON
        films.id = screenings.film_id INNER JOIN tickets ON screenings.id
        = tickets.screening_id WHERE tickets.customer_id = $1;"
        values = [@id]
        result = SqlRunner.run(sql, values)
        return result.map { |film| Film.new(film) }
    end

    def tickets()
        sql = "SELECT tickets.* FROM tickets WHERE tickets.customer_id = $1;"
        values = [@id]
        result = SqlRunner.run(sql, values)
        return result.map { |ticket| Ticket.new(ticket) }
    end

    def screenings()
        sql = "SELECT screenings.* FROM tickets INNER JOIN screenings ON
        tickets.screening_id = screenings.id WHERE tickets.customer_id = $1;"
        values = [@id]
        result = SqlRunner.run(sql, values)
        return result.map { |screening| Screening.new(screening) }
    end

    def film_price(screening)
        sql = "SELECT films.price FROM films INNER JOIN screenings ON
        films.id = screenings.film_id WHERE screenings.id = $1;"
        values = [screening.id]
        result = SqlRunner.run(sql, values)
        return (result.map { |film| Film.new(film) })[0].price()
    end

    def subtract_funds(purchase)
        new_funds = @funds -= purchase
        unless new_funds < 0
            @funds = new_funds
        end
        update()
    end

    def buy_ticket(screening)
        subtract_funds(film_price(screening))
        screening.decrease_seating()
        ticket = Ticket.new( {'customer_id'=>@id, 'screening_id'=>screening.id()} )
        ticket.save()
    end

    def buy_item(item)
        item.decrease_stock()
        @items_purchased << item.name()
        subtract_funds(item.price)
    end


end
