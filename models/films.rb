require_relative '../db/sql_runner'

class Film

    attr_accessor :title, :price, :age_rating, :duration
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @price = options['price'].to_i
        @age_rating = options['age_rating'].to_i
        @duration = options['duration'].to_i
    end

    def save()
        sql = "INSERT INTO films (title, price, age_rating, duration)
        VALUES ($1, $2, $3, $4) RETURNING id;"
        values = [@title, @price, @age_rating, @duration]
        result = SqlRunner.run(sql, values).first()
        @id = result['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM films;"
        values = []
        results = SqlRunner.run(sql, values)
        return results.map { |film| Film.new(film) }
    end

    def self.delete_all()
        sql = "DELETE FROM films;"
        values = []
        SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE films SET (title, price, age_rating, duration)
        VALUES ($1, $2, $3, $4) WHERE id = $5"
        values = [@title, @price, @age_rating, @duration, @id]
        SqlRunner.run(sql, values)
    end

    def self.find(id)
        sql = "SELECT * FROM films WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values)
        return result.map { |film| Film.new(film) }
    end


end
