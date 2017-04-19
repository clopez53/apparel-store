class RegistrationsController < Devise::RegistrationsController
  def new
    @provinces = Province.all
  end

  def resource_name
    :customer
  end

  def resource
    @customer ||= Customer.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:customer]
  end

   private
   
      def sign_up_params
        params.require(:customer).permit(:first_name, :last_name, :city, :country, :address, :postal_code, :phone_number, :email,
         :province_id, :password, :password_confirmation)
      end

      def account_update_params
        params.require(:customer).permit(:first_name, :last_name, :city, :country, :address, :postal_code, :phone_number, :email,
         :province_id, :password, :password_confirmation, :current_password)
      end
end
