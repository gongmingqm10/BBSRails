class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :email, type: String
  field :role, type: String, default: 'guest'
  field :password, type: String

  validates_presence_of :username, :password
  validates_uniqueness_of :username
  validates_inclusion_of :role, in: %w(guest admin)

  class << self
    def authenticate(username, password)
      user = find_by(username: username, password: password)
      if user
        user
      end
    end
  end
end
