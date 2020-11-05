class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profil_show
    set_user
  end

  def profil_update
    set_user
    if @user.update(strong_params)
      redirect_to profil_path(@user)
    else
      redirect_to profil_path(@user)
    end
  end

  def admin
    hash = { worker: 'search_by_fullname_and_matricule',
             user: 'search_by_email',
             position: 'search_by_site_name_worker_full_mane_position_name',
             site: 'search_by_site_name_andclient_name',
             company: 'search_by_company_name_and_city' }

    hash.each { |k, v| params_query_checker(k.to_s, v) }
    
    generate_search_form_variable
  end

  private

  def params_query_checker(model, search_method)
    query = "query_#{model}"
    class_model = model.capitalize.constantize
    models = model.pluralize
    if params[query].present?
      instance_variable_set("@#{models}", class_model.public_send(search_method, params[query]))
    else
      instance_variable_set("@#{models}", class_model.all.order(:id))
    end
  end

  def generate_search_form_variable
    models = [ 'worker', 'site', 'position', 'user', 'company' ]
    hash = {'placeholder' => 'search_a_', 'query' => 'query_'}

    array = []
    models.each do |model|
        newhash = Hash.new
        newhash = hash.transform_keys { |key| key = key + '_' + model }
        newhash = newhash.transform_values { |value| value = value + model }
        array << newhash
    end
    array.each do |newhash|
      newhash.each { |name, value| instance_variable_set("@#{name}", value) }
    end
  end

  def strong_params
    params.require(:user).permit(:photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
