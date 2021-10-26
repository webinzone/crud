Single Image Upload
  Active Storage allows you to easily handle the file uploading either to cloud like Amazon S3, Google Cloud Storage or in your Application directory and linking it with the Active  Record models. Here upload single image using active storage.

1. Install gem 'mini_magick', '~> 4.8'
2. Create CRUD 
3. Install active storage
       rails active_storage:install
4. To store the attachment we need to create a Model and add Active Storage relationship
     has_one_attached:image (If single image)
5. Inside Controller permit image params
    def permitted_params
    	params.require(:product).permit(:name, :cost, :description, :image)
		end
6. Add a Image Upload field in form
  <div class="row"> 
    <div class="col-md-4">
      <%= f.label :product_image, :class => "form-controll" %>
    </div>
    <div class="col-md-4">
      <%= f.file_field :image, :class => "form-controll" %>
    </div>
  </div>
7. To show the each image
      <% if products.image.attached? %>
        <%= image_tag products.image.variant(resize: "100 x100")%>
      <% end %>
  
Reference :
 * https://medium.com/techcompose/rails-5-2-upload-attachments-using-active-storage-328de96eced7
 * https://phase2online.com/blog/2018/10/03/easily-upload-files-with-active-storage-in-rails-5-2/# crud
