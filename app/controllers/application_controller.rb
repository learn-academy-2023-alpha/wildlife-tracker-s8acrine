class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    protected




    def invalid_record(exception)
        render json: exception.record.errors, status: :unprocessable_entity
    end

    def not_found(exception)
        render json: {status: "error", code:404, message: "Record not found" }, status: :not_found
    end
end