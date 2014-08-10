ActiveAdmin.register Invoice do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column "Customer" do |invoice|
      label_tag(invoice.user.email)
    end
    column "Staff" do |invoice|
      invoicedetail = invoice.invoicedetails.first
      project = invoicedetail.project
      user = project.user
      label_tag(user.email)
    end
    column :from_date
    column :end_date
    column 'Status' do |invoice|
      if invoice.status
        link_to( image_tag("../assets/yes.png"), admin_change_invoice_status_path(:id => invoice.id),
          title: "Click to suspend invoice", rel: "tooltip")
      else
        link_to( image_tag("../assets/no.png"), admin_change_invoice_status_path(:id => invoice.id),
          title: "Click to active invoice", rel: "tooltip")
      end
    end

  end

  controller do
    def change_invoice_status
      @invoice = Invoice.find(params[:id])
      if @invoice.status
        @invoice.status = false
      else
        @invoice.status = true
      end
      @invoice.save
      respond_to do |format|
        format.html { redirect_to "/admin/invoices" }
      end
    end

  end


end
