module RolesType
  @@user       = "user"
  @@admin      = "admin"
  @@superadmin = "superadmin"
  @@stdent     = "student"
  def self.all_roles
    [ @@user, @@admin, @@superadmin, @@stdent]
  end

  def self.only_admin_and_super_admin
    [@@admin, @@superadmin]
  end
  def self.super_admin
    [@@admin, @@superadmin]
  end
end