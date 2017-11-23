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
    head :no_content, status: :created


    if User.where(get_params[:psid]).empty?
      # call fb api to get profile data
      # create user && save
    else
      User.where(get_params[:psid])
      # store the user as current
    end
    # if tid exists
      # if membership exists
        # do shit
      # else
        # add membership for that group
    # if tid !exist
      # create group and add membership

    # Some redirects
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
