# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy complete confirm]
  before_action :authenticate_manager, only: %i[index complete confirm]

  def index
    @orders = Order.all
  end

  def show; end

  def create
    @order = Order.new(order_params)

    if @order.save
      render :show, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @order

    if @order.update(order_params)
      render :show, status: :ok
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.reject!
  end

  def confirm
    authorize @order

    @order.confirm!

    render :show
  end

  def complete
    authorize @order

    @order.complete!

    render :show
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.fetch(:order, {}).permit(:taco_id, :piquancy, ingredient_options: %i[ingredient_group_id ingredient_id])
  end

  def pundit_user
    current_manager
    # nil # MONKEYPATCH
  end
end
