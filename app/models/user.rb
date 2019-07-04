class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #
  ## Association
  #
  has_many :todo_lists, dependent: :destroy
  has_many :posts, dependent: :destroy
  #
  ## Validation
  #
  validates :name,  presence: true
  validates :city,  presence: true

  #
  ## Authentication Token Generator
  #
  def generate_token
    self.auth_token = Devise.friendly_token
  end

  def to_hash
    {
      id: id,
      name: self.name.camelcase,
      auth_token: auth_token,
      city: city
    }
  end
end
