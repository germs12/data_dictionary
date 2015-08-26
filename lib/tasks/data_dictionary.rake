namespace :db do
  def data_dictionary
    binding.pry
    # ActiveRecord::Base.connection.tables
  end

  # namespace for the migrate:status task
  namespace :migrate do 
    task :status do
      data_dictionary
    end
  end

  # migrate task
  task :migrate do 
    data_dictionary
  end
end