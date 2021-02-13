class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to contacts_thanks_path
    else
      flash.now[:alert] = "入力内容をもう一度確認してください"
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :title, :email, :message)
  end
end
