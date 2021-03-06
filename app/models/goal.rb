class Goal < ActiveRecord::Base
  validates :user_id, :name, presence: true
  validates_inclusion_of :public_bool, in: %w(true false)

  before_save :default_value

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :cheers

  def default_value
    self.public_bool ||= "true"
  end


end
