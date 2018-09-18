class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: "jungle", password: "book"
end
