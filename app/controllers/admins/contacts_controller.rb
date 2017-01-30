class Admins::ContactsController < Admins::BaseController
  before_action :set_contact, only: [:show, :destroy, :set_subscribe_flag]

  # GET /contacts
  def index
    @contacts = Contact.all.order('created_at DESC')
  end

  # GET /contacts/1
  def show
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to admins_contacts_path, notice: 'Contact was successfully destroyed.'
  end

  # POST /contacts/1/set_subscribe_flag
  def set_subscribe_flag
    @contact.is_subscribed = !@contact.is_subscribed
    if @contact.save
      notice_message = 'Email has been successfully to '
      notice_message += @contact.is_subscribed ? 'subscribe' : 'unsubscribe'
    else
      notice_message = 'Failed to set subscribe flag'
    end
    redirect_to :back, notice: notice_message
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      id = params[:id] || params[:contact_id]
      @contact = Contact.find(id)
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:name, :email, :message, :is_subscribed)
    end
end
