# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :set_active_storage_host

    private
  
    def set_active_storage_host
      host = ENV["RAILS_ENV"] === "production" ? "https://railsec-75428b027bab.herokuapp.com" : "localhost:3000"
      ActiveStorage::Current.host = host
      ActiveStorage::Current.url_options = { host: host }
    end
end