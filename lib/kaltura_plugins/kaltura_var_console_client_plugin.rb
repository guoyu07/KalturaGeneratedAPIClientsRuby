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

module Kaltura

	class KalturaVarPartnerUsageItem < KalturaObjectBase
		# Partner ID
		attr_accessor :partner_id
		# Partner name
		attr_accessor :partner_name
		# Partner status
		attr_accessor :partner_status
		# Partner package
		attr_accessor :partner_package
		# Partner creation date (Unix timestamp)
		attr_accessor :partner_created_at
		# Number of player loads in the specific date range
		attr_accessor :views
		# Number of plays in the specific date range
		attr_accessor :plays
		# Number of new entries created during specific date range
		attr_accessor :entries_count
		# Total number of entries
		attr_accessor :total_entries_count
		# Number of new video entries created during specific date range
		attr_accessor :video_entries_count
		# Number of new image entries created during specific date range
		attr_accessor :image_entries_count
		# Number of new audio entries created during specific date range
		attr_accessor :audio_entries_count
		# Number of new mix entries created during specific date range
		attr_accessor :mix_entries_count
		# The total bandwidth usage during the given date range (in MB)
		attr_accessor :bandwidth
		# The total storage consumption (in MB)
		attr_accessor :total_storage
		# The added storage consumption (new uploads) during the given date range (in MB)
		attr_accessor :storage
		# The deleted storage consumption (new uploads) during the given date range (in MB)
		attr_accessor :deleted_storage
		# The peak amount of storage consumption during the given date range for the specific publisher
		attr_accessor :peak_storage
		# The average amount of storage consumption during the given date range for the specific publisher
		attr_accessor :avg_storage
		# The combined amount of bandwidth and storage consumed during the given date range for the specific publisher
		attr_accessor :combined_storage_bandwidth
		# Amount of transcoding usage in MB
		attr_accessor :transcoding_usage
		# TGhe date at which the report was taken - Unix Timestamp
		attr_accessor :date_id

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def partner_status=(val)
			@partner_status = val.to_i
		end
		def partner_package=(val)
			@partner_package = val.to_i
		end
		def partner_created_at=(val)
			@partner_created_at = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end
		def plays=(val)
			@plays = val.to_i
		end
		def entries_count=(val)
			@entries_count = val.to_i
		end
		def total_entries_count=(val)
			@total_entries_count = val.to_i
		end
		def video_entries_count=(val)
			@video_entries_count = val.to_i
		end
		def image_entries_count=(val)
			@image_entries_count = val.to_i
		end
		def audio_entries_count=(val)
			@audio_entries_count = val.to_i
		end
		def mix_entries_count=(val)
			@mix_entries_count = val.to_i
		end
		def bandwidth=(val)
			@bandwidth = val.to_f
		end
		def total_storage=(val)
			@total_storage = val.to_f
		end
		def storage=(val)
			@storage = val.to_f
		end
		def deleted_storage=(val)
			@deleted_storage = val.to_f
		end
		def peak_storage=(val)
			@peak_storage = val.to_f
		end
		def avg_storage=(val)
			@avg_storage = val.to_f
		end
		def combined_storage_bandwidth=(val)
			@combined_storage_bandwidth = val.to_f
		end
		def transcoding_usage=(val)
			@transcoding_usage = val.to_f
		end

		def from_xml(xml_element)
			super
			self.partner_id = xml_element.elements['partnerId'].text
			self.partner_name = xml_element.elements['partnerName'].text
			self.partner_status = xml_element.elements['partnerStatus'].text
			self.partner_package = xml_element.elements['partnerPackage'].text
			self.partner_created_at = xml_element.elements['partnerCreatedAt'].text
			self.views = xml_element.elements['views'].text
			self.plays = xml_element.elements['plays'].text
			self.entries_count = xml_element.elements['entriesCount'].text
			self.total_entries_count = xml_element.elements['totalEntriesCount'].text
			self.video_entries_count = xml_element.elements['videoEntriesCount'].text
			self.image_entries_count = xml_element.elements['imageEntriesCount'].text
			self.audio_entries_count = xml_element.elements['audioEntriesCount'].text
			self.mix_entries_count = xml_element.elements['mixEntriesCount'].text
			self.bandwidth = xml_element.elements['bandwidth'].text
			self.total_storage = xml_element.elements['totalStorage'].text
			self.storage = xml_element.elements['storage'].text
			self.deleted_storage = xml_element.elements['deletedStorage'].text
			self.peak_storage = xml_element.elements['peakStorage'].text
			self.avg_storage = xml_element.elements['avgStorage'].text
			self.combined_storage_bandwidth = xml_element.elements['combinedStorageBandwidth'].text
			self.transcoding_usage = xml_element.elements['transcodingUsage'].text
			self.date_id = xml_element.elements['dateId'].text
		end

	end

	class KalturaPartnerUsageListResponse < KalturaListResponse
		attr_accessor :total
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.total = KalturaClientBase.object_from_xml(xml_element.elements['total'], 'KalturaVarPartnerUsageItem')
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaVarPartnerUsageItem')
		end

	end

	class KalturaVarPartnerUsageTotalItem < KalturaVarPartnerUsageItem


		def from_xml(xml_element)
			super
		end

	end


	# Utility service for the Multi-publishers console
	class KalturaVarConsoleService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Function which calulates partner usage of a group of a VAR's sub-publishers
		# @return [KalturaPartnerUsageListResponse]
		def get_partner_usage(partner_filter=KalturaNotImplemented, usage_filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'partnerFilter', partner_filter)
			client.add_param(kparams, 'usageFilter', usage_filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('varconsole_varconsole', 'getPartnerUsage', 'KalturaPartnerUsageListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Function to change a sub-publisher's status
		# @return []
		def update_status(id, status)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'status', status)
			client.queue_service_action_call('varconsole_varconsole', 'updateStatus', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :var_console_service
		def var_console_service
			if (@var_console_service == nil)
				@var_console_service = KalturaVarConsoleService.new(self)
			end
			return @var_console_service
		end
		
	end

end
