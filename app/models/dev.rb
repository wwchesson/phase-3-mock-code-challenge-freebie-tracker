class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
       if self.freebies.where(item_name: item_name) 
        true
       else
        false
       end
    end

    def give_away(dev, freebie)
       freebie.update(dev: dev) unless freebie.dev != self
    end
end
