class User < ApplicationRecord
  include Clearance::User

  def student?
    Student.where(user: self).exists?
  end
end
