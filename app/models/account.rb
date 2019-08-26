class Account < ApplicationRecord
  	has_many :customers, dependent: :destroy
  	has_many :users, dependent: :destroy
	validates :name, presence: true
    # after_commit :create_account_schema, on: :create
end
