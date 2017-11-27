require_relative('../db/sql_runner')

class Burger

  attr_reader(:id, :name, :type, :price, :logo)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type'].to_sym
    @price = options['price'].to_f
    @logo = options['logo']
  end

  def save
    sql = "INSERT INTO burgers
    (
      name,
      type,
      price,
      logo
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@name, @type, @price, @logo]
    burger_data = SqlRunner.run(sql, values)
    @id = burger_data.first()['id'].to_i
  end

  def update
    sql = "UPDATE burgers
    SET
    (
      name,
      type,
      price,
      logo
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@name, @type, @price, @logo, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM burgers;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM burgers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM burgers"
    burgers = SqlRunner.run(sql)
    return burgers.map {|burger| Burger.new(burger)}
  end

  def self.find(id)
    sql = "SELECT * FROM burgers WHERE id = $1"
    values = [id]
    burger = SqlRunner.run(sql, values)
    return Burger.new(burger.first)
  end

  def eateries
  sql = "SELECT eateries.*
        FROM eateries
        INNER JOIN deals
        ON deals.eatery_id = eateries.id
        WHERE deals.burger_id = $1"
  values = [@id]
  eateries = SqlRunner.run(sql,values)
  return  Eatery.map_items(eateries)
  end

  def deals
  sql = "SELECT deals.*
        FROM deals
        WHERE deals.burger_id = $1"
  values = [@id]
  deals = SqlRunner.run(sql,values)
  return  Deal.map_items(deals)
  end

end
