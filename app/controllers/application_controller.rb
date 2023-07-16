# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :set_active_storage_host

    private
  
    def set_active_storage_host
      ActiveStorage::Current.host = request.base_url
    end
end