# frozen_string_literal: true

# class ApplicationController
class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
end
