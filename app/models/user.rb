class User < ApplicationRecord
	has_secure_password
	belongs_to :account

	accepts_nested_attributes_for :account
	after_initialize :set_account
	acts_as_tenant(:account)
	validates_uniqueness_to_tenant :email
	private


end
