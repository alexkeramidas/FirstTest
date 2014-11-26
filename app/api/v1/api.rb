module FirstTest
  class API < Grape::API

    version 'v1', using: :header, vendor: 'firsttest'
    format :json

=begin    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      def authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end
    end
=end

    resource :users do

      desc 'Return the collection of users'
      get do

        {users: User.all.as_json(only:[:id, :name, :email])}

      end

      desc 'Return a specific user'
      get ':id' do

        {user: User.where(id:params[:id]).as_json(only:[:id, :name, :email])}

      end


      desc 'Post a new user'
      params do
        requires :email, type: String
        requires :password, type: String
        requires :password_confirmation, type: String
      end

      post 'signup' do
        User.create! ({
                         email: params[:email],
                         password: params[:password],
                         password_confirmation: params[:password_confirmation],

                     })
        status 201
      end

      desc 'Sign in user'
      params do
        requires :email, type: String
        requires :password, type: String
      end

      post 'signin' do
        @user = User.new
        @user.email = params[:email] if params[:email]
        @user.password = params[:password] if params[:password]

        status 201
      end
    end
  end
end