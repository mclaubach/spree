class User < ActiveRecord::Base
  has_many :events
  has_many :bids
  has_many :results
  has_one :user_counter
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create :create_counter!

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  def create_counter!
    UserCounter.create(user_id: self.id)
  end
end
