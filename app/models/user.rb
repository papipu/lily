class User < ActiveRecord::Base
	validates_presence_of :login, :password, :email
	validates_uniqueness_of :login, :email
  has_attached_file :avatar,
                    :styles => { :medium => "320x320>",
                                 :small => "100x100>" }

	def self.authenticate (login,password)
		user = self.find_by_login(login)
		if user
			if user.password != Digest::MD5.hexdigest(password)
				user = nil
			end
		end
		user
	end
end