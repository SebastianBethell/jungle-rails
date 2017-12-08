class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: Rails.configuration.admin[:admin_name], password: Rails.configuration.admin[:admin_pass]

  def show
  end
end
