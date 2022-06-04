# frozen_string_literal: true

class RedirectsController < ApplicationController
  def redirect
    shortlink = Shortlink.find_by!(back_half: params[:back_half], deleted: false)

    redirect_to shortlink.destination
  end
end
