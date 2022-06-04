# frozen_string_literal: true

class ShortlinksController < ApplicationController
  include Shortlinks
  include ShortlinkErrorsHandler

  def index
    @shortlinks = FindAllService.new.call
  end

  def show
    @shortlink = FindOneByIdService.new.call(params[:id])
  end

  def new
    @shortlink = Shortlink.new
  end

  def create
    shortlink = CreateService.new.call(save_params)

    redirect_to shortlink
  end

  def edit
    @shortlink = FindOneByIdService.new.call(params[:id])
  end

  def update
    shortlink = UpdateService.new.call(params[:id], save_params)

    redirect_to shortlink
  end

  def destroy
    DeleteOneByIdService.new.call(params[:id])

    redirect_to shortlinks_path
  end

  private

  def save_params
    @save_params ||= params.require(:shortlink).permit(:title, :destination, :back_half)
  end
end
