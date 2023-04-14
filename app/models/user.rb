class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image, :dependent => :destroy

  def image_as_thumbnail
    image.variant(resize_to_limit: [300, 300]).processed
  end
end
