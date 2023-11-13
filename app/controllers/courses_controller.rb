class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @student_names = @course.students.pluck(:name)
  end

  def enroll
    @course = Course.find(params[:id])
    @student_id = StudentCourse.find(params[student_id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params.require(:course).permit(:name, :duration))
    if @course.save
    flash[:notice] = "Course is created successfully."
    redirect_to @course
    else 
      render 'new'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  def edit
     @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(params.require(:course).permit(:name, :duration))
      redirect_to @course
    else
      render :edit
    end
  end
end