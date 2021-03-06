class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
    name = result.first().fetch("name")
    Stylist.new({:name => name, :id => id})
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |a_stylist|
    self.name().==(a_stylist.name()).&(self.id().==(a_stylist.id()))
  end

  define_method(:update_name) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:add_client) do |attributes|
    attributes.fetch(:client_ids, []).each() do |client_id|
      DB.exec("UPDATE clients SET stylist_id = #{self.id()} WHERE id = #{client_id};")
    end
  end

  define_method(:clients) do
    stylist_clients = []
    results = DB.exec("SELECT id FROM clients WHERE stylist_id = #{self.id()};")
    results.each() do |result|
      client_id = result.fetch("id").to_i()
      client = DB.exec("SELECT * FROM clients WHERE id = #{client_id};")
      name = client.first().fetch("name")
      stylist_clients.push(Client.new({:name => name, :id => client_id, :stylist_id => self.id()}))
    end
    stylist_clients
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end
end
