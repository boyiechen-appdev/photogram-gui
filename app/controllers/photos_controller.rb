class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.first

    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show.html.erb" })
    end
  end

  def delete
    the_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.first
    the_photo.destroy

    # render({ :template => "photo_templates/delete.html.erb" })
    redirect_to("/photos")
  end

  # insert_photo_record?input_image=a&input_caption=b&input_owner_id=c
  def create
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  # Started GET "/update_photo/785?input_image=https%3A%2F%2Frobohash.org%2Fmodieumvoluptate.png%3Fsize%3D300x300%26set%3Dset1&input_caption=try" for 172.225.24.108 at 2023-05-02 04:29:24 +0000
  def update
    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.at(0)
    the_photo.image = params.fetch("input_image")
    the_photo.caption = params.fetch("input_caption")

    the_photo.save

    redirect_to("/photos/" + the_id.to_s)
  end

  def create_comment
    # /insert_comment_record?input_photo_id=785&input_author_id=23&input_body=fewfw
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")

    # the_photo = Photo.where({ :id => input_photo_id }).first
    # the_photo.comment
    a_new_comment = Comment.new
    a_new_comment.photo_id = input_photo_id
    a_new_comment.author_id = input_author_id
    a_new_comment.body = input_body
    a_new_comment.save

    redirect_to("/photos/"+ input_photo_id.to_s)
  end
end
