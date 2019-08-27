class User < ApplicationRecord
	has_secure_password
	belongs_to :account

	devise :registerable,
        :recoverable, :rememberable, :trackable, request_keys: [:subdomain]

	# accepts_nested_attributes_for :account
	acts_as_tenant(:account)
	validates_uniqueness_to_tenant :email
	private

	def self.find_for_authentication(warden_conditions)
		where(:email => warden_conditions[:email], :subdomain => warden_conditions[:subdomain]).first
 	end
end
