class JobsController < ApplicationController
  def index
    if owner?
      jobs = Job.where(user_id: params[:user_id])
      @jobs = sort_by_status(jobs)
    else
      redirect_to root_path
      flash[:notice] = "Seu pilantra"
    end
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @job = Job.new
    @job.user = current_user
    @job.offer = @offer
    @job.date = "25/08/2021"
    @job.final_cost = @offer.price_per_hour
    @offer.status = "accepted"
    @offer.save
    if @job.save
      flash[:alert] = "Yay! 🎉 you successfully created the job"
      redirect_to user_job_path(@job.user, @job)
    else
      redirect_to offer_path
    end
  end

  def show
    if owner?
      @job = Job.find(params[:id]) if owner?
    else
      redirect_to root_path
      flash[:notice] = "Seu pilantra"
    end
  end

  def mark_as_done
    change_status("finished", "concluded")
  end

  def mark_as_canceled
    change_status("cancelled", "available")
  end

  private

  def owner?
    user = User.find(params[:user_id])

    user == current_user
  end

  def change_status(job_status, offer_status)
    if owner?
      @job = Job.find(params[:id])
      @job.status = job_status
      @job.offer.status = offer_status
      @job.offer.save
      if @job.save
        redirect_to user_jobs_path(current_user)
        flash[:alert] = "Job of nº#{@job.id} #{job_status} successfully!"
      end
    end
  end

  def sort_by_status(jobs)
    array_sorted = []
    jobs.each do |job|
      if job.status == "accepted"
        array_sorted.unshift(job)
      else
        array_sorted.push(job)
      end
    end
    array_sorted
  end
end
