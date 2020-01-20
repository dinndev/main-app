class CompanyBuilder
  attr_accessor :company

  class SchemaMigrationTableMissing < StandardError; end

  def initialize(company)
    self.company = company
  end

  def before_create
    create_tenant
  end

  def after_create
    # return true if Rails.env.test?
    true
  end

  def create_tenant
    # return false if company.class.connection.schema_exists? company.tenant

    company.tenant = company.name.gsub(" ", "_").downcase
    Apartment::Tenant.create(company.tenant)

    # we need to ensure that the tenant.schema_migrations table is created, very important during the migrations!
    raise SchemaMigrationTableMissing.new(company.tenant) if not company.class.connection.table_exists? "#{company.tenant}.schema_migrations"

    # TODO: create_talkpush_subdomain!
  end

end
