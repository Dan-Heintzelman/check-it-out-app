class BillController < ApplicationController

  def index
    @bills = Bill.all
  end

  def new
    @bill = Bill.new
  end

  def create
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
  end


end
