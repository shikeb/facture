class InvoicesController < ApplicationController
  # this will call the Invoice.find(params[:id]) before every method mentioned below
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # Loads the first page with simple form of invoice    
  def index
    @page_name = 'Invoice History'
    @invoices = Invoice.all
  end

  def show
    invoice_number = @invoice.invoice_number
    @page_name = "INVOICE ##{invoice_number}"

    respond_to do |format|
            format.html
            format.pdf do
                render pdf: "Invoice No. #{@invoice.id}",
                page_size: 'letter',
                template: "invoices/show.html.erb",
                layout: "pdf.html.erb",
                orientation: "Landscape",
                lowquality: true,
                # viewport_size: '1280x1024',
                zoom: 1,
                dpi: 75
                # user_style_sheet:"https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
                # show_as_html: true
            end
    end
  end

  def new
    @page_name = 'Create Invoice'
    @invoice = Invoice.new
  end

  def edit
    @page_name = 'Update Invoice'
  end

  def destroy
    @invoice.destroy
		redirect_to invoices_path
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      flash[:notice] = "Invoice created successfully"
      redirect_to @invoice
    else
      # render 'new'
      # redirect_to :action => "new"
    end
  end

  def update
    if @invoice.update(invoice_params)
      flash[:notice] = "Invoice updated successfully"
      redirect_to @invoice
    else
      render 'edit'
    end
  end


  def generate_pdf
    pdf = WickedPdf.new.pdf_from_url('https://github.com/mileszs/wicked_pdf')
  end
  
  #anything below this will be considered private
  private

  def set_invoice
      @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:company_name, :merchant_name, :merchant_email, :merchant_phone, :invoice_number, :currency, :due_date, :customer_name, :customer_email, :amount, :note)
  end
  
  
end
