class Zombie < ActiveRecord::Base
  #scope :rotting, where(rotting: true)
  scope :fresh, -> { where("age < 30") }
  scope :rotting, -> { where(rotting: true) }
  scope :recent, -> { order("created_at desc").limit(1) }

  before_save :make_rotting, :add_role
  after_save :add_brains

  def make_rotting
    self.rotting = true if age > 20
  end

  def add_role
    if age > 25
      self.roles << Role.find_by_title("Captain")
    else
      self.roles << Role.find_by_title("Solider")
    end
  end

  def add_brains
    self.create_brain(status: "New", flavor: "chocolate")
  end

  has_one :brain, dependent: :destroy
  has_many :assignments
  has_many :roles, through: :assignments
  has_many :tweets
end
