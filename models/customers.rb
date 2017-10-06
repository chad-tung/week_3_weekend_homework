require_relative '../db/sql_runner'

class Customer

    attr_accessor :name, :funds, :age, :student_status, :items_brought
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @funds = options['funds'].to_i
        @age = options['age'].to_i
        @student_status = options['student_status']
        @items_brought = options['items_brought']
    end

    def save()
        sql = "INSERT INTO customers (name, funds, age, student_status,
        items_brought) VALUES ($1, $2, $3, $4, $5) RETURNING id;"
        values = [@name, @funds, @age, @student_status, @items_brought]
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
        items_brought) VALUES ($1, $2, $3, $4, $5) WHERE id = $6;"
        values = [@name, @funds, @age, @student_status, @items_brought, @id]
        SqlRunner.run(sql, values)
    end

    def self.find(id)
        sql = "SELECT * FROM customers WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values)
        return result.map { |customer| Customer.new(customer) }
    end

    def buy_ticket()
    end

    def buy_item()
    end


end
