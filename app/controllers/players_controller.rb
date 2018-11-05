class PlayersController < ApplicationController
  include Countries

  def index
    @players = Player.all
    @count_countries = Player.group(:country).count
    @countries_to_map = Hash.new
    @count_countries.each do |map|
        c = ISO3166::Country.find_country_by_alpha3(map[0])
        @countries_to_map[c.alpha2] = map[1];
    end
  end

  def map_time
    # First call use var countries_to_map for get a hash
    @count_countries = Player.group(:country).count
    @countries_to_map = Hash.new
    @count_countries.each do |map|
        c = ISO3166::Country.find_country_by_alpha3(map[0])
        @countries_to_map[c.alpha2] = map[1];
    end

    # Send variable updated on country alpha3 => name for manage on javascript
    @players = Player.select(:id, :name, :country).all
    @players_updated = [];
    @players.each do |player|
      c = ISO3166::Country.find_country_by_alpha3(player.country)
      player.country = c.alpha2;
      @players_updated.push(player)
    end
  end
end
