require_relative('../db/sql_runner')

class Eatery

  attr_reader(:id, :name, :contact, :logo)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact = options['contact']
    @logo = options['logo']
  end

  def save
    sql = "INSERT INTO eateries
    (
      name,
      contact,
      logo
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@name, @contact, @logo]
    eatery_data = SqlRunner.run(sql, values)
    @id = eatery_data.first()['id'].to_i
  end

  def update
    sql = "UPDATE eateries
    SET
    (
      name,
      contact,
      logo
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @contact, @logo, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM eateries;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM eateries
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM eateries"
    eateries = SqlRunner.run(sql)
    return eateries.map {|eatery| Eatery.new(eatery)}
  end

  def self.find(id)
    sql = "SELECT * FROM eateries WHERE id = $1"
    values = [id]
    eatery = SqlRunner.run(sql, values)
    return Eatery.new(eatery.first)
  end

  def burgers
  sql = "SELECT burgers.*
        FROM burgers
        INNER JOIN deals
        ON deals.burger_id = burgers.id
        WHERE deals.eatery_id = $1"
  values = [@id]
  burgers = SqlRunner.run(sql,values)
  return  Burger.map_items(burgers)
  end

  def deals
  sql = "SELECT deals.*
        FROM deals
        WHERE deals.eatery_id = $1"
  values = [@id]
  deals = SqlRunner.run(sql,values)
  return  Deal.map_items(deals)
  end

end
