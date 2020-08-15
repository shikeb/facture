class InvoicesController < ApplicationController

    # Loads the first page with simple form of invoice    
    def index
        @invoice = Invoice.new
    end

    def show
        
    end

    def new
        
    end

    def create
        @invoice = Invoice.new(params.require(:invoice).permit(:invoice_numb,:description))
			if @invoice.save
				flash[:notice] = "Invoice created successfully"
        redirect_to @invoice
      else
        render 'index'
      end
    end
    
    
    
    
end
