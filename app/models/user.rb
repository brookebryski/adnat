class User < ApplicationRecord

   belongs_to :organisation,  optional: true
   has_many :shifts
   

    validates :name, presence: true
    validates :email, presence: true
    

    has_secure_password

end
