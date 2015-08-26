module TheDataDictionary
  FILE_NAME = 'the_data_dictionary'
  def self.write_to_yml(hash, filename = FILE_NAME)
    File.open("tmp/#{filename}.yml", 'w') {|f| f.write hash.to_yaml } #Store
  end

  def self.load_dd_from_yml
    d = YAML::load_file("tmp/#{FILE_NAME}.yml") #Load
  end

  def self.db_and_columns_to_hash
    tmp = {}
    ActiveRecord::Base.connection.tables.map do |model|
      unless model.eql? 'schema_migrations'
        tmp[model] = {} if tmp[model].nil?
        model.classify.constantize.attribute_names.each do |column|
          tmp[model][column] = ''
        end
      end
    end
    tmp
  end

  def self.run
    write_to_yml db_and_columns_to_hash
  end

end