class User < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true

  has_many :posts, dependent: :destroy
  has_secure_password

  def new_posts
    posts.order(id: :desc)
  end

  def self.update_or_create(auth_info)
    user = User.find_by(uid: auth_info[:uid]) || User.new
    user.attributes = { uid: auth_info[:uid],
                        email: auth_info[:info][:email],
                        name: auth_info[:info][:name],
                        google_token: auth_info[:credentials][:token],
                        password: SecureRandom.hex(8).to_s }
    user.save!
    user
  end
end
