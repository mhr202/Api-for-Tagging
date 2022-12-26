module ExceptionHandler
  extend ActiveSupport::Concern
  class DuplicateRecordError < StandardError
  end

  included do
    rescue_from ActiveRecord::RecordNotFound do |_e|
      render json: { message: 'Record not found.' }, status: :not_found
    end

    rescue_from ActionController::ParameterMissing do |_e|
      render json: { message: 'Unprocessable Entity, missing parameter.' }, status: :unprocessable_entity
    end
  end
end
