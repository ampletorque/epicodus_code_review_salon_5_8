require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")


DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end

get("/clients") do
  @clients = Client.all()
  erb(:clients)
end

get("/stylists") do
  @stylists = Stylist.all()
  erb(:stylists)
end

post("/clients") do
  name = params.fetch("name")
  client = Client.new({:name => name, :id => nil, :stylist_id => nil})
  client.save()
  @clients = Client.all()
  erb(:clients)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @stylists = Stylist.all()
  erb(:client_info)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:stylist_info)
end

patch("/clients/:id") do
  client_id = params.fetch("id").to_i()
  @client = Client.find(client_id)
  @client_stylist = @client.stylist()
  stylist_id = params.fetch("stylist_id")
  Stylist.find(stylist_id.to_i()).add_client({:client_ids => [client_id]})
  @stylists = Stylist.all()
  erb(:client_info)
end

patch("/stylists/:id") do
  stylist_id = params.fetch("id").to_i()
  @stylist = Stylist.find(stylist_id)
  client_ids = params.fetch("client_ids")
  @stylist.add_client({:client_ids => client_ids})
  @clients = Client.all()
  erb(:stylist_info)
end
