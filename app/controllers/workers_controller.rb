class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  def index
    @lib = Lib.find(params[:lib_id])
    @workers = @lib.workers.all.paginate page: params[:page], per_page: 20
  end

  def show
  end

  def new
    @lib = Lib.find(params[:lib_id])
    @worker = @lib.workers.new
  end

  def edit
  end

  def create
    @lib = Lib.find(params[:lib_id])
    @worker = @lib.workers.new(worker_params)

    if @worker.save
      redirect_to lib_workers_path, notice: 'Сотрудник успешно добавлен в библиотеку'
    else
      render :new
    end
  end

  def update
    if @worker.update(worker_params)
      redirect_to lib_worker_path, notice: 'Информация о сотруднике успешно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @worker.destroy
    redirect_to lib_workers_path, notice: 'Сотрудник успешно удалён из библиотеки'
  end

  private
    def set_worker
      @lib = Lib.find(params[:lib_id])
      @worker = @lib.workers.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:lastname, :firstname, :fathername, :birthday, 
                                     :workdate, :position, :education, :lib_id)
    end
end
