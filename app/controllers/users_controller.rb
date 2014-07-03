class UsersController < ApplicationController

	def index
		@users = User.filter(params[:q])
	end


	def show
		@user = current_user
	end


	# def about
	# 	param(:id)
	# end

	private

	def user_params
    	params.require(:user).permit(:name, :email, :about, :age, :landlord)
    end

end


 # create_table "users", force: true do |t|
 #    t.string   "email",                  default: "", null: false
 #    t.string   "encrypted_password",     default: "", null: false
 #    t.string   "name"
 #    t.text     "about"
 #    t.boolean  "landlord"
 #    t.integer  "age"
 #    t.string   "reset_password_token"
 #    t.datetime "reset_password_sent_at"
 #    t.datetime "remember_created_at"
 #    t.integer  "sign_in_count",          default: 0,  null: false
 #    t.datetime "current_sign_in_at"
 #    t.datetime "last_sign_in_at"
 #    t.string   "current_sign_in_ip"
 #    t.string   "last_sign_in_ip"
 #    t.datetime "created_at"
 #    t.datetime "updated_at"