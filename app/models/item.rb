class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :orders, through: :order_details

  has_one_attached :image
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  # refileの記述
  # attachment :image

  validates :introduction, presence: true
  validates :name, presence: true
  validates :genre, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
