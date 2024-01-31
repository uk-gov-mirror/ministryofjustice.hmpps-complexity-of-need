# frozen_string_literal: true

class HealthController < ApplicationController
  def index
    render plain: "pong"
  end
end
