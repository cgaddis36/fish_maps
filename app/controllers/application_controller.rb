class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :us_states

 def current_user
   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
 end

 def us_states
     @us_states = [
       ['Alabama', 'AL'],
       ['Alaska', 'AK'],
       ['Arizona', 'AZ'],
       ['Arkansas', 'AR'],
       ['California', 'CA'],
       ['Colorado', 'CO'],
       ['Connecticut', 'CT'],
       ['Delaware', 'DE'],
       ['District of Columbia', 'DC'],
       ['Florida', 'FL'],
       ['Georgia', 'GA'],
       ['Hawaii', 'HI'],
       ['Idaho', 'ID'],
       ['Illinois', 'IL'],
       ['Indiana', 'IN'],
       ['Iowa', 'IA'],
       ['Kansas', 'KS'],
       ['Kentucky', 'KY'],
       ['Louisiana', 'LA'],
       ['Maine', 'ME'],
       ['Maryland', 'MD'],
       ['Massachusetts', 'MA'],
       ['Michigan', 'MI'],
       ['Minnesota', 'MN'],
       ['Mississippi', 'MS'],
       ['Missouri', 'MO'],
       ['Montana', 'MT'],
       ['Nebraska', 'NE'],
       ['Nevada', 'NV'],
       ['New Hampshire', 'NH'],
       ['New Jersey', 'NJ'],
       ['New Mexico', 'NM'],
       ['New York', 'NY'],
       ['North Carolina', 'NC'],
       ['North Dakota', 'ND'],
       ['Ohio', 'OH'],
       ['Oklahoma', 'OK'],
       ['Oregon', 'OR'],
       ['Pennsylvania', 'PA'],
       ['Puerto Rico', 'PR'],
       ['Rhode Island', 'RI'],
       ['South Carolina', 'SC'],
       ['South Dakota', 'SD'],
       ['Tennessee', 'TN'],
       ['Texas', 'TX'],
       ['Utah', 'UT'],
       ['Vermont', 'VT'],
       ['Virginia', 'VA'],
       ['Washington', 'WA'],
       ['West Virginia', 'WV'],
       ['Wisconsin', 'WI'],
       ['Wyoming', 'WY']
     ]
 end
end
