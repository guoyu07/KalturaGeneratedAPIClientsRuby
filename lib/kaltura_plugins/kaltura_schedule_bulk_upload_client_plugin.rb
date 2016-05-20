# ===================================================================================================
#                           _  __     _ _
#                          | |/ /__ _| | |_ _  _ _ _ __ _
#                          | ' </ _` | |  _| || | '_/ _` |
#                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
#
# This file is part of the Kaltura Collaborative Media Suite which allows users
# to do with audio, video, and animation what Wiki platfroms allow them to do with
# text.
#
# Copyright (C) 2006-2016  Kaltura Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http:#www.gnu.org/licenses/>.
#
# @ignore
# ===================================================================================================
require 'kaltura_client.rb'
require File.dirname(__FILE__) + '/kaltura_bulk_upload_client_plugin.rb'
require File.dirname(__FILE__) + '/kaltura_schedule_client_plugin.rb'

module Kaltura

	class KalturaBulkUploadResultScheduleEvent < KalturaBulkUploadResult
		attr_accessor :reference_id


		def from_xml(xml_element)
			super
			self.reference_id = xml_element.elements['referenceId'].text
		end

	end

	class KalturaBulkUploadResultScheduleResource < KalturaBulkUploadResult
		attr_accessor :resource_id
		attr_accessor :name
		attr_accessor :type
		attr_accessor :system_name
		attr_accessor :description
		attr_accessor :tags
		attr_accessor :parent_type
		attr_accessor :parent_system_name


		def from_xml(xml_element)
			super
			self.resource_id = xml_element.elements['resourceId'].text
			self.name = xml_element.elements['name'].text
			self.type = xml_element.elements['type'].text
			self.system_name = xml_element.elements['systemName'].text
			self.description = xml_element.elements['description'].text
			self.tags = xml_element.elements['tags'].text
			self.parent_type = xml_element.elements['parentType'].text
			self.parent_system_name = xml_element.elements['parentSystemName'].text
		end

	end

	# Represents the Bulk upload job data for iCal bulk upload
	class KalturaBulkUploadICalJobData < KalturaBulkUploadJobData
		# The type of the events that ill be created by this upload
		attr_accessor :events_type

		def events_type=(val)
			@events_type = val.to_i
		end

		def from_xml(xml_element)
			super
			self.events_type = xml_element.elements['eventsType'].text
		end

	end


end
