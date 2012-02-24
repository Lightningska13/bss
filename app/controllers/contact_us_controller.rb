class ContactUsController < ApplicationController
  before_filter :require_user, :except => [:new, :create]
	
  def new
    @contact_us = ContactUs.new
  	@page_title = "Contact  #{SITE_NAME}"
  end

  def create
    @contact_us = ContactUs.new(params[:contact_us])
  	@page_title = "Contact  #{SITE_NAME}"

    if @contact_us.valid?
      ContactUsMailer.send_confirmation(@contact_us).deliver
      flash[:notice] = 'Thank you. Your message has been sent.'
      redirect_to :action  => :new
    else
      render :action => "new"
    end
  end
  
end