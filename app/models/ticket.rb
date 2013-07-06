class Ticket < ActiveRecord::Base
  attr_accessible :description, :title

  def update_description(newInfo) 
    self.description = newInfo << "\n" << self.description
    self.save
  end
end
