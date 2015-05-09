require("header_spec")

describe(Client) do

  describe("#initialize") do
    it("is initialized with a name") do
      test_client_1 = Client.new({:name => "Ichabod Irksome", :id => nil, :stylist_id => nil})
      expect(test_client_1).to(be_an_instance_of(Client))
    end

    it("can be initialized with its database ID") do
      test_client_1 = Client.new({:name => "Joshua Jaunty", :id => 1, :stylist_id => nil})
      expect(test_client_1).to(be_an_instance_of(Client))
    end
  end

  describe(".all") do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a client by its ID number") do
      test_client_1 = Client.new({:name => "Samantha Silly", :id => nil, :stylist_id => nil})
      test_client_1.save()
      test_client_2 = Client.new({:name => "Georgina Garulous", :id => nil, :stylist_id => nil})
      test_client_2.save()
      expect(Client.find(test_client_2.id())).to(eq(test_client_2))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name and id") do
      test_client_1 = Client.new({:name => "Sarah Super", :id => nil, :stylist_id => nil})
      test_client_2 = Client.new({:name => "Sarah Super", :id => nil, :stylist_id => nil})
      expect(test_client_1).to(eq(test_client_2))
    end
  end

  describe("#update") do
    it("lets you update clients in the database") do
      test_client_1 = Client.new({:name => "Dave Dorky", :id => nil, :stylist_id => nil})
      test_client_1.save()
      test_client_1.update({:name => "Nick Nutty"})
      expect(test_client_1.name()).to(eq("Nick Nutty"))
    end
  end

  describe("#delete") do
    it("lets you delete a client from the database") do
      test_client_1 = Client.new({:name => "George Clooney", :id => nil, :stylist_id => nil})
      test_client_1.save()
      test_client_2 = Client.new({:name => "Brad Pitt", :id => nil, :stylist_id => nil})
      test_client_2.save()
      test_client_1.delete()
      expect(Client.all()).to(eq([test_client_2]))
    end
  end

  describe("#stylist") do
    it("returns the stylist for a client") do
      test_stylist_1 = Stylist.new({:name => "Maude", :id => nil})
      test_stylist_1.save()
      test_client_1 = Client.new({:name => "Mike Maudlin", :id => nil, :stylist_id => nil})
      test_client_1.save()
      test_stylist_1.add_client({:client_ids => [test_client_1.id()]})
      expect(test_client_1.stylist()).to(eq([test_stylist_1]))
    end
  end

end
