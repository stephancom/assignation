# base Policy for others to inherit from
class ApplicationPolicy
  attr_reader :admin, :record

  def initialize(admin, record)
    @admin = admin
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  # base policy Scope for inheritance
  class Scope
    attr_reader :admin, :scope

    def initialize(admin, scope)
      @admin = admin
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
