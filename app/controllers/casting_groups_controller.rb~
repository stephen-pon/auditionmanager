class CastingGroupsController < ApplicationController

  def index
    @casting_groups = CastingGroup.all
  end

  def new
    @casting_group = CastingGroup.new
  end

  def create
    @casting_group = CastingGroup.new()
    if @casting_group.save
      redirect_to @casting_group
    else
      render 'index'
    end
  end

  def show
    @casting_group = CastingGroup.find(params[:id])
    @casting_group_id = @casting_group.id
    auditionee_list = Array.new
    for int in @casting_group.group_order do
      auditionee_list.push(Auditionee.find_by_id(int))
    end
    @auditionees = auditionee_list
  end

  def add_auditionee
    @casting_group = CastingGroup.find(params[:id])
    curr_auditionee = params[:auditionee_id]
    found_auditionee = Auditionee.find_by_id(curr_auditionee)
    if found_auditionee == nil
      flash[:notice] = "Warning: Casting number doesn't exist"
    elsif found_auditionee.casting_group_id != nil
      flash[:notice] = "Warning: The person with this casting number already belongs to a casting group"
    else
      @casting_group.auditionees << found_auditionee
      @casting_group.group_order.push(found_auditionee.id)
      @casting_group.save()
    end
    redirect_to @casting_group
  end

  def remove_auditionee
    curr_casting_group = CastingGroup.find_by_id(params[:group_num])
    curr_auditionee = Auditionee.find_by_id(params[:auditionee_id])
    curr_casting_group.group_order.delete(curr_auditionee.id)
    curr_casting_group.auditionees.delete(curr_auditionee)
    curr_casting_group.save()
    redirect_to curr_casting_group
  end

  def add_video
    @casting_groups = CastingGroup.all
    curr_casting_group = CastingGroup.find_by_id(params[:group_num])
    curr_casting_group.video = params[:video]
    curr_casting_group.save()
    render 'index'
  end

  def remove_video
    @casting_groups = CastingGroup.all
    curr_casting_group = CastingGroup.find_by_id(params[:group_num])
    curr_casting_group.video = nil
    curr_casting_group.save()
    render 'index'
  end
end
