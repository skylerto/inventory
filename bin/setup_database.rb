require 'active_record'

#ActiveRecord::Tasks::DatabaseTasks.database_configuration = {adapter: 'mysql2', host: 'localhost', database: "inventory"}
#ActiveRecord::Tasks::DatabaseTasks.create({adapter: 'mysql2', host: 'localhost', database: "inventory"})

ActiveRecord::Base.establish_connection(
    :adapter=> "mysql",
    :host => "localhost",
   :database=> "inventory"
)

class CreateThings < ActiveRecord::Migration
    def self.up
        create_table :things do |t|
        t.string :name, null: false
        t.integer :amount, null: false
    end
end

CreateThings.up

end
