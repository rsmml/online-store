class Api::V1::PagesController < ApplicationController
  def home
    render json: { status: 'home page' }
  end
end
