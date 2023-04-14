class UserSerializer < ActiveModel::Serializer
  attributes :id

  def attributes(*args)
    data = super
    data[:name] = object.full_name.nil? ? "" : object.full_name
    data[:email] = object.email
    data[:first_name] = object.first_name.nil? ? "" : object.first_name
    data[:last_name] = object.last_name.nil? ? "" : object.last_name
    data
  end
end
