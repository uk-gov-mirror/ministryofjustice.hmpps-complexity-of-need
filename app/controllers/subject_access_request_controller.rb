# frozen_string_literal: true

class SubjectAccessRequestController < ApplicationController
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def show
    return multiple_identifiers if params[:prn].present? && params[:crn].present?
    return wrong_identifier if params[:crn].present?

    @complexities = Complexity.where(offender_no: params[:prn]).order(created_at: :asc)
    return not_found if @complexities.none?

    if params[:fromDate].present? && params[:toDate].present?
      @complexities = @complexities.where("DATE(created_at) BETWEEN ? AND ?",
                                          Date.parse(params[:fromDate]),
                                          Date.parse(params[:toDate]))
    end
  end

private

  def not_found
    head :no_content
  end

  def multiple_identifiers
    message = "Cannot supply both CRN and PRN"
    render json: { developerMessage: message, errorCode: 1, status: 500, userMessage: message }, status: "500"
  end

  def wrong_identifier
    message = "Must supply PRN"
    render json: { developerMessage: message, errorCode: 2, status: 209, userMessage: message }, status: "209"
  end
end
