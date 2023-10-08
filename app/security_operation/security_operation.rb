module SecurityOperation
  def check_user_roles(roles)
    if roles.kind_of?(Array)
      @user_roles = UserRole.where(user: current_user)
        @user_roles.each do |user_role|
          if roles.include? user_role.role.name
            return
          end
        end
    else
      raise Exeption.new "You must give an array as parameter"
    end
    render json: {message: "You don't have outharization"}, status: 401
  end
end