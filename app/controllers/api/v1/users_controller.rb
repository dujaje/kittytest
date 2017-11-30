class Api::V1::UsersController < Api::V1::BaseController
  def create

    puts "...."
    encoded_sig, payload = get_params[:signed_request].split(".")
    sig = encoded_sig.tr('-_','+/').unpack('m')[0]
    expected_sig = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), ENV['APP_SECRET'], payload)

    puts "All ok re signature"

    puts get_params[:thread_type]

    # Finds or Creates a New User
    user = User.find_or_create_by(psid: get_params[:psid])
    puts '1'

    # If creating New User, Gets Information From Facebook
    facebook_service = FacebookService.new
    puts '2'
    response = facebook_service.get_profile(user)
    puts '3'
    # puts response.body, response.code, response.message, response.headers.inspect
    parsed_response = JSON.parse(response, symbolize_names: true)
    puts '4'
    # gender = parsed_response[:gender]

    user.first_name = parsed_response[:first_name]
    user.last_name = parsed_response[:last_name]
    user.profile_picture_url = parsed_response[:profile_pic]
    user.address = parsed_response[:locale]
    user.timezone = parsed_response[:timezone]
    # Saves User with all data
    puts "hello1"
    user.save!
    puts "hello2"
    # Finds or Creates a New Group
    group = Group.find_by(tid: get_params[:tid])

    if group
      if group.kitty_created
        if user.first_sign_in
          puts "we are in the if"
          user.first_sign_in = false
          puts user.first_sign_in
          user.save
          url = Rails.application.routes.url_helpers.extension_info_url(user_id: user.id, group_id: group.id)
        else
          puts "we are in the else"
          url = Rails.application.routes.url_helpers.extension_group_url(group, user_id: user.id, group_id: group.id)
          puts "1 #{url}"
        end
      else
        user.first_sign_in = false
        user.save
        url = Rails.application.routes.url_helpers.extension_create_kitty_url(user_id: user.id, group_id: group.id)
        puts "2 #{url}"
      end
    else
      group = Group.create(tid: get_params[:tid], name: "Your Kitty")
      group.thread_type = get_params[:thread_type]
      url = Rails.application.routes.url_helpers.extension_create_kitty_url(user_id: user.id, group_id: group.id)
      puts "3 #{url}"
    end

    if get_params[:thread_type] == "USER_TO_PAGE"
      puts "4 in user_to_page"
      url = Rails.application.routes.url_helpers.extension_user_url(user)
      puts "4 #{url}"
    else
      # Finds or Creates a Membership
      Membership.find_or_create_by(group: group, user: user)
    end

    puts "*** #{url} ***"

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
