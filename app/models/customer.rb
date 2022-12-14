class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :addresses
  has_many :orders

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :telephone_number, presence: true

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end

