class EnrollmentsController < ApplicationController
	def create
		student = Student.find(params[:student_id])
		course = Course.find(params[:course_id])

		unless student.courses.include?(course)
			student.courses << course
		end

		redirect_to student_path(student)
	end

	def destroy
		student = Student.find(params[:student_id])
		course = Course.find(params[:course_id])
		student.course.delete(course) if student.course.include?(course)
		redirect_to student_path(student)
	end
end
