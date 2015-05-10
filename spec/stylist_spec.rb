require("header_spec")

describe(Stylist) do


  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a stylist by their ID number") do
      test_stylist_1 = Stylist.new({:name => "Phillip", :id => nil})
      test_stylist_1.save()
      test_stylist_2 = Stylist.new({:name => "Joanna", :id => nil})
      test_stylist_2.save()
      expect(Stylist.find(test_stylist_2.id())).to(eq(test_stylist_2))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name and id") do
      test_stylist_1 = Stylist.new({:name => "Frederick", :id => nil})
      test_stylist_2 = Stylist.new({:name => "Frederick", :id => nil})
      expect(test_stylist_1).to(eq(test_stylist_2))
    end
  end

  describe("#update_name") do
    it("lets you update stylist names in the database") do
      test_stylist_1 = Stylist.new({:name => "Jackie", :id => nil})
      test_stylist_1.save()
      test_stylist_1.update_name({:name => "Jackie"})
      expect(test_stylist_1.name()).to(eq("Jackie"))
    end
  end

  describe("#add_client") do
      it("lets you add a client to a stylist") do
        test_stylist_1 = Stylist.new({:name => "Dan", :id => nil})
        test_stylist_1.save()
        test_client_1 = Client.new({:name => "Fred Forgetful", :id => nil, :stylist_id => nil})
        test_client_1.save()
        test_client_2 = Client.new({:name => "Megan Meandering", :id => nil, :stylist_id => nil})
        test_client_2.save()
        test_stylist_1.add_client({:client_ids => [test_client_1.id(), test_client_2.id()]})
        expect(test_stylist_1.clients()).to(eq([test_client_1, test_client_2]))
      end
    end

  describe("#clients") do
      it("returns all of the clients for a stylist") do
        test_stylist_1 = Stylist.new({:name => "Maude", :id => nil})
        test_stylist_1.save()
        test_client_1 = Client.new({:name => "Mike Maudlin", :id => nil, :stylist_id => nil})
        test_client_1.save()
        test_client_2 = Client.new({:name => "Matt Merry", :id => nil, :stylist_id => nil})
        test_client_2.save()
        test_stylist_1.add_client({:client_ids => [test_client_1.id(), test_client_2.id()]})
        expect(test_stylist_1.clients()).to(eq([test_client_1, test_client_2]))
      end
    end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      test_stylist_1 = Stylist.new({:name => "Jeremy", :id => nil})
      test_stylist_1.save()
      test_stylist_2 = Stylist.new({:name => "Erica", :id => nil})
      test_stylist_2.save()
      test_stylist_1.delete()
      expect(Stylist.all()).to(eq([test_stylist_2]))
    end
  end

end
