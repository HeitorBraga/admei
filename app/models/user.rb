class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, , :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_one :employees, dependent: :destroy
  has_one :permissions, dependent: :destroy

  def jwt_payload
    { id: id }
  end

  def name_with_id
    "#{email} (#{id})"
  end

  def name
    email
  end
end
