class SessionsController < ApplicationController

	def create
		student = Student.find_by(email: params[:email])
		if !student || !student.authenticate(params[:password])
			render json: { errors: "Invalid email or password." }, status: 400 and return
		end

		userSessionData = UserSessionDatum.new(student_id: student.id, notifications_token: user_session_params[:notifications_token], platform: user_session_params[:platform])
		if userSessionData.save
			render json: payload(student, userSessionData)
		else
			render json: { errors: userSessionData.errors.full_messages.join("and") }, status: 400
		end		
	end

	private
  def payload(student)
    return nil unless student and student.id
    {
      auth_token: JsonWebToken.encode({student_id: student.id}),
      user: {id: student.id, email: student.email}
    }
  end

	def payload(student, user_session_datum)
    return nil unless student and student.id
    data = {
      auth_token:  "Bearer " + JsonWebToken.encode({ student_id: student.id, user_session_datum_id: user_session_datum.id })
    }
    data.merge({ "student" => student })
  end

  def user_session_params
    params.permit(:notifications_token, :platform)
  end

end
