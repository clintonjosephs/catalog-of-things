require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :id

  def initialize(multiplayer, last_played_at, publish_date, archived)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def to_hash
    {
      'id' => @id,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'author' => @author,
      'item_type' => 'game'
    }
  end

  private

  def can_be_archived?
    last_played_at = Date.today.year - @last_played_at.year
    return true if super() && last_played_at > 2

    false
  end
end
