class ProviderSetting < ActiveRecord::Base
  include ClassyEnum::ActiveRecord

  classy_enum_attr :provider

  # serialize :options, Infl::Mashed
  serialize :options, PsOptionsSerializer

  scope :oauth, -> { where(use_for_oauth: true) }

  validates_associated :provider

  delegate :to_sym, :to_s, to: :provider

  def self.for_provider(provider)
    where(provider: provider)
  end


  delegate :to_s, to: :provider

  def provider=(provider)
    self[:provider] = provider
  end


  private

  
end