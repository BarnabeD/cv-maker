class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :check_current_user_admin?, only: :admin

  def home
  end

  def profil_show
    set_user
  end

  def profil_update
    set_user
    @user.update(strong_params) if strong_params
    redirect_to profil_path(@user)
  end

  def admin
    hash = { worker: 'search_by_fullname_and_matricule',
             user: 'search_by_email',
             position: 'search_by_site_name_worker_full_mane_position_name',
             site: 'search_by_site_name_andclient_name',
             company: 'search_by_company_name_and_city' }

    hash.each { |k, v| params_query_checker(k.to_s, v) }
    generate_search_form_variable

    respond_to do |format|
      format.html
      format.json do
        render json:
        {
          workers: @workers.as_json,
          users: @users.as_json,
          positions: @positions.as_json,
          sites: @sites.as_json,
          companies: @companies.as_json
        }
      end
    end
  end

  private

  def params_query_checker(model, search_method)
    included_module_for = { 'workers' => :graduates, 'sites' => :client, 'positions' => [:worker, :company, { site: :client }] }
    query = "query_#{model}"
    class_model = model.capitalize.constantize
    models = model.pluralize
    if params[query].present?
      instance_variable_set("@#{models}", class_model.public_send(search_method, params[query]))
    else
      instance_variable_set("@#{models}", class_model.all.includes(included_module_for[models]).order(:id))
    end
    instance_variable_set("@#{model}_target", model)
  end

  def generate_search_form_variable
    models = ['worker', 'site', 'position', 'user', 'company']
    hash = { 'placeholder' => 'search_a_', 'query' => 'query_' }

    array = []
    models.each do |model|
      newhash = hash.transform_keys { |key| "#{key}_#{model}" }
      array << newhash.transform_values { |value| value + model }
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
