class UploadPolicy < ApplicationPolicy

  def initialize(admin = nil, record = nil)
    super
    # @admin = admin
    # @record = record
  end

  def index?
    !@admin.nil?
  end

  def create?
    !@admin.nil?
  end

  def update?
    !@record.file.attached?
  end

  def edit?
    true
  end

  class Scope < Scope
    def initialize(admin = nil, scope = nil)
      raise Pundit::NotAuthorizedError if admin.nil?
      super
      # @admin = admin
      # @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
