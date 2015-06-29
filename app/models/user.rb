class User < ActiveRecord::Base
  # Connects this user object to Hydra behaviors.
  include Hydra::User
  # Connects this user object to Role-management behaviors. 
  include Hydra::RoleManagement::UserRoles
  # Connects this user object to Sufia behaviors. 
  include Sufia::User
  include Sufia::UserUsageStats

  has_many :user_groups
  has_many :my_groups, through: :user_groups, source: :group

  # devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      # @user = User.find_or_create_by(email: data['email'])
      @user = User.find_by(email: data['email'])
      # XXX Find better place to put this e.g. omniauth_callbacks_controller.rb
      if @user             
        @user.avatar.download!(data['image'].gsub(/sz\=\d+/, 'sz=300'));
        @user.display_name = data['name']
        @user.save 
      end
      
      return @user
  end

  if Blacklight::Utils.needs_attr_accessible?

    attr_accessible :email, :password, :password_confirmation
  end
  # Connects this user object to Blacklights Bookmarks. 
  include Blacklight::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :rememberable, :trackable, omniauth_providers: [:google_oauth2]


  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    email
  end

  def groups
    return my_groups
  end


end
