require 'pry'
def nyc_pigeon_organizer(data)
  pigeon_list = Hash.new
  data.each do |pigeon_attributes, value|
    # Right now, pigeon_attributes is colour and value is all the individual colours
    # Why isn't pigeon_attributes colour, gender and lives? 
    if pigeon_attributes == :gender
      # We are going to try to collect the names from the gender. 
      pigeon_names = value.values.flatten
      # We have now collected the names for the genders and put them in one array
      # We collected it with value.values.flatten and named the array pigeon_names
      pigeon_names.each do |individualname|
      # pigeon_names is equal to an array that is filled with all the names
      #["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky", "Queenie", "Ms. K"]
      # now iterate through each one and put it into the hash         
      pigeon_list[individualname] = Hash.new
      end
    end   
  end
  data.each do |pigeon_attributes, value|
    pigeon_list.each do |element, empty|      
      pigeon_list[element][pigeon_attributes] = []
  # element is "Alex" and the pigeon_attributes is the :color
  # if one of the elements in the value is equal to alex, check the key   
  # At this point in the hash, I'm in :color/:gender bit
   value.each do |attribute, namelist|
    if namelist.include?(element)
      # Returns a true/false if it contains "Alex"
      pigeon_list[element][pigeon_attributes]<< attribute.to_s
    end
  end
    end
  end
  pigeon_list
end

  # pigeon_data = {
  #   :color => {
  #     :purple => ["Theo", "Peter Jr.", "Lucky"],
  #     :grey => ["Theo", "Peter Jr.", "Ms. K"],
  #     :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
  #     :brown => ["Queenie", "Alex"]
  #   },
  #   :gender => {
  #     :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
  #     :female => ["Queenie", "Ms. K"]
  #   },
  #   :lives => {
  #     "Subway" => ["Theo", "Queenie"],
  #     "Central Park" => ["Alex", "Ms. K", "Lucky"],
  #     "Library" => ["Peter Jr."],
  #     "City Hall" => ["Andrew"]
  #   }
  # }
