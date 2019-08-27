class Account < ApplicationRecord
    RESTRICTED_SUBDOMAIN = %w(www)
  	has_many :users, dependent: :destroy
    validates :name, presence: true
    validates :subdomain, presence: true,
                            uniqueness: { case_sensitive: false},
                            format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters' },
                            exclusion: {in: RESTRICTED_SUBDOMAIN, message: 'restricted'}

    before_validation :downcase_account

    private
        def downcase_account
            self.subdomain = subdomain.try(:downcase)
        end
    # after_commit :create_account_schema, on: :create
end
