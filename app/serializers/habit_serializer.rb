class HabitSerializer < ActiveModel::Serializer
    attributes :id, :title, :day_count, :user_id, :days
end