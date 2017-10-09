require_relative '../db/sql_runner'

class Item
    attr_reader :id
    attr_accessor :name, :price, :stock_quantity

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @price = options['price'].to_i
        @stock_quantity = options['stock_quantity'].to_i
    end

    def save()
        sql = "INSERT INTO items (name, price, stock_quantity) VALUES ($1, $2, $3)
        RETURNING id;"
        values = [@name, @price, @stock_quantity]
        result = SqlRunner.run(sql, values).first()
        @id = result['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM items;"
        values = []
        results = SqlRunner.run(sql, values)
        return results.map { |item| Item.new(item) }
    end

    def update()
        sql = "UPDATE items SET (name, price, stock_quantity) = ($1, $2, $3)
        WHERE id = $4;"
        values = [@name, @price, @stock_quantity, @id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM items;"
        values = []
        SqlRunner.run(sql, values)
    end

    def self.find(id)
        sql = "SELECT * FROM items WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values)
        return result.map { |item| Item.new(item) }
    end

    def decrease_stock()
        @stock_quantity -= 1
        update()
    end

end
