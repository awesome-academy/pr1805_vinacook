class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token
  before_save :downcase_email
  before_create :create_activation_digest
  has_many :orders
  has_many :rates
  has_many :comments
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  class << self

    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end

  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

<<<<<<< HEAD
  def authenticated? attribute, token
=======
  def authenticated?(attribute, token)
>>>>>>> 4e4a665... account_activation
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

    def activate
<<<<<<< HEAD
    update_attribute :activated,    true
    update_attribute :activated_at, Time.zone.now
=======
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
>>>>>>> 4e4a665... account_activation
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  private
  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end

