class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :us_states

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def us_states
    @us_states = [
      %w[Alabama AL],
      %w[Alaska AK],
      %w[Arizona AZ],
      %w[Arkansas AR],
      %w[California CA],
      %w[Colorado CO],
      %w[Connecticut CT],
      %w[Delaware DE],
      %w[District of Columbia DC],
      %w[Florida FL],
      %w[Georgia GA],
      %w[Hawaii HI],
      %w[Idaho ID],
      %w[Illinois IL],
      %w[Indiana IN],
      %w[Iowa IA],
      %w[Kansas KS],
      %w[Kentucky KY],
      %w[Louisiana LA],
      %w[Maine ME],
      %w[Maryland MD],
      %w[Massachusetts MA],
      %w[Michigan MI],
      %w[Minnesota MN],
      %w[Mississippi MS],
      %w[Missouri MO],
      %w[Montana MT],
      %w[Nebraska NE],
      %w[Nevada NV],
      %w[New Hampshire NH],
      %w[New Jersey NJ],
      %w[New Mexico NM],
      %w[New York NY],
      %w[North Carolina NC],
      %w[North Dakota ND],
      %w[Ohio OH],
      %w[Oklahoma OK],
      %w[Oregon OR],
      %w[Pennsylvania PA],
      %w[Puerto Rico PR],
      %w[Rhode Island RI],
      %w[South Carolina SC],
      %w[South Dakota SD],
      %w[Tennessee TN],
      %w[Texas TX],
      %w[Utah UT],
      %w[Vermont VT],
      %w[Virginia VA],
      %w[Washington WA],
      %w[West Virginia WV],
      %w[Wisconsin WI],
      %w[Wyoming WY]
    ]
  end
end
