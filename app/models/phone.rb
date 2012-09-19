class Phone < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :last_name, :first_name, :address, :number, :comments
end
