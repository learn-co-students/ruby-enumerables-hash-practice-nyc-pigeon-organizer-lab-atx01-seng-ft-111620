=begin
#First attempt at pigeon lab. Ran into an issue where my names were pointing to the same location in memory for the hash of attributes.
def nyc_pigeon_organizer(data)
  # write your code here!

organized_data = {}

#Below code retrieves all names from data. Then flattens the AoA to create a 2D array
  unique_names = []
  data.each do |key, value|
    value.each do |attribute, names|
      unique_names << names
    end
  end
  unique_names.flatten!

#Below code removes repeating names from array of names
  unique_names.uniq!

#Below code creates list of attributes
  unique_attributes = []
  data.each do |key, value|
    unique_attributes << key
  end

#Below code creates attribute hash with empty arrays
  unique_attributes_hash = {}

  unique_attributes.each do |attribute|
    unique_attributes_hash[attribute] = []
  end

#Below code creates a HoHoA with the unique names and attributes
  unique_names.each do |name|
    organized_data[name] = unique_attributes_hash
  end

### At this point we have a HoHoA with unique names and attributes associated with each name pointing to an empty array ###

#Below code uses a loop to add details to the arrays corresponding to the matching names and attributes from original data
  data.each do |key, value|
    value.each do |detail, names|
      p names
      names.each do |name|
        organized_data[name][key] << detail.to_s
      end
    end
  end

#Below code returns new organized pigeon data
  organized_data
end

=end
def nyc_pigeon_organizer(data)
  # write your code here!
  final_result = data.each_with_object({}) do |(key, value), final_array|
    value.each do |inner_key, names|
      names.each do |name|
        if !final_array[name]
          final_array[name] = {}
        end
        if !final_array[name][key]
          final_array[name][key] = []
        end
        final_array[name][key] << inner_key.to_s
      end
    end
  end
end
