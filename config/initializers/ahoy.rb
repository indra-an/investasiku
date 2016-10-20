class Ahoy::Store < Ahoy::Stores::ActiveRecordTokenStore
  def user
    controller.current_admin
  end
end
