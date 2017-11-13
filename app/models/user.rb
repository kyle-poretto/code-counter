class User < ActiveRecord::Base
    has_secure_password
    has_many :build_sessions
    has_many :user_timers, through: :build_sessions

    def slug
      username.downcase.gsub(" ","-")
    end
      
    def self.find_by_slug(slug)
      User.all.find{|user| user.slug == slug}
    end
end