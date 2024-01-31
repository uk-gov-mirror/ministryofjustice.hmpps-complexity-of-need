# frozen_string_literal: true

json.content @complexities do |complexity|
  json.offenderNo complexity.offender_no
  json.extract! complexity, :level
  json.sourceSystem complexity.source_system
  json.sourceUser complexity.source_user
  json.extract! complexity, :notes
  json.createdTimeStamp complexity.created_at
  json.extract! complexity, :active
end
