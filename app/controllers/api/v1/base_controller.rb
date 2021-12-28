module Api
  module V1
    class BaseController < ApplicationController
      include ApiResponse
      include ExceptionHandler
      before_action :locale

      private
      def locale
        I18n.locale = :en
      end

    end
  end
end
