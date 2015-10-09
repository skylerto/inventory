#require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter=> "mysql",
    :host => "localhost",
    :database=> "inventory"
)

class Thing < ActiveRecord::Base
end
