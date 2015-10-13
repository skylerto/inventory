#require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter=> "mysql",
    :host => "localhost",
   :database=> "inventory"
)
# :username => "inv",
 #   :password => "inventory_password",
    

class Thing < ActiveRecord::Base
end
