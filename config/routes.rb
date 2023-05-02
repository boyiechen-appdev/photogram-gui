Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })

  # Users
  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/insert_user_record", { :controller => "users", :action => "create" })

  get("/update_user/:user_id", { :controller => "users", :action => "update" })

  # Photos
  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete" })

  get("/insert_photo_record", { :controller => "photos", :action => "create" })

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update" })

  get("/insert_comment_record", { :controller => "photos", :action => "create_comment" })
end
