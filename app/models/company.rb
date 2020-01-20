class Company < ApplicationRecord

  around_create :on_creation
  validates_uniqueness_of :name
  validates_presence_of :name

  def builder
    @builder ||= ::CompanyBuilder.new self
  end

  def on_creation
    builder.before_create
    yield
    builder.after_create
  end

  def current_tenant!
    Apartment::Tenant.switch!(tenant)
    # setup company tenant locale here
    # I18n.locale = country.try(:locale) || :en
    Apartment::Tenant.current
  end

  class << self
    def tenant(id = nil)
      return current if id.nil?
      model = find id
      model.current_tenant!
      return model
    end

    def current
      Rails.cache.fetch "company-#{current_tenant}", expires_in: 1.hour do
        find_by tenant: current_tenant
      end
    end

    def current_tenant
      Apartment::Tenant.current
    end
  end
end
