class Api::V1::UsersController < Api::V1::BaseController
  def create

    puts "...."
    encoded_sig, payload = get_params[:signed_request].split(".")
    sig = encoded_sig.tr('-_','+/').unpack('m')[0]
    expected_sig = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), ENV['APP_SECRET'], payload)

    if sig != expected_sig
      puts "ALL BAD"
      return render json: { error: "Not :)"}
    end
    puts "All ok"

    user = User.find_or_create_by(psid: get_params[:psid])
    facebook_service = FacebookService.new
    response = facebook_service.get_profile(user)
    # puts response.body, response.code, response.message, response.headers.inspect
    parsed_response = JSON.parse(response, symbolize_names: true)

    first_name = parsed_response[:first_name]
    last_name = parsed_response[:last_name]
    profile_picture = parsed_response[:profile_pic]
    locale = parsed_response[:locale]
    timezone = parsed_response[:timezone]
    gender = parsed_response[:gender]

    user.first_name = first_name
    user.last_name = last_name
    user.profile_picture_url = profile_picture
    user.address = locale
    user.timezone = timezone

    user.save!
      # create user && save
      # store the user as current
    # if tid exists
      # if membership exists
        # do shit
      # else
        # add membership for that group
    # if tid !exist
      # create group and add membership

    # Some redirects
    head :no_content, status: :created
  end

  private

  def get_params
    params.require(:user).permit(:psid, :tid, :thread_type, :signed_request)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
