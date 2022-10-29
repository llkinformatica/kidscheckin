class Checkin < ApplicationRecord
    belongs_to :usuario, primary_key: 'uid', 
                         foreign_key: 'uid'  
end
