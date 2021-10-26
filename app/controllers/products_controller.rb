class ProductsController < BaseController

	def index
   	@page_title = "Products | Home"
   	get_collection
	end
	
	def Products
    @products=Product.all
	end

  def new
    new_product
   	@page_title = "Products | New Product"   
	end
	
	def show
		@product=Product.find(params[:id])
	end
	
	def edit
		@product=Product.find(params[:id])
   	@page_title = "Product | Update Product"   	
	end
  
  def create
	 	@product=Product.new(permitted_params)
    if @product.valid?
      @product.save
      set_notification(true, I18n.t('status.success'), I18n.t('success.created', item: "Products"))
	 	else
      message = I18n.t('errors.failed_to_create', item: "Products")     
      set_notification(false, I18n.t('status.error'), message)
	 	end
	end

	def update
    @product=Product.find(params[:id])
	  @product.update(permitted_params)
	  if @product.save
      set_notification(true, I18n.t('status.success'), I18n.t('success.updated', item: "Products"))
		else
      message = I18n.t('errors.failed_to_create', item: "Products")     
      set_notification(false, I18n.t('status.error'), message)
		end
	end
	
  def destroy
		@product=Product.find(params[:id])
		@product.destroy
		redirect_to @product
  end
    
  # --------------
  # Fetch Methods
  # --------------

	private

	def permitted_params
    params.require(:product).permit(:name, :cost, :description, :image, :title, :category, :sale_item, :t_c_accepted)
	end

  def new_product
    @product = Product.new
  end

  def existing_product
    @product = Product.find_by_id(params[:id])
  end

  def get_collection
    @relation = Product.where("")

    apply_filters

    @order_by = "created_at ASC" unless @order_by
    @products = @r_objects = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end

  def initialise_urls
    @wf_refresh_url = root_path
  end


end