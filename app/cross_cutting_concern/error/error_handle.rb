module Error
  module ErrorHandle
    extend ActiveSupport::Concern
    include Log::FileLogger 

    included do
      rescue_from Exception, with: :error_handle
      rescue_from ActiveRecord::RecordNotFound, with: :error_handle_not_found
      rescue_from ActionController::RoutingError, with: :error_handle_not_found

      def error_handle(exception)
        log_error_to_file(exception)
        render json: {message: exception }, status: 500
      end

      def error_handle_not_found(exception)
        log_error_to_file(exception)
        render json: {message: exception }, status: 500
      end
    end
  end
end