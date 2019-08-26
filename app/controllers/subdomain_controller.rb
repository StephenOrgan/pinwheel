class SubdomainController < ApplicationController

	def get
		subdomains = Account.pluck(:subdomain)
  end

	private

	def not_found
		render json: { error: "Could not find a domain" }, status: :not_found
	end

end
