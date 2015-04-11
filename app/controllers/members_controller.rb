
class MembersController < ApplicationController

  def index
    @members = Member.hash_tree
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new(parent_id: params[:parent_id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    if params[:member][:parent_id].to_i > 0
      parent = Member.find_by_id(params[:member].delete(:parent_id))
      @member = parent.children.build(member_params)
    else
      @member = Member.new(member_params)
    end

    if @member.save
      redirect_to @member
    else
      render 'new'
    end

  end

  def update
    @member = Member.find(params[:id])

    @member.update(member_params)
    redirect_to @member
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to members_path
  end

  private
  def member_params
    params.require(:member).permit(:name, :age, :company, :money)
  end
end
