class AccountCreator
  include Sidekiq::Worker
  sidekiq_options queue: :low

  def perform(subdomain, admin_attrs)
    admin_attrs = (admin_attrs || {}).with_indifferent_access

    account = Account.find_by(subdomain: subdomain)
    if account && account.pending?

      unless Rails.env.test? # PG will cause error and abort transaction so don't try to run
        begin
          Account.drop(account.subdomain)
        rescue
          nil
        end
      end

      Account.create(account.subdomain) do
        account.status = 'created'
        account.account_id ||= "#{account.subdomain}-#{account.id}"
        account.save!
        # install_api
        setup_admin(admin_attrs)
        # send_admin_email(account, admin_attrs)
      end
    end
  end

  private

  def setup_admin(admin_attrs)
    return unless admin_attrs.present?

    params = ActionController::Parameters
      .new(admin_attrs)
      .permit(:first_name, :last_name, :email)
      .merge(type: 'Administrator')

    administrator = ContactCommand::Create.call(params)

  end

#   def send_admin_email(company, admin_attrs)
#     return unless admin_attrs.present?
#     administrator = Corporate.find_by_email(admin_attrs[:email])
#     invitation = administrator.invitations.create! sender: Contact.pinwheel_admin
#     V2::Admin::WelcomeMailer.email(company, invitation).deliver_now
#   rescue Net::SMTPError, ActiveRecord::RecordInvalid => e
#     Honeybadger.notify(e, context: { admin_attrs: admin_attrs, subdomain: account.subdomain })
#   end


#   def install_api
#    Integration.install('pnwl')
#   end
end