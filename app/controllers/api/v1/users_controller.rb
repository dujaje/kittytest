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

    # Finds or Creates a New User
    user = User.find_or_create_by(psid: get_params[:psid])

    # If creating New User, Gets Information From Facebook
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
    # Saves User with all data
    user.save!

    session[:current_user] = user

    # Finds or Creates a New Group
    group = Group.find_by(tid: get_params[:tid])
    if group
      if group.kitty_created
        url = Rails.application.routes.url_helpers.extension_group_url(group, user_id: user.id, group_id: group.id)
      else
        url = Rails.application.routes.url_helpers.extension_create_kitty_url(user_id: user.id, group_id: group.id)
      end
    else
      group = Group.create(tid: get_params[:tid])
      url = Rails.application.routes.url_helpers.extension_create_kitty_url(user_id: user.id, group_id: group.id)
    end

    # Finds or Creates a Membership
    Membership.find_or_create_by(group: group, user: user)

    # if tid exists
      # if membership exists
        # do shit
      # else
        # add membership for that group
    # if tid !exist
      # create group and add membership
    # Some redirects

    render json: {url: url}, status: :created
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
