class User < ApplicationRecord
  include Clearance::User

  has_one :student
  
  def student?
    Student.where(user: self).exists?
  end
end
