class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    
# This can be used to do application wide not found errors, but unneeded
    # rescue_from ActiveRecord::RecordNotFound, with: :not_found
#     protected



    # def not_found(exception)
    #     render json: {status: "error", code:404, message: "Record not found" }, status: :not_found
    # end
end