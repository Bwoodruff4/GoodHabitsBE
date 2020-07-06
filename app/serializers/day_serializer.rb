class DaySerializer < ActiveModel::Serializer
    attributes :id, :day, :checked, :habit_id
end