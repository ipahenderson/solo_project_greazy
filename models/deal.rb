require_relative('../db/sql_runner')

class Deal

  attr_reader(:id, :name, :discount, :day, :eatery_id, :burger_id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @discount = options['discount'].to_f
    @day = options['day']
    @eatery_id = options['eatery_id'].to_i
    @burger_id = options['burger_id'].to_i
  end

  def save
    sql = "INSERT INTO deals
    (
      name,
      discount,
      day,
      eatery_id,
      burger_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING *"
    values = [@name, @discount, @day, @eatery_id, @burger_id]
    deal_data = SqlRunner.run(sql, values)
    @id = deal_data.first['id'].to_i
  end

  def update
    sql = "UPDATE deals
    SET
    (
      name,
      discount,
      day,
      burger_id,
      eatery_id
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@name, @discount, @day, @eatery_id, @burger_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM deals;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM deals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM deals"
    deals = SqlRunner.run(sql)
    return deals.map {|deal| Deal.new(deal)}
  end

  def self.find(id)
    sql = "SELECT * FROM deals WHERE id = $1"
    values = [id]
    deal = SqlRunner.run(sql, values)
    return Deal.new(deal.first)
  end

  def eatery
  sql = "SELECT *
        FROM eateries
        WHERE id = $1"
  values = [@eatery_id]
  result = SqlRunner.run(sql,values)[0]
  return Eatery.new(result)
end

def burger
  sql = "SELECT *
        FROM burgers
        WHERE id = $1"
  values = [@burger_id]
  result = SqlRunner.run(sql,values)[0]
  return Burger.new(result)
end

end
